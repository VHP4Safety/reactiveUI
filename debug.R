## DEBUG
library(shiny)
library(shinydashboard)
library(tidyverse)

## Execute Docker-image-1

## Container 1 args
input <- list()

## dist 1
input$mean1 <- 0
input$std_dev1 <- 1
input$num_samples1 <- 100
## dist 2
input$mean2 <- 0
input$std_dev2 <- 1
input$num_samples2 <- 100

input$seed <- 123

local_dir <- here::here("output")

# Update Docker run command for the first container to mount the local directory
cmd1 <- sprintf("docker run --rm -v %s:/output docker-image-type1 %s %s %s %s %s %s %s",
                local_dir,
                input$mean1, input$std_dev1, input$num_samples1,
                input$mean2, input$std_dev2, input$num_samples2,
                input$seed)

# Execute the first Docker container
system(cmd1, intern = TRUE)

# Path to the CSV file in the host system
csv_path <- file.path(local_dir, "data.csv")

# Read the dataframe from the CSV file
df <- read.csv(csv_path, header = TRUE)

# Update Docker run command for the second container to mount the local directory
cmd2 <- sprintf("docker run --rm -v %s:/output docker-image-type2", local_dir)

# Execute the second Docker container
system(cmd2, intern = TRUE)

# Path to the plot image
plot_path <- file.path(local_dir, "plot.png")
