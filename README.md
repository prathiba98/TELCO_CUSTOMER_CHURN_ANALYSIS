# TELCO CUSTOMER CHURN ANALYSIS

## Project Overview

Customer churn is a critical challenge for subscription-based businesses.
This project analyzes customer churn behavior using a Telco customer dataset, focusing on identifying who is churning, why they are churning, and the business impact of churn.

The analysis is designed using a SQL-first approach for data transformation and business logic, followed by Power BI for visualization and storytelling.


## Objectives

Measure overall customer churn rate

Identify key churn drivers (contract, tenure, payment method, services)

Analyze churn by customer segments

Quantify revenue impact of churn


## Tools Used

SQL – Data cleaning, transformations, aggregations, views

Power BI – Interactive dashboards & visual storytelling

CSV – Source dataset

## Dataset

Source: Telco Customer Churn Dataset (Kaggle)

Data includes:

- Customer demographics

- Subscription & service details

- Contract & payment information

- Churn status and churn reasons

- Monthly & total charges

## step 1

Data Cleaning and handling null values using python and SQL

- The csv file was loaded usind pandas library , column names were standardized,duplicates were removed and missing values were handled and derived columns were created.

- The cleaned csv file was loaded into sql and rechecked for null values and handled accordingly.


## step 2

Customer Churn analysis

Certain Key Performance Indicators (KPIs) were derived through structured data analysis, utilizing SQL queries to extract and aggregate performance metrics from the primary relational database.

for example:

churn rate by payment method,total churned customers etc.

![Image](https://github.com/user-attachments/assets/7f571b0a-d726-4b7d-aff2-e7e2ee52ae96)


![Image](https://github.com/user-attachments/assets/0627333b-925c-4d25-859e-c5676bd55909)



## step 3

Key sql views created

- vw_churn_overview – Total customers, churned customers, churn rate

- vw_churn_by_contract

- vw_churn_by_tenure

- vw_churn_by_payment_method

- vw_churn_by_services

- vw_churn_revenue_impact

- vw_churn_reasons

- high_paying_customers

![Image](https://github.com/user-attachments/assets/4caf3e78-7353-4a58-a6b4-f886b755c53b)



![Image](https://github.com/user-attachments/assets/a11db48e-d7be-49e6-9f3f-351016ff1891)


## step 4

Powerbi Dashboard

A five page powerbi dashboard was created using the views created from sql.

Page 1: Churn Overview

Page 2:Churn rate percentage by contract and payment method is represented.

Page 3: A matrix of total customers by internet service and a donut chart of total customers by tenure bucket is generated.

Page 4: A table of revenue lost by churn reason is computed and a line & bar graph of average cltv and total monthly revenue by churn label is represented.

Page 5: A table showing relation between contract,tenure bucket,payment method and churn rate is shown.

snaps of dashboard:


![Image](https://github.com/user-attachments/assets/f2154c27-5e76-4514-bb7d-4fdc757b5b4b)

![Image](https://github.com/user-attachments/assets/a3aca4c0-dda9-4ed5-9cfb-c5ec5fdb81b2)

![Image](https://github.com/user-attachments/assets/ccfe0673-a724-4e76-895f-aa4d99978321)

![Image](https://github.com/user-attachments/assets/f9230a79-9f90-4ee7-9eb3-aae44610a4b3)

![Image](https://github.com/user-attachments/assets/e93b87b8-3aeb-4bf8-9a56-7ed81a4bcc2d)
