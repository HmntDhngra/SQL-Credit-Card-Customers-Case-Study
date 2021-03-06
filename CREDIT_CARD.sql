CREATE database Credit_Card_Customers;
USE Credit_Card_Customers;
Create table Transactions
(
CLIENTNUM INT,
Attrition_Flag VARCHAR(30),
Customer_Age INT,
Gender VARCHAR(10),
Dependent_count INT,
Education_Level VARCHAR(30),
Marital_Status VARCHAR(10),	
Income_Category	VARCHAR(30),
Card_Category VARCHAR(10),
Months_on_book INT,	
Total_Relationship_Count INT,
Months_Inactive_12_mon INT,	
Contacts_Count_12_mon INT,
Credit_Limit FLOAT,
Total_Revolving_Bal INT,
Avg_Open_To_Buy INT,
Total_Amt_Chng_Q4_Q1 FLOAT,
Total_Trans_Amt	INT, 
Total_Trans_Ct INT,
Total_Ct_Chng_Q4_Q1	FLOAT, 
Avg_Utilization_Ratio FLOAT, 
NBC_mon_1 FLOAT,
NBC_mon_2 FLOAT
)

SELECT * FROM TRANSACTIONS;	

#Find age range of attrited customers
SELECT A.AGE_RANGE, COUNT(*) FROM (
SELECT T.*,
CASE
    WHEN Customer_Age < 20 THEN '0-20'
    WHEN Customer_Age BETWEEN 20 and 30 THEN '20 - 30'
    WHEN Customer_Age BETWEEN 30 and 40 THEN '30 - 40'
    WHEN Customer_Age BETWEEN 40 and 50 THEN '40 - 50'
    WHEN Customer_Age BETWEEN 50 and 60 THEN '50 - 60'
    WHEN Customer_Age BETWEEN 60 and 70 THEN '60 - 70'
    WHEN Customer_Age BETWEEN 70 and 80 THEN '70 - 80'
    WHEN Customer_Age > 80 THEN 'Above 80'
    WHEN Customer_Age IS NULL THEN 'NULL'
END as age_range 
FROM TRANSACTIONS T ) A WHERE A.ATTRITION_FLAG='Attrited Customer' GROUP BY A.AGE_RANGE ORDER BY A.AGE_RANGE


SELECT * FROM TRANSACTIONS;	

SELECT ATTRITION_FLAG, GENDER, CUSTOMER_AGE FROM TRANSACTIONS;

#Find AVERAGE age of attrited & Existing customers by Gender
SELECT gender, TRUNCATE(AVG(CUSTOMER_AGE),2) AS AVG_AGE_ATTRITED FROM TRANSACTIONS WHERE ATTRITION_FLAG='Attrited Customer' group by gender
#SELECT AVG(CUSTOMER_AGE) AS AGE_MALE_ATTRITED FROM TRANSACTIONS WHERE GENDER='M' AND ATTRITION_FLAG='Attrited Customer'
#SELECT AVG(CUSTOMER_AGE) AS AGE_FEMALE_ATTRITED FROM TRANSACTIONS WHERE GENDER='F' AND ATTRITION_FLAG='Attrited Customer'

SELECT gender, TRUNCATE(AVG(CUSTOMER_AGE),2) AS AVG_AGE_ATTRITED FROM TRANSACTIONS WHERE ATTRITION_FLAG='Existing Customer' group by gender
#SELECT AVG(CUSTOMER_AGE) AS AGE_MALE_EXISTING FROM TRANSACTIONS WHERE GENDER='M' AND ATTRITION_FLAG='Existing Customer'
#SELECT AVG(CUSTOMER_AGE) AS AGE_FEMALE_EXISTING FROM TRANSACTIONS WHERE GENDER='F' AND ATTRITION_FLAG='Existing Customer'

#GENDER WISE DISTRIBUTION OF FEMALES
SELECT COUNT(*) FROM TRANSACTIONS;
SELECT COUNT(*) FROM TRANSACTIONS WHERE GENDER='M'; #4769
SELECT COUNT(*) FROM TRANSACTIONS WHERE GENDER='F'; #5358
SELECT GENDER, COUNT(*) FROM TRANSACTIONS GROUP BY GENDER;