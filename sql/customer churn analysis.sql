--CHURNED CUSTOMERS
SELECT customerid, contract, monthly_charges
FROM telco_churn
WHERE churn_label = 1;

--TOTAL CUSTOMERS BY CONTRACT AND THEIR AVG CHARGE
SELECT
    contract,
    COUNT(*) AS total_customers,
    AVG(monthly_charges) AS avg_charge
FROM telco_churn
GROUP BY contract;

--CHURN RATE BY PAYMENT METHOD
SELECT
    payment_method,
    AVG(churn_label) * 100 AS churn_rate
FROM telco_churn
GROUP BY payment_method
HAVING COUNT(*) > 50;

--HIGHER MONTHLY CHARGES
SELECT *
FROM telco_churn
WHERE monthly_charges >
(
    SELECT AVG(monthly_charges)
    FROM telco_churn
);

SELECT COUNT(*) AS CUST_TOTAL
FROM telco_churn
WHERE monthly_charges >
(
    SELECT AVG(monthly_charges)
    FROM telco_churn
);

--COMPARING MONTHLY OVER AVG CHARGE AND RANKING
SELECT
    customerid,
    monthly_charges,
    AVG(monthly_charges) OVER () AS avg_charge
FROM telco_churn;

SELECT
    customerid,
    monthly_charges,
    payment_method,
    AVG(monthly_charges) OVER () AS avg_charge,
    DENSE_RANK()OVER(PARTITION BY payment_method ORDER BY monthly_charges desc) AS dense_rank
FROM telco_churn;






