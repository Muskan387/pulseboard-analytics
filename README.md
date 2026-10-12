# WHO Life Expectancy Analysis (PulseBoard Week 1 and Week 2)

## About
This project loads the WHO Life Expectancy dataset into a SQLite database and answers questions about it using SQL.

## Dataset
WHO Life Expectancy dataset (Kaggle, by KumarRajarshi), 2000-2015, 22 columns.

## How to run
1. Install pandas: `pip install pandas`
2. Run: `python scripts/load_data.py`
3. This creates `db/life_expectancy.db`.
4. Open the database in DB Browser for SQLite and run the queries from `sql/week1_queries.sql`.

## Folder structure
- `data/` : raw CSV
- `db/` : SQLite database
- `scripts/` : data load script
- `sql/` : 10 SQL queries
- `findings.md` : key insights
- `notebooks/` : Week 2 EDA notebook
- `data/processed/` : cleaned dataset

## Data cleaning
- Column names cleaned (lowercase, underscores)
- Extra spaces removed from country names
- Rows with missing life expectancy removed

## Assumptions
- The dataset has no region column, so Q9 uses `status` (Developed/Developing) instead.
- In `schooling`, values of 0 are treated as missing and excluded.

## Week 2: Data Cleaning & Exploratory Data Analysis
- `notebooks/week2_eda.ipynb`: cleaning steps, 6 visualizations and written insights
- `data/processed/cleaned_life_expectancy.csv`: cleaned dataset (raw file `data/life_expectancy.csv` was not modified)
- `cleaning_log.md`: every cleaning decision and the reason behind it

**Cleaning summary:** standardized column and country names, dropped 10 rows with missing life expectancy, imputed the remaining missing values with the country-wise median, and kept outliers after review.