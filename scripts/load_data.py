import pandas as pd
import sqlite3

# 1. CSV padho
df = pd.read_csv("data/life_expectancy.csv")

# 2. Column names saaf karo: space/symbols hatao, lowercase karo
df.columns = (df.columns.str.strip().str.lower()
              .str.replace(r"[^a-z0-9]+", "_", regex=True)
              .str.strip("_"))

# 3. Country ke naam se extra space hatao
df["country"] = df["country"].str.strip()

# 4. Jin rows mein life_expectancy hi nahi hai, unhe hata do
df = df.dropna(subset=["life_expectancy"])

# 5. Database banao aur table likho
conn = sqlite3.connect("db/life_expectancy.db")
df.to_sql("life_expectancy_data", conn, if_exists="replace", index=False)

# 6. Check karo
print(pd.read_sql("SELECT * FROM life_expectancy_data LIMIT 10", conn))
print(df.columns.tolist())
conn.close()