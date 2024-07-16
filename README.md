# Data Envelopment Analysis (DEA) Project

## Overview
This project applies Data Envelopment Analysis (DEA) to evaluate the efficiency of decision-making units (DMUs) using R. It focuses on optimizing performance across multiple inputs and outputs.

## Features
- Utilizes R to conduct DEA calculations.
- Analyzes efficiency metrics and benchmarks.
- Visualizes results using R packages like ggplot2.

## Technologies Used
- R
- DEA-R package
- ggplot2 for visualization

## Project Structure
- `/data`: Contains input data files.
- `/scripts`: R scripts for data preprocessing and DEA calculations.
- `/results`: Output files and visualizations.

## Usage
1. Clone the repository:
3. Run the scripts in `/scripts` to replicate the DEA analysis.
4. Explore the `/results` folder for generated outputs.

## Examples
### Example 1: Calculating Efficiency Scores
```R
# Load data
data <- read.csv("data/input_data.csv")

# Run DEA analysis
results <- dea(data$inputs, data$outputs, RTS="vrs")

# Print efficiency scores
print(results$efficiency)
