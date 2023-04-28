# R Study Hall - Predictive Modeling with R
# 4-28-2023
# Teacher: Nicole Turvey

#Classification Models -- Decision Tree Classifier 
# Load the iris dataset
data(iris)

# Split the dataset into training and test sets
set.seed(123)
train_indices <- sample(nrow(iris), 0.7*nrow(iris))
train_data <- iris[train_indices, ]
test_data <- iris[-train_indices, ]

# Train a linear discriminant analysis (LDA) model on the training data
library(MASS)
model <- lda(Species ~ ., data = train_data)

# Make predictions on the test data using the trained model
predicted <- predict(model, newdata = test_data)

print(predicted)

# Check the model
# precision, recall, F1: These functions compute precision, recall, and F1 score, 
# which are metrics commonly used in binary classification problems. 
# They measure the trade-off between precision (the proportion of 
# positive predictions that are correct), and recall (the proportion of actual positives that are correctly predicted). 
# The F1 score is the harmonic mean of precision and recall.

library(caret)
precision(predicted, test_data$Species, positive = "versicolor")
recall(predicted, test_data$Species, positive = "versicolor")
F1(predicted, test_data$Species, positive = "versicolor")


# Use the model
new_data <- data.frame(Sepal.Width = 2.0, Sepal.Length = 5.0, Petal.Length = 3.5, Petal.Width = 1.0)
predicted_Species <- predict(model, new_data)

#Print Results
print(predicted_Species)

# Time-Series modeling 
# Load the AirPassengers dataset
data(AirPassengers)

# Convert the data to a time series object
ts_data <- ts(AirPassengers, start = c(1949, 1), frequency = 12)

# Plot the time series data
plot(ts_data, main = "International Airline Passengers")

# Fit an ARIMA(2,1,2) model to the data
# An ARIMA(2,1,2) model is a type of time series model that combines autoregressive (AR), 
# differencing (I), 
# and moving average (MA) components. 
# The three numbers in the ARIMA(p,d,q) notation refer to the order of the AR, I, and MA components, respectively.
model <- arima(ts_data, order = c(2,1,2))

# Print a summary of the model
summary(model)

# Plot the residuals of the model
plot(resid(model), main = "Residuals of ARIMA Model")

# Make predictions for the next 12 months
pred <- predict(model, n.ahead = 12)

# Plot the predicted values
plot(ts_data, main = "International Airline Passengers with Predictions")
lines(pred$pred, col = "red")
