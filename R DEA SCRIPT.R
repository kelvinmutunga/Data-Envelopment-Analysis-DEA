library(Benchmarking)
# DMUs (Decision Making Units)

View(DATA)
dataa <- data.frame(X, Y)

# Define DMUs (Decision Making Units)
View(DATA)
dmus <- DATA[ ,c("dmu")]
dmus=data.frame(dmus)


# Specify inputs and outputs
inputs <- DATA[ ,c("Labourcost", "fassets", "Totopexpe")]
outputs <- DATA[,c("Totrev")]


# Logarithmic transformation (replace with your transformation function if needed)
inputs_log <- log(DATA[, c("Labourcost", "fassets", "Totopexpe")])
Output_log <- log(DATA[, c("Totrev")])
input1<-as.data.frame(lapply(inputs_log, as.numeric))
outputt1<-as.data.frame(lapply( Output_log, as.numeric))
# Perform DEA with vRS (Variable Returns to Scale) model (input-oriented)
model <- dea(inputs_log, Output_log, RTS = "CRS", ORIENTATION = "in")
View(model)
summary(model)

# Extract technical efficiency scores
technical_efficiency <- model$eff
# Extract efficiency scores
efficiency_scores <- model$eff
# Print technical efficiency scores
technical_efficiency 

# Linear regression for best fit line
fit <- lm(efficiency_scores ~ 1)

# Generate sequence for x-axis (optional, adjust range as needed)
x <- seq(min(efficiency_scores), max(efficiency_scores), length = 100)

# Assuming the first column of 'inputs' is the chosen input variable
plot(efficiency_scores, inputs[,1], type = "p", pch = "+", col = "blue", 
     xlab = "Efficiency Score", ylab = "Input 1 Value")
# Add best-fit line (replace lm with your preferred regression model)
abline(lm(inputs[,1] ~ efficiency_scores), col = "red")

abline(h = 1, col = "green", linetype = "dashed")  # Add reference line for 100% efficiency

# Customize the plot with title, legend, etc. (optional)
title("Efficiency Scores with Best Fit Line (vrs Input-Oriented)")
legend("topright", legend = c("Efficiency Scores", "Best Fit Line"), 
       col = c("blue", "red"), pch = c("+", NA))

Eff_scores=data.frame(efficiency_scores)
EffDmu_table<-