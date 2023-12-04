# analyze_distributions.R
library(ggplot2)
library(broom)
library(tidyr)
library(readr)
library(magrittr)

args <- commandArgs(trailingOnly = TRUE)

## Reading data from local file
#input_data <- read.csv(file = 'stdin', header = TRUE)
input_data <- read.csv(file = here::here("output", "data.csv"), header = TRUE)

# T-test
#t_test_result <- t.test(input_data$Distribution1, input_data$Distribution2) |>
#  broom::tidy()

# Construct the ggplot object
p <- input_data %>%
  pivot_longer(
    Distribution1:Distribution2,
    values_to = 'value',
    names_to = 'distributions'
  ) %>%
  ggplot2::ggplot() +
  geom_histogram(aes(x = value, fill = distributions), alpha = 0.8) +
  ggtitle("Frequency Distributions") +
  theme_minimal()

# Save the plot to an image file
plot_path <- here::here("output", "plot.png") # Specify a path for the plot
ggsave(plot_path, plot = p, width = 8, height = 6)

# Save T-test results
#write_rds(t_test_result, file = here::here("output", "t-test-results.rds"))

# Optionally, output the path or a success message to stdout
cat("Plot saved to", plot_path, "\n")
