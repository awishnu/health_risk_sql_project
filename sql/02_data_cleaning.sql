-- Create a cleaned copy of the table with normalized text

USE health_risk;

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

-- Example basic sanity filters; you can tweak thresholds
DELETE FROM health_data_clean WHERE age < 0 OR age > 120;
DELETE FROM health_data_clean WHERE bmi <= 0 OR bmi > 100;
