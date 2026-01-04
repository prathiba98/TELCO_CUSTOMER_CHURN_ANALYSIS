create database customer_churn

SELECT * FROM telco_churn WHERE customerid IS NULL
SELECT * FROM telco_churn WHERE count IS NULL
SELECT * FROM telco_churn WHERE country IS NULL
SELECT * FROM telco_churn WHERE state IS NULL
SELECT * FROM telco_churn WHERE city IS NULL
SELECT * FROM telco_churn WHERE zip_code IS NULL
SELECT * FROM telco_churn WHERE lat_long IS NULL
SELECT * FROM telco_churn WHERE latitude IS NULL
SELECT * FROM telco_churn WHERE longitude IS NULL
SELECT * FROM telco_churn WHERE gender IS NULL
SELECT * FROM telco_churn WHERE senior_citizen IS NULL
SELECT * FROM telco_churn WHERE partner IS NULL
SELECT * FROM telco_churn WHERE dependents IS NULL
SELECT * FROM telco_churn WHERE tenure_months IS NULL
SELECT * FROM telco_churn WHERE phone_service IS NULL
SELECT * FROM telco_churn WHERE internet_service IS NULL
SELECT * FROM telco_churn WHERE contract IS NULL
SELECT * FROM telco_churn WHERE paperless_billing IS NULL
SELECT * FROM telco_churn WHERE payment_method IS NULL
SELECT * FROM telco_churn WHERE monthly_charges IS NULL
SELECT * FROM telco_churn WHERE churn_label IS NULL
SELECT * FROM telco_churn WHERE churn_value IS NULL
SELECT * FROM telco_churn WHERE churn_score IS NULL
SELECT * FROM telco_churn WHERE cltv IS NULL
SELECT * FROM telco_churn WHERE churn_reason IS NULL
SELECT * FROM telco_churn WHERE revenue_lost IS NULL

SELECT * FROM telco_churn WHERE tenure_bucket IS NULL
SELECT * FROM telco_churn WHERE total_charges IS NULL
SELECT * FROM telco_churn WHERE tech_support IS NULL
SELECT * FROM telco_churn WHERE streaming_tv IS NULL
SELECT * FROM telco_churn WHERE streaming_movies IS NULL
SELECT * FROM telco_churn WHERE multiple_lines IS NULL
SELECT * FROM telco_churn WHERE online_security IS NULL
SELECT * FROM telco_churn WHERE online_backup IS NULL
SELECT * FROM telco_churn WHERE device_protection IS NULL

ALTER TABLE telco_churn
ALTER COLUMN tenure_bucket VARCHAR(20);

UPDATE telco_churn
SET tenure_bucket =
    CASE
        WHEN tenure_months <= 6 THEN '0-6'
        WHEN tenure_months <= 12 THEN '6-12'
        WHEN tenure_months <= 24 THEN '1-2yr'
        WHEN tenure_months <= 60 THEN '2-5yr'
        ELSE '5yr+'
    END;

UPDATE telco_churn
SET total_charges = 0
WHERE total_charges IS NULL;
