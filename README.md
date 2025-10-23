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
SELECT *,
    (CASE WHEN exercise='high' THEN 0 WHEN exercise='medium' THEN 1 ELSE 2 END +
     CASE WHEN sleep>=7 THEN 0 ELSE 1 END +
     CASE WHEN sugar_intake='high' THEN 1 ELSE 0 END +
     CASE WHEN smoking='yes' THEN 1 ELSE 0 END +
     CASE WHEN alcohol='yes' THEN 1 ELSE 0 END) AS lifestyle_risk_score
FROM health_data_clean
LIMIT 10;
