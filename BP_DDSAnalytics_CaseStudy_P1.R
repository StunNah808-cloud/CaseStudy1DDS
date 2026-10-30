
# Phase 1 - Step 2: Inspect Data Quality

# Check variable types
str(employee_data)

# Count missing values in each column
colSums(is.na(employee_data))

# Count total missing values
sum(is.na(employee_data))

# Summarize employee data
summary(employee_data)


# Check total missing values
sum(is.na(employee_data))

# Identify columns containing missing values
colSums(is.na(employee_data))[colSums(is.na(employee_data)) > 0]


# Phase 1 - Step 3: Analyze Employee Attrition

# Count employees by attrition status
table(employee_data$Attrition)

# Calculate attrition percentages
round(prop.table(table(employee_data$Attrition)) * 100, 2)

# Create a bar chart of employee attrition
barplot(
  table(employee_data$Attrition),
  main = "Employee Attrition Distribution",
  xlab = "Attrition Status",
  ylab = "Number of Employees",
  col = c("steelblue", "tomato")
)


# Phase 1 - Step 4A: Age and Employee Attrition

# Compare average age by attrition status
aggregate(Age ~ Attrition,
          data = employee_data,
          FUN = mean)

# Create boxplot comparing employee age
boxplot(
  Age ~ Attrition,
  data = employee_data,
  main = "Employee Age by Attrition Status",
  xlab = "Attrition Status",
  ylab = "Employee Age",
  col = c("steelblue", "tomato")
)


# Phase 1 - Step 4B: Monthly Income and Attrition

# Compare average monthly income by attrition
aggregate(MonthlyIncome ~ Attrition,
          data = employee_data,
          FUN = mean)

# Create boxplot comparing monthly income
boxplot(
  MonthlyIncome ~ Attrition,
  data = employee_data,
  main = "Monthly Income by Attrition Status",
  xlab = "Attrition Status",
  ylab = "Monthly Income ($)",
  col = c("steelblue", "tomato")
)


# Phase 1 - Step 4C: Job Satisfaction and Attrition

# Count employees by job satisfaction and attrition
table(employee_data$JobSatisfaction,
      employee_data$Attrition)

# Calculate attrition rate for each satisfaction level
round(
  prop.table(
    table(employee_data$JobSatisfaction,
          employee_data$Attrition),
    margin = 1
  ) * 100,
  2
)

# Create bar chart
barplot(
  table(employee_data$JobSatisfaction,
        employee_data$Attrition),
  beside = TRUE,
  legend.text = TRUE,
  main = "Job Satisfaction by Attrition Status",
  xlab = "Attrition Status",
  ylab = "Number of Employees",
  col = c("steelblue", "skyblue", "orange", "tomato")
)


# Phase 1 - Step 4D: Overtime and Attrition

# Count employees by overtime and attrition
table(employee_data$OverTime,
      employee_data$Attrition)

# Calculate attrition percentages by overtime
round(
  prop.table(
    table(employee_data$OverTime,
          employee_data$Attrition),
    margin = 1
  ) * 100,
  2
)

# Create bar chart
barplot(
  table(employee_data$OverTime,
        employee_data$Attrition),
  beside = TRUE,
  legend.text = TRUE,
  main = "Overtime by Attrition Status",
  xlab = "Attrition Status",
  ylab = "Number of Employees",
  col = c("steelblue", "tomato")
)


# Phase 1 - Step 4E: Business Travel and Attrition

# Count employees by business travel and attrition
table(employee_data$BusinessTravel,
      employee_data$Attrition)

# Calculate attrition percentages by travel category
round(
  prop.table(
    table(employee_data$BusinessTravel,
          employee_data$Attrition),
    margin = 1
  ) * 100,
  2
)


# Step 4E - Business Travel Attrition Rate Chart

travel_table <- table(
  employee_data$BusinessTravel,
  employee_data$Attrition
)

travel_rates <- prop.table(travel_table, margin = 1)[, "Yes"] * 100

barplot(
  travel_rates,
  main = "Attrition Rate by Business Travel",
  xlab = "Business Travel",
  ylab = "Attrition Rate (%)",
  col = c("steelblue", "skyblue", "tomato"),
  ylim = c(0, 30),
  las = 2,
  cex.names = 0.8
)


# Phase 1 - Step 4F: Distance From Home and Attrition

# Compare average distance from home by attrition status
aggregate(
  DistanceFromHome ~ Attrition,
  data = employee_data,
  FUN = mean
)

# Create boxplot comparing distance from home
boxplot(
  DistanceFromHome ~ Attrition,
  data = employee_data,
  main = "Distance From Home by Attrition Status",
  xlab = "Attrition Status",
  ylab = "Distance From Home",
  col = c("steelblue", "tomato")
)


# Phase 1 - Step 4G: Years at Company and Attrition

# Compare average years at company by attrition status
aggregate(
  YearsAtCompany ~ Attrition,
  data = employee_data,
  FUN = mean
)

# Create boxplot comparing years at company
boxplot(
  YearsAtCompany ~ Attrition,
  data = employee_data,
  main = "Years at Company by Attrition Status",
  xlab = "Attrition Status",
  ylab = "Years at Company",
  col = c("steelblue", "tomato")
)


# Phase 1 - Step 4H: Work-Life Balance and Attrition

# Count employees by work-life balance and attrition
table(
  employee_data$WorkLifeBalance,
  employee_data$Attrition
)

# Calculate attrition percentages for each work-life balance rating
round(
  prop.table(
    table(
      employee_data$WorkLifeBalance,
      employee_data$Attrition
    ),
    margin = 1
  ) * 100,
  2
)

# Create bar chart of attrition rates
wlb_table <- table(
  employee_data$WorkLifeBalance,
  employee_data$Attrition
)

wlb_rates <- prop.table(wlb_table, margin = 1)[, "Yes"] * 100

barplot(
  wlb_rates,
  main = "Attrition Rate by Work-Life Balance",
  xlab = "Work-Life Balance Rating",
  ylab = "Attrition Rate (%)",
  col = c("steelblue", "skyblue", "orange", "tomato"),
  ylim = c(0, 40),
  names.arg = c("1 - Bad", "2 - Good", "3 - Better", "4 - Best")
)


# Phase 1 - Step 4I: Job Involvement and Employee Attrition

# Count employees by job involvement and attrition
table(employee_data$JobInvolvement,
      employee_data$Attrition)

# Calculate attrition percentages for each involvement level
round(
  prop.table(
    table(employee_data$JobInvolvement,
          employee_data$Attrition),
    margin = 1
  ) * 100,
  2
)

# Create bar chart of attrition rates
ji_table <- table(
  employee_data$JobInvolvement,
  employee_data$Attrition
)

ji_rates <- prop.table(ji_table, margin = 1)[, "Yes"] * 100

barplot(
  ji_rates,
  main = "Attrition Rate by Job Involvement",
  xlab = "Job Involvement Rating",
  ylab = "Attrition Rate (%)",
  col = c("steelblue", "skyblue", "orange", "tomato"),
  ylim = c(0, max(ji_rates) + 5),
  names.arg = c("1 - Low", "2 - Medium",
                "3 - High", "4 - Very High")
)


# Phase 1 - Step 4J: Environment Satisfaction and Employee Attrition

# Count employees by environment satisfaction and attrition
table(employee_data$EnvironmentSatisfaction,
      employee_data$Attrition)

# Calculate attrition percentages for each satisfaction level
round(
  prop.table(
    table(employee_data$EnvironmentSatisfaction,
          employee_data$Attrition),
    margin = 1
  ) * 100,
  2
)

# Create bar chart of attrition rates
es_table <- table(
  employee_data$EnvironmentSatisfaction,
  employee_data$Attrition
)

es_rates <- prop.table(es_table, margin = 1)[, "Yes"] * 100

barplot(
  es_rates,
  main = "Attrition Rate by Environment Satisfaction",
  xlab = "Environment Satisfaction Rating",
  ylab = "Attrition Rate (%)",
  col = c("steelblue", "skyblue", "orange", "tomato"),
  ylim = c(0, max(es_rates) + 5),
  names.arg = c("1 - Low", "2 - Medium",
                "3 - High", "4 - Very High")
)


# Phase 1 - Step 4K: Relationship Satisfaction and Employee Attrition

# Count employees by relationship satisfaction and attrition
table(employee_data$RelationshipSatisfaction,
      employee_data$Attrition)

# Calculate attrition percentages for each satisfaction level
round(
  prop.table(
    table(employee_data$RelationshipSatisfaction,
          employee_data$Attrition),
    margin = 1
  ) * 100,
  2
)

# Create bar chart of attrition rates
rs_table <- table(
  employee_data$RelationshipSatisfaction,
  employee_data$Attrition
)

rs_rates <- prop.table(rs_table, margin = 1)[, "Yes"] * 100

barplot(
  rs_rates,
  main = "Attrition Rate by Relationship Satisfaction",
  xlab = "Relationship Satisfaction Rating",
  ylab = "Attrition Rate (%)",
  col = c("steelblue", "skyblue", "orange", "tomato"),
  ylim = c(0, max(rs_rates) + 5),
  names.arg = c("1 - Low", "2 - Medium",
                "3 - High", "4 - Very High")
)

# Phase 1 - Step 5A: Prepare Data for Classification Models

# Confirm dataset size
dim(employee_data)

# Check employee attrition counts
table(employee_data$Attrition)

# Convert Attrition into a factor
employee_data$Attrition <- factor(
  employee_data$Attrition,
  levels = c("No", "Yes")
)

# Select initial predictor variables
model_data <- employee_data[, c(
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
  "YearsAtCompany",
  "Attrition"
)]

# Convert categorical predictors to factors
model_data$OverTime <- factor(model_data$OverTime)
model_data$BusinessTravel <- factor(model_data$BusinessTravel)

# Check structure and dataset size
str(model_data)
dim(model_data)

# Confirm attrition counts
table(model_data$Attrition)

# Phase 1 - Step 5B: Create Training and Testing Data

library(caret)

set.seed(123)

# Split data into 70% training and 30% testing
train_index <- createDataPartition(
  model_data$Attrition,
  p = 0.70,
  list = FALSE
)

# Create training and testing datasets
train_data <- model_data[train_index, ]
test_data <- model_data[-train_index, ]

# Confirm dataset sizes
dim(train_data)
dim(test_data)

# Check attrition counts
table(train_data$Attrition)
table(test_data$Attrition)
train_data <- model_data[train_index, ]
test_data <- model_data[-train_index, ]

# Confirm dataset sizes
dim(train_data)
dim(test_data)

# Check attrition distribution in each group
table(train_data$Attrition)
table(test_data$Attrition)

# Phase 1 - Step 5C: k-NN Model

library(caret)

# Repeated 10-fold cross-validation
ctrl <- trainControl(
  method = "repeatedcv",
  repeats = 3
)

# Train k-NN model
knnFit <- train(
  Attrition ~ .,
  data = train_data,
  method = "knn",
  trControl = ctrl,
  preProcess = c("center", "scale"),
  tuneLength = 20
)

# Display model results
knnFit

# Phase 1 - Step 5E: Evaluate k-NN Model

# Predict attrition using testing data
knnPredict <- predict(knnFit, newdata = test_data)

# Display confusion matrix
confusionMatrix(
  knnPredict,
  test_data$Attrition,
  positive = "Yes"
)

# Phase 1 - Step 5F: Naive Bayes Model

library(klaR)

# Train Naive Bayes model
nbFit <- train(
  Attrition ~ .,
  data = train_data,
  method = "nb",
  trControl = ctrl
)

# Display model results
nbFit

# Phase 1 - Step 5G: Evaluate Naive Bayes Model

# Predict attrition using testing data
nbPredict <- predict(nbFit, newdata = test_data)

# Display confusion matrix
confusionMatrix(
  nbPredict,
  test_data$Attrition,
  positive = "Yes"
)

# Phase 1 - Step 5H: Compare k-NN and Naive Bayes

# Save the confusion matrix results
knnCM <- confusionMatrix(
  knnPredict,
  test_data$Attrition,
  positive = "Yes"
)

nbCM <- confusionMatrix(
  nbPredict,
  test_data$Attrition,
  positive = "Yes"
)

# Create a comparison table
model_comparison <- data.frame(
  Model = c("k-NN", "Naive Bayes"),
  Accuracy = c(knnCM$overall["Accuracy"],
               nbCM$overall["Accuracy"]),
  Sensitivity = c(knnCM$byClass["Sensitivity"],
                  nbCM$byClass["Sensitivity"]),
  Specificity = c(knnCM$byClass["Specificity"],
                  nbCM$byClass["Specificity"])
)

# Display comparison
print(model_comparison)

# Phase 1 - Step 6A: Job Involvement and Attrition

# Count employees by Job Involvement and Attrition
table(
  employee_data$JobInvolvement,
  employee_data$Attrition
)

# Calculate attrition percentages
round(
  prop.table(
    table(
      employee_data$JobInvolvement,
      employee_data$Attrition
    ),
    margin = 1
  ) * 100,
  2
)

# Phase 1 - Step 6B: Work-Life Balance and Attrition

# Count employees by Work-Life Balance and Attrition
table(
  employee_data$WorkLifeBalance,
  employee_data$Attrition
)

# Calculate attrition percentages
round(
  prop.table(
    table(
      employee_data$WorkLifeBalance,
      employee_data$Attrition
    ),
    margin = 1
  ) * 100,
  2
)

# Phase 1 - Step 6C: Overtime and Attrition

# Count employees by Overtime and Attrition
table(
  employee_data$OverTime,
  employee_data$Attrition
)

# Calculate attrition percentages
round(
  prop.table(
    table(
      employee_data$OverTime,
      employee_data$Attrition
    ),
    margin = 1
  ) * 100,
  2
)

# Phase 1 - Step 6D: Job Involvement Chart

job_rates <- prop.table(
  table(employee_data$JobInvolvement,
        employee_data$Attrition),
  margin = 1
) * 100

barplot(
  job_rates[, "Yes"],
  main = "Employee Attrition by Job Involvement",
  xlab = "Job Involvement Rating",
  ylab = "Attrition Rate (%)",
  col = "steelblue",
  ylim = c(0, 55)
)

# Phase 1 - Step 6D: Work-Life Balance Chart

worklife_rates <- prop.table(
  table(employee_data$WorkLifeBalance,
        employee_data$Attrition),
  margin = 1
) * 100

barplot(
  worklife_rates[, "Yes"],
  main = "Employee Attrition by Work-Life Balance",
  xlab = "Work-Life Balance Rating",
  ylab = "Attrition Rate (%)",
  col = "steelblue",
  ylim = c(0, 45)
)

# Phase 1 - Step 6D: Overtime Chart

overtime_rates <- prop.table(
  table(employee_data$OverTime,
        employee_data$Attrition),
  margin = 1
) * 100

barplot(
  overtime_rates[, "Yes"],
  main = "Employee Attrition by Overtime",
  xlab = "Works Overtime",
  ylab = "Attrition Rate (%)",
  col = "steelblue",
  ylim = c(0, 40)
)

# Phase 1 - Step 6E: Summary of Attrition Factors

attrition_summary <- data.frame(
  Factor = c("Job Involvement",
             "Work-Life Balance",
             "Overtime"),
  Group = c("Rating 1 - Low",
            "Rating 1 - Bad",
            "Yes"),
  Attrition_Rate = c(
    round(job_rates["1", "Yes"], 2),
    round(worklife_rates["1", "Yes"], 2),
    round(overtime_rates["Yes", "Yes"], 2)
  )
)

print(attrition_summary)


# Phase 1 - Step 7A: Employee Attrition Financial Analysis

# Average monthly income by attrition status
aggregate(
  MonthlyIncome ~ Attrition,
  data = employee_data,
  FUN = mean
)

# Average annual income for employees who left
mean(
  employee_data$MonthlyIncome[
    employee_data$Attrition == "Yes"
  ]
) * 12

# Phase 1 - Step 7B: Employee Replacement Costs

# Calculate average annual income for employees who left
annual_income <- mean(
  employee_data$MonthlyIncome[
    employee_data$Attrition == "Yes"
  ]
) * 12

# Calculate replacement costs at different salary percentages
replacement_costs <- data.frame(
  Scenario = c("50%", "100%", "200%", "400%"),
  Replacement_Cost = round(
    annual_income * c(0.50, 1.00, 2.00, 4.00),
    2
  )
)

# Display replacement cost estimates
print(replacement_costs)

# Phase 1 - Step 7C: Retention Intervention Cost

# Count total employees
total_employees <- nrow(employee_data)

# Intervention cost per employee
intervention_cost <- 200

# Calculate total intervention cost
total_intervention_cost <- total_employees * intervention_cost

# Display results
total_employees
total_intervention_cost

# Phase 1 - Step 7D: Break-Even Analysis

# Calculate employees needed to break even
break_even <- ceiling(
  total_intervention_cost /
    replacement_costs$Replacement_Cost
)

# Create break-even table
break_even_summary <- data.frame(
  Scenario = replacement_costs$Scenario,
  Replacement_Cost = replacement_costs$Replacement_Cost,
  Employees_Needed = break_even
)

# Display results
print(break_even_summary)

# Phase 1 - Step 7D: Break-Even Analysis

# Calculate departures prevented to cover program cost
break_even <- ceiling(
  total_intervention_cost /
    replacement_costs$Replacement_Cost
)

# Create break-even summary table
break_even_summary <- data.frame(
  Scenario = replacement_costs$Scenario,
  Replacement_Cost = replacement_costs$Replacement_Cost,
  Employees_Needed = break_even
)

# Display results
print(break_even_summary)

# Phase 1 - Step 7E: Potential Net Savings

# Calculate avoided replacement costs
avoided_costs <- break_even_summary$Employees_Needed *
  break_even_summary$Replacement_Cost

# Calculate net savings after intervention cost
net_savings <- avoided_costs - total_intervention_cost

# Create financial summary
savings_summary <- data.frame(
  Scenario = break_even_summary$Scenario,
  Departures_Prevented = break_even_summary$Employees_Needed,
  Avoided_Costs = round(avoided_costs, 2),
  Program_Cost = total_intervention_cost,
  Net_Savings = round(net_savings, 2)
)

# Display results
print(savings_summary)


# Phase 1 - Step 7F: Potential Net Savings Chart

barplot(
  savings_summary$Net_Savings,
  names.arg = savings_summary$Scenario,
  main = "Potential Net Savings by Replacement Cost",
  xlab = "Replacement Cost Scenario",
  ylab = "Net Savings ($)",
  col = "steelblue",
  ylim = c(0, 65000)
)


# Phase 1 - Step 8A: Final Case Study Summary

# Compare the two classification models
print(model_comparison)

# Display the three selected attrition factors
print(attrition_summary)

# Display employee replacement costs
print(replacement_costs)

# Display retention program break-even results
print(break_even_summary)

# Display potential financial savings
print(savings_summary)

# Naive Bayes validation setup

library(caret)

set.seed(123)

nbControl60 <- trainControl(
  method = "repeatedcv",
  number = 10,
  repeats = 3,
  classProbs = TRUE,
  savePredictions = "final"
)

print(nbControl60)

# Naive Bayes model with saved validation predictions

set.seed(123)

nbFit60 <- train(
  formula(nbFit),
  data = train_data,
  method = "nb",
  trControl = nbControl60,
  tuneGrid = nbFit$bestTune
)

# Check saved Naive Bayes validation predictions

print(nbFit60)

head(nbFit60$pred)

nrow(nbFit60$pred)

# Compare Naive Bayes probability thresholds

nb_thresholds <- c(0.50, 0.40, 0.30, 0.20)

nb_results <- data.frame(
  Threshold = nb_thresholds,
  Sensitivity = NA_real_,
  Specificity = NA_real_,
  Accuracy = NA_real_
)

for (i in seq_along(nb_thresholds)) {
  predicted <- ifelse(
    nbFit60$pred$Yes >= nb_thresholds[i],
    "Yes", "No"
  )
  
  actual <- nbFit60$pred$obs
  
  TP <- sum(predicted == "Yes" & actual == "Yes")
  FN <- sum(predicted == "No" & actual == "Yes")
  TN <- sum(predicted == "No" & actual == "No")
  FP <- sum(predicted == "Yes" & actual == "No")
  
  nb_results$Sensitivity[i] <- 100 * TP / (TP + FN)
  nb_results$Specificity[i] <- 100 * TN / (TN + FP)
  nb_results$Accuracy[i] <- 100 * (TP + TN) /
    (TP + FN + TN + FP)
}

print(round(nb_results, 2))

print(nbFit60)

# Naive Bayes test results at 30% threshold

nbTestProb60 <- predict(
  nbFit60,
  newdata = test_data,
  type = "prob"
)

nbPred30 <- factor(
  ifelse(nbTestProb60$Yes >= 0.30, "Yes", "No"),
  levels = c("No", "Yes")
)

nbCM30 <- confusionMatrix(
  nbPred30,
  test_data$Attrition,
  positive = "Yes"
)

print(nbCM30)

# Naive Bayes test results at 20% threshold

nbPred20 <- factor(
  ifelse(nbTestProb60$Yes >= 0.20, "Yes", "No"),
  levels = c("No", "Yes")
)

nbCM20 <- confusionMatrix(
  nbPred20,
  test_data$Attrition,
  positive = "Yes"
)

print(nbCM20)

# k-NN model check

print(knnFit)

print(knnFit$control$classProbs)

print(knnFit$bestTune)

# k-NN validation setup with class probabilities

set.seed(123)

knnControl60 <- trainControl(
  method = "repeatedcv",
  number = 10,
  repeats = 3,
  classProbs = TRUE,
  savePredictions = "final"
)

print(knnControl60)

# k-NN validation setup with class probabilities

set.seed(123)

knnControl60 <- trainControl(
  method = "repeatedcv",
  number = 10,
  repeats = 3,
  classProbs = TRUE,
  savePredictions = "final"
)

print(knnControl60)

# k-NN model with saved validation probabilities

set.seed(123)

knnFit60 <- train(
  formula(knnFit),
  data = train_data,
  method = "knn",
  trControl = knnControl60,
  preProcess = knnFit$preProcess$method,
  tuneGrid = knnFit$bestTune
)

print(knnFit60)

# k-NN validation sensitivity at different thresholds

knn_results <- data.frame(
  Threshold = c(0.50, 0.40, 0.30, 0.20),
  Sensitivity = NA_real_
)

for (i in 1:nrow(knn_results)) {
  
  predicted <- ifelse(
    knnFit60$pred$Yes >= knn_results$Threshold[i],
    "Yes", "No"
  )
  
  actual <- knnFit60$pred$obs
  
  TP <- sum(predicted == "Yes" & actual == "Yes")
  FN <- sum(predicted == "No" & actual == "Yes")
  
  knn_results$Sensitivity[i] <- 100 * TP / (TP + FN)
}

print(round(knn_results, 2))

# k-NN sensitivity at 10% threshold

predicted10 <- ifelse(
  knnFit60$pred$Yes >= 0.10,
  "Yes", "No"
)

actual10 <- knnFit60$pred$obs

TP10 <- sum(predicted10 == "Yes" & actual10 == "Yes")
FN10 <- sum(predicted10 == "No" & actual10 == "Yes")
TN10 <- sum(predicted10 == "No" & actual10 == "No")
FP10 <- sum(predicted10 == "Yes" & actual10 == "No")

data.frame(
  Threshold = 0.10,
  Sensitivity = round(100 * TP10 / (TP10 + FN10), 2),
  Specificity = round(100 * TN10 / (TN10 + FP10), 2),
  Accuracy = round(100 * (TP10 + TN10) /
                     (TP10 + FN10 + TN10 + FP10), 2)
)

# k-NN test results at 10% threshold

knnTestProb60 <- predict(
  knnFit60,
  newdata = test_data,
  type = "prob"
)

knnPred10 <- factor(
  ifelse(knnTestProb60$Yes >= 0.10, "Yes", "No"),
  levels = c("No", "Yes")
)

knnCM10 <- confusionMatrix(
  knnPred10,
  test_data$Attrition,
  positive = "Yes"
)

print(knnCM10)







