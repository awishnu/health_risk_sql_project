# 🩺 Health Risk Analysis using SQL

## 📘 Overview
This project explores global health risk data to analyze obesity, smoking, and alcohol consumption trends using SQL.

## 🧰 Tools Used
- MySQL Workbench
- MySQL Server
- CSV Dataset (from [source name])
- GitHub for portfolio hosting

## 🎯 Objectives
- Identify regional patterns in obesity and lifestyle diseases.
- Measure correlation between alcohol use, smoking, and obesity.
- Practice SQL aggregation, joins, and subqueries.

## 🧮 Key SQL Techniques
- `JOIN` and `GROUP BY`
- `CTE` (Common Table Expressions)
- Window Functions (`ROW_NUMBER`, `RANK`)
- Subqueries
- Aggregate Functions (`AVG`, `COUNT`, `SUM`)

## 📊 Example Query
```sql
SELECT region, 
       ROUND(AVG(obesity_rate), 2) AS avg_obesity, 
       ROUND(AVG(smoking_rate), 2) AS avg_smoking
FROM health_data
GROUP BY region
ORDER BY avg_obesity DESC;
