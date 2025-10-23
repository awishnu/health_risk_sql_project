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

-- D. Standardize all categorical text and create cleaned copy
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
