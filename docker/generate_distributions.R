# generate_distributions.R
library(ggplot2)
library(magrittr)

args <- commandArgs(trailingOnly = TRUE)

# Parsing command line arguments
mean1 <- as.numeric(args[1])
std_dev1 <- as.numeric(args[2])
num_samples1 <- as.integer(args[3])
mean2 <- as.numeric(args[4])
std_dev2 <- as.numeric(args[5])
num_samples2 <- as.integer(args[6])
seed <- as.integer(args[7])

# Set seed for reproducibility
set.seed(seed)

# Generating the two distributions
dist1 <- rnorm(num_samples1, mean1, std_dev1)
dist2 <- rnorm(num_samples2, mean2, std_dev2)

# Creating a dataframe
output_df <- data.frame(Distribution1 = dist1, Distribution2 = dist2)

# Save the dataframe to a CSV file in the specified output directory
output_path <- here::here("output", "data.csv")
write.csv(output_df, output_path, row.names = FALSE)

# Optionally, output the path or a success message to stdout
cat("Dataframe saved to", output_path, "\n")
