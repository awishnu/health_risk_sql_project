# 🩺 Lifestyle and Health Risk Analysis (SQL Portfolio Project)

### 📘 Overview  
This project analyzes **5,000 synthetic lifestyle and health records** to explore how habits such as exercise, sleep, smoking, and BMI relate to overall health risk.  
The analysis was conducted entirely in **MySQL Workbench**, with results published for portfolio purposes.

### 🧩 Objectives  
- Clean and prepare the dataset for analysis  
- Calculate overall health risk distribution  
- Examine the impact of exercise, BMI, smoking, and alcohol on health risk  
- Generate a simple **Lifestyle Risk Score** for interpretation  

---

## 🧱 1. Dataset Information  
**File:** `Lifestyle_and_Health_Risk_Prediction_Synthetic_Dataset.csv`  
**Records:** 5,000  
**Fields:** `age`, `bmi`, `sleep`, `exercise`, `smoking`, `alcohol`, `profession`, `health_risk`, and others.

---

## 📊 2. Overview Statistics  

| Metric                    | Value         |
|---------------------------|:-------------:|
| Total Records             | 5,000         |
| Average Age               | 48.81 years   |
| Average BMI               | 26.84         |
| Average Sleep Duration    | 7 hours       |
| % with High Health Risk   | **69.8%**     |

> 📈 *More than two-thirds of participants fall into the high-risk category, suggesting less-than-ideal lifestyle habits in the population.*

---

## 🏃 3. Health Risk by Exercise Level  

| Exercise Level | Total People | High Risk % |
|----------------|-------------:|-------------:|
| Low            | 1,272        | 83.73%      |
| None           |   743        | 82.64%      |
| High           | 1,000        | 60.90%      |
| Medium         | 1,985        | 60.55%      |

> 💡 *Regular physical activity (medium or high) is strongly correlated with lower health risk.*

---

## 🚬 4. Smoking & Alcohol Impact  

| Smoking | Alcohol | Total   | High Risk % |
|---------|---------|---------|-------------|
| Yes     | Yes     |     249 | **100.00%** |
| Yes     | No      |     728 | 91.07%      |
| No      | Yes     |   1,010 | 80.20%      |
| No      | No      |   3,013 | 58.68%      |

> ⚠️ *Every individual who both smokes and drinks shows high health risk (100%). Non-smokers and non-drinkers have the lowest risk.*

---

## ⚖️ 5. BMI Category and Health Risk  

| BMI Category | Total | High Risk % |
|--------------|--------|-------------|
| Obese       | 1,659  | 88.25%      |
| Overweight  | 1,067  | 87.72%      |
| Normal      | 1,453  | 48.80%      |
| Underweight |   821  | 46.41%      |

> 💬 *Obesity and overweight status are significant predictors of higher health risk.*

---

## 🧑‍💼 6. Health Risk by Profession  

| Profession     | Total People | High Risk % |
|----------------|-------------:|-------------:|
| Driver         |     631      | 72.42%       |
| Engineer       |     616      | 70.94%       |
| Teacher        |     612      | 70.75%       |
| Student        |     644      | 70.03%       |
| Office Worker  |     602      | 69.93%       |
| Farmer         |     639      | 69.17%       |
| Artist         |     626      | 68.69%       |
| Doctor         |     630      | 66.51%       |

> 🧠 *Professions with sedentary or irregular hours (like drivers and engineers) show slightly higher health risk.*

---

## 🧮 7. Example of Lifestyle Risk Scoring  
| ID | Age | Exercise | Sleep | Smoking | Alcohol | BMI  | Health Risk | Lifestyle Risk Score |
|----|-----|----------|-------|---------|---------|------|-------------|----------------------|
| 1  | 56  | Low      | 6.1   | Yes     | Yes     | 17.6 | High        | 5                    |
| 2  | 69  | High     | 6.9   | No      | No      | 26.3 | High        | 2                    |
| 3  | 46  | High     | 6.6   | Yes     | No      | 45.3 | High        | 2                    |
| 4  | 32  | Medium   | 8.5   | No      | No      | 15.6 | Low         | 1                    |
| 5  | 60  | High     | 8.0   | No      | No      | 25.8 | High        | 0                    |

> 📊 *The Lifestyle Risk Score (0-5) helps quantify combined lifestyle impact on health outcomes.*

---

## 🧠 8. Insights & Takeaways  
- Regular exercise and **7+ hours of sleep** are associated with reduced health risk.  
- Combined smoking and alcohol consumption drastically increases health risk (100%).  
- Maintaining a **normal BMI** is critical; obesity correlates with ~88% high-risk rate.  
- Occupation and lifestyle choices play a measurable role in health outcomes.

---

## 🧰 Tools & Skills Demonstrated  
- **SQL (MySQL Workbench)** – data cleaning, aggregation, and statistical analysis  
- **GitHub** – version control and portfolio documentation  
- **Data Storytelling** – converting raw data into actionable insights  

---

## 📎 Project Files  

📂 health-risk-sql-project/
├── data/

│   ├── Lifestyle_and_Health_Risk_Prediction_Synthetic_Dataset.csv

├── results/

│   ├── 03_import_and_test.csv

│   ├── 04_a_inspect_data.csv

│   ├── 04_b_check_for_missing.csv

│   ├── 05_a_overview_statistic.csv

│   ├── 05_b_health_risk_by_exercise.csv

│   ├── 05_c_smoking_alcohol.csv

│   ├── 05_d_bmi_category_and_health_risk.csv

│   ├── 05_e_health_risk_by_profession.csv

│   ├── 05_f_simple-lifestyle_risk_score.csv

└── README.md

└── setup_instructions.md


---

## 🌟 Author  
**Ah Wishnu**  
Finance professional transitioning into data analytics — using SQL and AI tools to uncover insights and improve decision-making.  
📍 Based in Indonesia  
🔗 [GitHub Portfolio](https://github.com/awishnu/health_risk_sql_project) | [LinkedIn](https://linkedin.com/in/ahmad-wishnu/)

---

