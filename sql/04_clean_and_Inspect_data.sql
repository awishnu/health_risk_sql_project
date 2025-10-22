-- check data shape
SELECT COUNT(*) AS total_rows 
FROM health_data;

-- Check for missing or strange values
SELECT 
  SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS null_age,
  SUM(CASE WHEN bmi IS NULL THEN 1 ELSE 0 END) AS null_bmi,
  SUM(CASE WHEN exercise IS NULL THEN 1 ELSE 0 END) AS null_exercise
FROM health_data;
