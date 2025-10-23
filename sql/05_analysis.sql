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
