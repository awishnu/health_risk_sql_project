USE health_risk;

-- Overview stats
SELECT 
  COUNT(*) AS total_records,
  ROUND(AVG(age),2) AS avg_age,
  ROUND(AVG(bmi),2) AS avg_bmi,
  ROUND(AVG(sleep),2) AS avg_sleep,
  ROUND(100.0*SUM(health_risk='high')/COUNT(*),2) AS pct_high_risk
FROM health_data_clean;

-- Risk by exercise
SELECT exercise,
       COUNT(*) AS total_people,
       ROUND(100.0*SUM(health_risk='high')/COUNT(*),2) AS high_risk_pct
FROM health_data_clean
GROUP BY exercise
ORDER BY high_risk_pct DESC;

-- BMI categories vs risk
SELECT
  CASE 
    WHEN bmi < 18.5 THEN 'Underweight'
    WHEN bmi BETWEEN 18.5 AND 24.9 THEN 'Normal'
    WHEN bmi BETWEEN 25 AND 29.9 THEN 'Overweight'
    ELSE 'Obese'
  END AS bmi_category,
  COUNT(*) AS total,
  ROUND(100.0*SUM(health_risk='high')/COUNT(*),2) AS high_risk_pct
FROM health_data_clean
GROUP BY bmi_category
ORDER BY high_risk_pct DESC;
