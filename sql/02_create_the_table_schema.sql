-- Create a cleaned copy of the table with normalized text
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
