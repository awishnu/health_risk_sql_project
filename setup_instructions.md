# Setup instructions (MySQL + MySQL Workbench)

1. Install MySQL Server and MySQL Workbench.
2. Start MySQL server and open MySQL Workbench.
3. Create a new schema: `CREATE DATABASE health_risk;`
4. Run `sql/01_create_table.sql`.
5. Import CSV:
   - In MySQL Workbench: Right-click schema → Table Data Import Wizard → select CSV → choose `health_data` table.
   - OR use LOAD DATA INFILE (if file accessible to MySQL server).
6. Run `sql/02_create_the_table_schema.sql` `sql/03_import_and_test_csv.sql` `04_clean_and_Inspect_data.sql`then `sql/05_analysis.sql`.
7. Export result sets (right-click result grid → Export Resultset → CSV) into the `results/` folder.
