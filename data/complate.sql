-- Step 1. Create a Database
CREATE DATABASE health_risk;
USE health_risk;

-- Step 2. Create the Table Schema
DROP TABLE IF EXISTS health_data;

CREATE TABLE health_data (
  id INT AUTO_INCREMENT PRIMARY KEY,
  age INT,
  weight FLOAT,
  height FLOAT,
  exercise VARCHAR(10),
  sleep FLOAT,
  sugar_intake VARCHAR(10),
  smoking VARCHAR(5),
  alcohol VARCHAR(5),
  married VARCHAR(5),
  profession VARCHAR(50),
  bmi FLOAT,
  health_risk VARCHAR(10)
);

-- Step 3. Import and test the CSV File
SELECT COUNT(*) 
FROM health_data;

SELECT * 
FROM health_data LIMIT 5;

-- Step 4. Clean & Inspect Data

-- A. check data shape
SELECT COUNT(*) AS total_rows 
FROM health_data;

-- B. Check for missing or strange values
SELECT 
  SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS null_age,
  SUM(CASE WHEN bmi IS NULL THEN 1 ELSE 0 END) AS null_bmi,
  SUM(CASE WHEN exercise IS NULL THEN 1 ELSE 0 END) AS null_exercise
FROM health_data;

-- C. Find suspicious ages and BMI values
SELECT COUNT(*) AS too_young 
FROM health_data_clean 
WHERE age < 0;

SELECT COUNT(*) AS too_old
FROM health_data_clean
WHERE age > 120;

SELECT COUNT(*) AS invalid_bmi_low
FROM health_data_clean
WHERE bmi <= 0;

SELECT COUNT(*) AS invalid_bmi_high
FROM health_data_clean
WHERE bmi > 100;

-- D. Standardize all categorical text (e.g., lowercase) and create a cleaned copy of the table
DROP TABLE IF EXISTS health_data_clean;

CREATE TABLE health_data_clean AS
SELECT
  id,
  age,
  weight,
  height,
  LOWER(TRIM(exercise)) AS exercise,
  sleep,
  LOWER(TRIM(sugar_intake)) AS sugar_intake,
  LOWER(TRIM(smoking)) AS smoking,
  LOWER(TRIM(alcohol)) AS alcohol,
  LOWER(TRIM(married)) AS married,
  LOWER(TRIM(profession)) AS profession,
  bmi,
  LOWER(TRIM(health_risk)) AS health_risk
FROM health_data;

-- Step 5. Run Analysis Queries
-- A. Overview statistics
SELECT 
  COUNT(*) AS total_records,
  ROUND(AVG(age),2) AS avg_age,
  ROUND(AVG(bmi),2) AS avg_bmi,
  ROUND(AVG(sleep),2) AS avg_sleep,
  ROUND(SUM(CASE WHEN health_risk='high' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS pct_high_risk
FROM health_data_clean;

-- B. Health risk by exercise level
SELECT exercise,
       COUNT(*) AS total_people,
       ROUND(SUM(CASE WHEN health_risk='high' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS high_risk_pct
FROM health_data_clean
GROUP BY exercise
ORDER BY high_risk_pct DESC;

-- C. Smoking + alcohol combinations
SELECT smoking, alcohol,
       COUNT(*) AS total,
       ROUND(SUM(CASE WHEN health_risk='high' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS high_risk_pct
FROM health_data_clean
GROUP BY smoking, alcohol
ORDER BY high_risk_pct DESC;

-- D. BMI category & health risk
SELECT 
  CASE 
    WHEN bmi < 18.5 THEN 'Underweight'
    WHEN bmi BETWEEN 18.5 AND 24.9 THEN 'Normal'
    WHEN bmi BETWEEN 25 AND 29.9 THEN 'Overweight'
    ELSE 'Obese'
  END AS bmi_category,
  COUNT(*) AS total,
  ROUND(SUM(CASE WHEN health_risk='high' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS high_risk_pct
FROM health_data_clean
GROUP BY bmi_category
ORDER BY high_risk_pct DESC;

-- E. Health risk by profession
SELECT profession,
       COUNT(*) AS total_people,
       ROUND(SUM(CASE WHEN health_risk='high' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS high_risk_pct
FROM health_data_clean
GROUP BY profession
ORDER BY high_risk_pct DESC
LIMIT 10;

-- F. Simple lifestyle risk score
SELECT *,
    (CASE WHEN exercise='high' THEN 0 WHEN exercise='medium' THEN 1 ELSE 2 END +
     CASE WHEN sleep>=7 THEN 0 ELSE 1 END +
     CASE WHEN sugar_intake='high' THEN 1 ELSE 0 END +
     CASE WHEN smoking='yes' THEN 1 ELSE 0 END +
     CASE WHEN alcohol='yes' THEN 1 ELSE 0 END) AS lifestyle_risk_score
FROM health_data_clean
LIMIT 10;
