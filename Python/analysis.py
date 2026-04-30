import pandas as pd

# Load dataset with correct encoding
df = pd.read_csv("C:/Retail-Sales-Analysis/Data/sales.csv", encoding='latin1')

# Show first 5 rows
print(df.head())

# Column names
print(df.columns)

# Data types
print(df.info())

# Missing values
print(df.isnull().sum())

# Convert date column
df['Order Date'] = pd.to_datetime(df['Order Date'])

# Create Month and Year
df['Month'] = df['Order Date'].dt.month
df['Year'] = df['Order Date'].dt.year

# Create Profit Margin
df['Profit Margin'] = df['Profit'] / df['Sales']

# Check result
print(df[['Order Date', 'Month', 'Year', 'Profit', 'Sales', 'Profit Margin']].head())