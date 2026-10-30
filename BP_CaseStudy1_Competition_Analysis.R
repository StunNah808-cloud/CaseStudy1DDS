competition <- Bronson_Pada_Competition_

# Verify the dataset
dim(competition)
names(competition)
head(competition)

# Select the same predictors as the original model

predictor_names <- c(
  "Age",
  "MonthlyIncome",
  "OverTime",
  "JobSatisfaction",
  "JobInvolvement",
  "WorkLifeBalance",
  "EnvironmentSatisfaction",
  "RelationshipSatisfaction",
  "BusinessTravel",
  "DistanceFromHome",
  "YearsAtCompany"
)

# Confirm all predictors exist

setdiff(predictor_names, names(competition))

# Create competition predictor dataset

competition_model <- competition[, predictor_names, drop = FALSE]

# Verify dimensions

dim(competition_model)

# Display first six records

head(competition_model)

# Verify original employee dataset

dim(employee_data)

names(employee_data)

table(employee_data$Attrition)

# Prepare original employee data for modeling

library(caret)

employee_data$Attrition <- factor(
  employee_data$Attrition,
  levels = c("No", "Yes")
)

# Select the same predictors as the original model

model_data <- employee_data[, c(
  predictor_names,
  "Attrition"
)]

# Create training and validation datasets

set.seed(123)

train_index <- createDataPartition(
  model_data$Attrition,
  p = 0.70,
  list = FALSE
)

train_data <- model_data[train_index, ]
test_data <- model_data[-train_index, ]

# Confirm dataset sizes

dim(train_data)
dim(test_data)

# Confirm attrition distribution

table(train_data$Attrition)
table(test_data$Attrition)

# Train Naive Bayes classification model

library(caret)
library(klaR)

set.seed(123)

ctrl <- trainControl(
  method = "repeatedcv",
  number = 10,
  repeats = 3,
  classProbs = TRUE,
  savePredictions = "final"
)

nbFit <- train(
  Attrition ~ .,
  data = train_data,
  method = "nb",
  trControl = ctrl
)

# Display Naive Bayes model results

nbFit

# Confirm model was created

exists("nbFit")

# Predict attrition probabilities on validation data

nb_prob <- predict(
  nbFit,
  newdata = test_data,
  type = "prob"
)

# Apply 20 percent probability threshold

nb_pred20 <- factor(
  ifelse(nb_prob$Yes >= 0.20, "Yes", "No"),
  levels = c("No", "Yes")
)

# Evaluate validation performance

nb_cm20 <- confusionMatrix(
  data = nb_pred20,
  reference = test_data$Attrition,
  positive = "Yes"
)

# Display confusion matrix and performance

nb_cm20

# Display key performance metrics

c(
  Accuracy = unname(nb_cm20$overall["Accuracy"]),
  Sensitivity = unname(nb_cm20$byClass["Sensitivity"]),
  Specificity = unname(nb_cm20$byClass["Specificity"])
)

# Check assignment requirements

nb_cm20$byClass["Sensitivity"] >= 0.60
nb_cm20$byClass["Specificity"] >= 0.60

# Predict attrition probabilities for competition employees

competition_prob <- predict(
  nbFit,
  newdata = competition_model,
  type = "prob"
)

# Plot Naive Bayes model performance

model_metrics <- c(
  Accuracy = as.numeric(nb_cm20$overall["Accuracy"]) * 100,
  Sensitivity = as.numeric(nb_cm20$byClass["Sensitivity"]) * 100,
  Specificity = as.numeric(nb_cm20$byClass["Specificity"]) * 100
)

barplot(
  model_metrics,
  main = "Naive Bayes Model Performance",
  ylab = "Performance (%)",
  col = c("steelblue", "darkcyan", "seagreen"),
  ylim = c(0, 100)
)

abline(h = 60, col = "red", lty = 2, lwd = 2)

legend(
  "topright",
  legend = "60% Minimum Requirement",
  col = "red",
  lty = 2,
  bty = "n"
)

# Apply 20 percent probability threshold

competition_pred <- ifelse(
  competition_prob$Yes >= 0.20,
  "Yes",
  "No"
)

# Create competition submission dataset

competition_results <- data.frame(
  ID = competition$ID,
  Attrition = competition_pred
)

# Sort predictions by employee ID

competition_results <- competition_results[
  order(competition_results$ID),
]

# Verify competition predictions

dim(competition_results)

head(competition_results)

table(competition_results$Attrition)

# Confirm all 300 employees have predictions

stopifnot(nrow(competition_results) == 300)
stopifnot(!anyNA(competition_results))
stopifnot(!anyDuplicated(competition_results$ID))

# Export competition predictions

write.csv(
  competition_results,
  "Case1PredictionsPada Attrition.csv",
  row.names = FALSE
)

# Confirm exported file location

getwd()
file.exists("Case1PredictionsPada Attrition.csv")

# Plot competition employee attrition predictions

competition_counts <- table(competition_results$Attrition)

barplot(
  competition_counts[c("No", "Yes")],
  main = "Competition Employee Attrition Predictions",
  xlab = "Predicted Attrition",
  ylab = "Number of Employees",
  col = c("steelblue", "tomato"),
  ylim = c(0, 250)
)

# Display prediction totals

competition_counts
# Create Naive Bayes validation confusion matrix

nb_matrix <- matrix(
  c(165, 54, 13, 29),
  nrow = 2,
  byrow = TRUE
)

rownames(nb_matrix) <- c("Actual No", "Actual Yes")
colnames(nb_matrix) <- c("Predicted No", "Predicted Yes")

# Display confusion matrix

nb_matrix


# Calculate prediction percentages

round(prop.table(competition_counts) * 100, 2)

# Display confusion matrix

nb_matrix

# Create confusion matrix visualization

barplot(
  nb_matrix,
  beside = TRUE,
  main = "Naive Bayes Validation Results",
  xlab = "Predicted Attrition",
  ylab = "Number of Employees",
  col = c("steelblue", "tomato"),
  legend.text = rownames(nb_matrix),
  args.legend = list(x = "topright"),
  ylim = c(0, 190)
)


# Review Naive Bayes cross-validation results

nbFit$results

# Calculate training cross-validation performance

nb_train_pred <- nbFit$pred

head(nb_train_pred)

# Confirm saved prediction records

dim(nb_train_pred)

# Review training predictions at 20% threshold

nb_train_pred$Predicted20 <- factor(
  ifelse(nb_train_pred$Yes >= 0.20, "Yes", "No"),
  levels = c("No", "Yes")
)

# Calculate training cross-validation confusion matrix

nb_train_cm20 <- confusionMatrix(
  nb_train_pred$Predicted20,
  nb_train_pred$obs,
  positive = "Yes"
)

nb_train_cm20

# Display training performance metrics

c(
  Accuracy = unname(nb_train_cm20$overall["Accuracy"]),
  Sensitivity = unname(nb_train_cm20$byClass["Sensitivity"]),
  Specificity = unname(nb_train_cm20$byClass["Specificity"])
)


# Compare Naive Bayes training and testing performance

training_metrics <- c(
  Accuracy = unname(nb_train_cm20$overall["Accuracy"]),
  Sensitivity = unname(nb_train_cm20$byClass["Sensitivity"]),
  Specificity = unname(nb_train_cm20$byClass["Specificity"])
)

testing_metrics <- c(
  Accuracy = unname(nb_cm20$overall["Accuracy"]),
  Sensitivity = unname(nb_cm20$byClass["Sensitivity"]),
  Specificity = unname(nb_cm20$byClass["Specificity"])
)

# Prepare comparison chart data

performance_matrix <- rbind(
  Training = training_metrics * 100,
  Testing = testing_metrics * 100
)

round(performance_matrix, 2)

# Plot training versus testing results

barplot(
  performance_matrix,
  beside = TRUE,
  main = "Naive Bayes Training vs Testing Performance",
  xlab = "Performance Metrics",
  ylab = "Performance (%)",
  col = c("steelblue", "tomato"),
  ylim = c(0, 100),
  legend.text = TRUE,
  args.legend = list(x = "topright")
)

abline(h = 60, col = "red", lty = 2, lwd = 2)


# Verify final competition submission

submitted_predictions <- read.csv(
  "Case1PredictionsPada Attrition.csv"
)

# Confirm submission dimensions

dim(submitted_predictions)

# Confirm required column names

names(submitted_predictions)

# Check missing values

colSums(is.na(submitted_predictions))

# Check duplicate employee IDs

sum(duplicated(submitted_predictions$ID))

# Confirm prediction distribution

table(submitted_predictions$Attrition)

# Verify all 300 employee records

stopifnot(
  nrow(submitted_predictions) == 300,
  identical(names(submitted_predictions), c("ID", "Attrition")),
  !anyNA(submitted_predictions),
  !anyDuplicated(submitted_predictions$ID),
  all(submitted_predictions$Attrition %in% c("No", "Yes"))
)

# Confirm submission is ready

print("Competition submission validation passed")

