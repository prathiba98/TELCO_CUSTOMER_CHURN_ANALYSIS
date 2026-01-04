--HIGH PAYING CUSTOMERS
CREATE VIEW high_paying_customers AS
SELECT
    customerid,
    monthly_charges,
    payment_method,
    AVG(monthly_charges) OVER () AS avg_charge,
    DENSE_RANK()OVER(PARTITION BY payment_method ORDER BY monthly_charges desc) AS dense_rank
FROM telco_churn;

--CHURN OVERVIEW
CREATE VIEW vw_churn_overview AS
SELECT
    COUNT(*) AS total_customers,
    SUM(churn_label) AS churned_customers,
    COUNT(*) - SUM(churn_label) AS active_customers,
    ROUND(SUM(churn_label) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM telco_churn;

SELECT * FROM vw_churn_overview

--CHURN BY CONTRACT
CREATE VIEW vw_churn_by_contract AS
SELECT
    contract,
    COUNT(*) AS total_customers,
    SUM(churn_label) AS churned_customers,
    ROUND(SUM(churn_label) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM telco_churn
GROUP BY contract;

SELECT * FROM vw_churn_by_contract

--CHURN BY TENURE
CREATE VIEW vw_churn_by_tenure AS
SELECT
    tenure_bucket,
    COUNT(*) AS total_customers,
    SUM(churn_label) AS churned_customers,
    ROUND(SUM(churn_label) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM telco_churn
GROUP BY tenure_bucket;

SELECT * FROM vw_churn_by_tenure

--CHURN BY PAYMENT METHOD
CREATE VIEW vw_churn_by_payment AS
SELECT
    payment_method,
    COUNT(*) AS total_customers,
    ROUND(AVG(churn_label) * 100, 2) AS churn_rate_pct
FROM telco_churn
GROUP BY payment_method;

SELECT * FROM vw_churn_by_payment

--SERVICE LEVEL CHURN
CREATE VIEW vw_churn_by_service AS
SELECT
    internet_service,
    tech_support,
    COUNT(*) AS total_customers,
    ROUND(AVG(churn_label) * 100, 2) AS churn_rate_pct
FROM telco_churn
GROUP BY internet_service, tech_support;

SELECT * FROM vw_churn_by_service

--REVENUE IMPACT BY CHURN
CREATE VIEW vw_churn_revenue_impact AS
SELECT
    churn_label,
    ROUND(SUM(monthly_charges), 2) AS total_monthly_revenue,
    ROUND(AVG(cltv), 2) AS avg_cltv
FROM telco_churn
GROUP BY churn_label;

SELECT * FROM vw_churn_revenue_impact

--CHURN REASONS
CREATE VIEW vw_churn_reasons AS
SELECT
    churn_reason,
    COUNT(*) AS churn_count,
    ROUND(SUM(monthly_charges), 2) AS revenue_lost
FROM telco_churn
WHERE churn_label = 1
GROUP BY churn_reason;

SELECT * FROM vw_churn_reasons



