-- Q1: Top 10 countries by average life expectancy
SELECT country, ROUND(AVG(life_expectancy),2) AS avg_le
FROM life_expectancy_data
GROUP BY country
ORDER BY avg_le DESC
LIMIT 10;


-- Q2: Year-over-year trend for 3 countries
SELECT country, year, life_expectancy
FROM life_expectancy_data
WHERE country IN ('India','Japan','Brazil')
ORDER BY country, year;


-- Q3: Average life expectancy by status (Developed vs Developing)
SELECT status, ROUND(AVG(life_expectancy),2) AS avg_le
FROM life_expectancy_data
GROUP BY status;


-- Q4: Top 5 countries by average schooling
SELECT country, ROUND(AVG(schooling),2) AS avg_schooling
FROM life_expectancy_data
WHERE schooling > 0
GROUP BY country
ORDER BY avg_schooling DESC
LIMIT 5;


-- Q5: Schooling vs life expectancy per country
SELECT country,
       ROUND(AVG(schooling),2) AS avg_schooling,
       ROUND(AVG(life_expectancy),2) AS avg_le
FROM life_expectancy_data
WHERE schooling > 0
GROUP BY country
ORDER BY avg_schooling DESC;


-- Q6: Top 5 countries by GDP with their life expectancy
SELECT country,
       ROUND(AVG(gdp),0) AS avg_gdp,
       ROUND(AVG(life_expectancy),2) AS avg_le
FROM life_expectancy_data
WHERE gdp IS NOT NULL
GROUP BY country
ORDER BY avg_gdp DESC
LIMIT 5;

-- Q7: Global average life expectancy for each year
SELECT year, ROUND(AVG(life_expectancy),2) AS avg_le
FROM life_expectancy_data
GROUP BY year
ORDER BY year;

-- Q8: Country-years with immunization coverage below 50%
SELECT country, year, hepatitis_b, polio, diphtheria, life_expectancy
FROM life_expectancy_data
WHERE hepatitis_b < 50 OR polio < 50 OR diphtheria < 50
ORDER BY life_expectancy;

-- Q9: Average life expectancy by status and year
SELECT status, year, ROUND(AVG(life_expectancy),2) AS avg_le
FROM life_expectancy_data
GROUP BY status, year
ORDER BY year, status;

-- Q10: HIV/AIDS aur life expectancy ka relation (open-ended)
SELECT country,
       ROUND(AVG(hiv_aids),2) AS avg_hiv,
       ROUND(AVG(life_expectancy),2) AS avg_le
FROM life_expectancy_data
GROUP BY country
ORDER BY avg_hiv DESC
LIMIT 10;