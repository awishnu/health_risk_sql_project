# Setup instructions (MySQL + MySQL Workbench)

1. Install MySQL Server and MySQL Workbench.
2. Start MySQL server and open MySQL Workbench.
3. Create a new schema: `CREATE DATABASE health_risk;`
4. Run `sql/01_create_table.sql`.
5. Import CSV:
   - In MySQL Workbench: Right-click schema → Table Data Import Wizard → select CSV → choose `health_data` table.
   - OR use LOAD DATA INFILE (if file accessible to MySQL server).
6. Run `sql/02_data_cleaning.sql` then `sql/03_analysis.sql`.
7. Export result sets (right-click result grid → Export Resultset → CSV) into the `results/` folder.
