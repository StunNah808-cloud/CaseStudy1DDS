# CaseStudy1DDS
MSDS 6306 - DDSAnalytics Frito Lay Employee Attrition Case Study
## Executive Summary

MSDS 6306 – Doing Data Science
Case Study 1: DDSAnalytics – Frito Lay Employee Attrition

The purpose of this case study is to analyze employee attrition at Frito Lay and identify factors associated with employees leaving the company. DDSAnalytics was tasked with examining employee data, developing classification models to predict attrition, and estimating the potential financial impact of employee retention efforts.

The dataset contained 870 employees, including 730 employees who remained with the company (83.91%) and 140 employees who left (16.09%). Exploratory data analysis identified three important factors associated with higher attrition: job involvement, work-life balance, and overtime. Employees with low job involvement had an attrition rate of 46.81%, employees reporting poor work-life balance had an attrition rate of 35.42%, and employees working overtime had an attrition rate of 31.75%.

Two classification models, k-Nearest Neighbors (k-NN) and Naive Bayes, were evaluated using accuracy, sensitivity, and specificity. On the 261-employee test set, the adjusted Naive Bayes model achieved 74.33% accuracy, 69.05% sensitivity, and 75.34% specificity. The adjusted k-NN model achieved 48.66% accuracy, 85.71% sensitivity, and 41.55% specificity. Naive Bayes was selected for the competition predictions because it met the minimum 60% sensitivity and specificity requirements on the evaluated training and testing sets.

The financial analysis estimated employee replacement costs ranging from 50% to 400% of annual salary. Using an illustrative $200 retention incentive per employee, the analysis demonstrated how preventing employee departures could potentially offset retention program costs.

Overall, the findings suggest that Frito Lay should focus retention efforts on employees with low job involvement, poor work-life balance, and overtime responsibilities. The Naive Bayes classification model provides a method for identifying employees who may be at greater risk of leaving, while additional evaluation would be needed to determine actual financial savings.

Project Files

The repository contains the completed Frito Lay Employee Attrition Case Study, including:

BP_CaseStudy1_DDSAnalytics.Rmd – R Markdown source file containing the statistical analysis, predictive modeling, and financial evaluation.

BP_CaseStudy1_DDSAnalytics.html – Completed HTML report generated from RStudio.

BP_DDSAnalytics_CaseStudy_P1.R – R script supporting the case study analysis.

BP_CaseStudy1_Competition_Analysis.R – R script supporting the competition predictions.

Case1PredictionsPadaAttrition.csv – Employee attrition competition predictions.

Final PowerPoint Presentation – Executive presentation summarizing the analysis, model results, financial evaluation, and recommendations.

Video Presentation

Frito Lay Employee Attrition Case Study – Final Presentation

The recorded Zoom presentation provides an overview of the exploratory data analysis, employee attrition findings, k-Nearest Neighbors and Naive Bayes classification models, financial impact assessment, and final business recommendations.

Watch the Zoom Presentation: https://smu-2u-com.zoom.us/rec/share/0vS0PjHHWRVNZRWdn7yaU2H3MuF4ZegXm83dsDy2GXNnmGfRdlBDkAQMd5TNtWtg.S5iBJKV6CFJTTEFV?from=hub
