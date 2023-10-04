# University Admissions Analysis Project

![R Logo](https://www.r-project.org/logo/Rlogo.png)

Welcome to the University Admissions Analysis Project repository! This project explores and analyzes university admissions data using the R programming language. The dataset used for this analysis contains various attributes, including GRE and TOEFL scores, university ratings, statement of purpose ratings, letter of recommendation ratings, CGPA, research experience, and the chance of admission.

## Introduction and Research Questions

The primary goal of this project is to analyze and describe different aspects of the university admissions dataset using a combination of graphics and statistical models. We have chosen the University Admissions data from Kaggle datasets as our dataset of interest. Some of the key research questions we aim to answer include:

1. **Variable Significance**: What variables significantly affect the chance of admission, among GRE, TOEFL, university rating, statement of purpose rating, letter of recommendation rating, CGPA, and research experience?
2. **Outlier Detection**: Which data values negatively affect the chance of admission, and can we identify and handle outliers?
3. **Model Improvement**: What effect do statistically insignificant predictors have on the model, and how does the model's performance improve after removing them from the selection process?

## Approach

Our analytical approach consists of several steps:

1. **Data Assumptions**: We begin by checking key assumptions, including linearity, constant variance, normality, and independence in the data.

2. **Model Selection**: We employ a backward model selection process to identify the best model with all significant predictors.

3. **Logistic Regression**: We categorize the response variable into binary outcomes (0 or 1) and perform logistic regression. This allows us to assess misclassification error and accuracy.

4. **Random Forest Classification**: We apply random forest classification to identify the most significant variables and compare them with logistic regression results.

Throughout the analysis, we employ various data visualization techniques, including correlation matrices, boxplots, and scatterplots. Additionally, we utilize linear and logistic regression models, diagnostic plots, and feature importance analysis using random forest models.

## Repository Files

The repository is structured into two main folders:

- **code**: This folder contains the R code file (`analysis.R`) that was used for data analysis and modeling.

- **data**: Here, you'll find essential project assets:
  - `adm_data.csv`: The dataset used for the project.
  - `Project_presentation.pptx`: A PowerPoint presentation summarizing the project.
  - `Report.pdf`: A detailed report highlighting the analysis process and outcomes.

## Getting Started

To get started with this project, follow these steps:

1. Clone this repository to your local machine:

```bash
git clone https://github.com/NikhilJamma/University-Admissions-Analysis_R.git
```

2. Explore the code in the `code` folder to understand the data analysis and modeling process.

3. Review the dataset, presentation, and project report in the `data` folder to gain insights into the analysis results.

Feel free to modify and enhance the code and analysis to suit your specific requirements and research objectives.

## Dependencies

The following R packages were utilized for this analysis:

- ggplot2
- tidyverse
- Ggiraph
- mlbench
- randomForest
- caret
- GGally

Feel free to install these packages if you haven't already to run the analysis successfully.

---

*Disclaimer: This project is for educational and research purposes only, and the conclusions drawn from the analysis are based on the dataset provided.*
