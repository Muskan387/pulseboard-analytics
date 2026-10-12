# Cleaning Log

## Overview
- Raw dataset: 2938 rows x 22 columns (`data/life_expectancy.csv`, left untouched)
- Cleaned dataset: 2928 rows x 22 columns (`data/processed/cleaned_life_expectancy.csv`)
- Rows dropped: 10 | Exact duplicates removed: 0 | Missing values left: 0

## General changes
- **Column names:** stripped spaces, lowercased and replaced special characters with underscores (e.g. `HIV/AIDS` -> `hiv_aids`) to avoid hidden-space errors.
- **Country names:** removed extra spaces and replaced long official names with common short names (e.g. `Viet Nam` -> `Vietnam`). The number of countries stayed the same.
- **Data types:** all numeric columns were already numeric; `year` was cast to integer.
- **Duplicates:** 0 exact duplicate rows found.

## Missing values, column by column
- `life_expectancy`: 10 missing (0.34%) -> **rows dropped**, because it is the target variable and imputing it would bias the analysis.
- `adult_mortality`: 10 missing (0.34%) -> 0 values **imputed with the country-wise median** (overall median as fallback), because this indicator changes slowly within a country.
- `alcohol`: 194 missing (6.6%) -> 193 values **imputed with the country-wise median** (overall median as fallback), because this indicator changes slowly within a country.
- `hepatitis_b`: 553 missing (18.82%) -> 553 values **imputed with the country-wise median** (overall median as fallback), because this indicator changes slowly within a country.
- `bmi`: 34 missing (1.16%) -> 32 values **imputed with the country-wise median** (overall median as fallback), because this indicator changes slowly within a country.
- `polio`: 19 missing (0.65%) -> 19 values **imputed with the country-wise median** (overall median as fallback), because this indicator changes slowly within a country.
- `total_expenditure`: 226 missing (7.69%) -> 226 values **imputed with the country-wise median** (overall median as fallback), because this indicator changes slowly within a country.
- `diphtheria`: 19 missing (0.65%) -> 19 values **imputed with the country-wise median** (overall median as fallback), because this indicator changes slowly within a country.
- `gdp`: 448 missing (15.25%) -> 443 values **imputed with the country-wise median** (overall median as fallback), because this indicator changes slowly within a country.
- `population`: 652 missing (22.19%) -> 644 values **imputed with the country-wise median** (overall median as fallback), because this indicator changes slowly within a country.
- `thinness_1_19_years`: 34 missing (1.16%) -> 32 values **imputed with the country-wise median** (overall median as fallback), because this indicator changes slowly within a country.
- `thinness_5_9_years`: 34 missing (1.16%) -> 32 values **imputed with the country-wise median** (overall median as fallback), because this indicator changes slowly within a country.
- `income_composition_of_resources`: 167 missing (5.68%) -> 160 values **imputed with the country-wise median** (overall median as fallback), because this indicator changes slowly within a country.
- `schooling`: 163 missing (5.55%) -> 160 values **imputed with the country-wise median** (overall median as fallback), because this indicator changes slowly within a country.

## Outliers
Outliers were checked with the IQR rule and boxplots. They were **kept**, because they represent real countries (very large populations, very high or low GDP and mortality) and not errors. Columns with the most outliers:
- `measles`: 542 values (18.51%)
- `hiv_aids`: 542 values (18.51%)
- `population`: 452 values (15.44%)
- `gdp`: 443 values (15.13%)
- `under_five_deaths`: 394 values (13.46%)