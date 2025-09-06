# 🛒 Zepto Product Data Analysis (Portfolio Project)

## 📌 Overview  
This project analyzes product data from **Zepto** using a dataset (`zepto_v2.csv`) imported into **PostgreSQL**.  
The goal was to perform **data exploration, cleaning, and analysis** to uncover insights such as top discounted products, revenue estimation, inventory weight, and product categorization.  

---

## 🗂️ Dataset  
- **Source**: [Kaggle – Zepto Inventory Dataset](https://www.kaggle.com/datasets/palvinder2006/zepto-inventory-dataset/data?select=zepto_v2.csv)  
- **File Used**: `zepto_v2.csv`  
- **Imported Into**: PostgreSQL (`pgAdmin`)  

### Table Schema (`zepto`)  
| Column                  | Data Type      | Description |
|--------------------------|---------------|-------------|
| `sku_id`                | serial (PK)   | Unique product identifier |
| `category`              | varchar(100)  | Product category |
| `name`                  | varchar(100)  | Product name |
| `mrp`                   | numeric(8,2)  | Maximum retail price (₹) |
| `discountpercent`       | numeric(5,2)  | Discount percentage |
| `availablequantity`     | integer       | Available stock |
| `discountedsellingprice`| numeric(8,2)  | Price after discount (₹) |
| `weightingms`           | integer       | Product weight in grams |
| `outofstock`            | boolean       | Stock availability |
| `quantity`              | integer       | Quantity per unit |

---

## ⚙️ Steps Performed  

### 1️⃣ Data Loading  
- Imported `zepto_v2.csv` into PostgreSQL.  
- Created the `zepto` table with proper data types.  

### 2️⃣ Data Exploration  
- Row count & sample data.  
- Checked for `null` values.  
- Explored distinct categories.  
- Stock analysis (in-stock vs. out-of-stock).  
- Detected duplicate product names.  

### 3️⃣ Data Cleaning  
- Removed products with **zero MRP** or **zero selling price**.  
- Converted prices from **paise → rupees**.  

### 4️⃣ Analysis Queries  
- **Top 10 products** with highest discounts.  
- **High MRP but out-of-stock** products.  
- **Estimated revenue per category** (selling price × available stock).  
- Products with **MRP > ₹500** and **low discount (<10%)**.  
- **Top 5 categories** with highest average discount.  
- **Price per gram** calculation for items above 100g.  
- Categorized products into **Low, Medium, Bulk** by weight.  
- **Total inventory weight** per category.  

---

## 📊 Key Insights  
- Certain categories offer **high discounts consistently**.  
- Some products with **very high MRP were unavailable (out of stock)**.  
- Bulk items tend to provide **better value per gram**.  
- Revenue distribution varies significantly across categories.  

---

## 🛠️ Tech Stack  
- **PostgreSQL** (Database & SQL analysis)  
- **pgAdmin** (Database management)  
- **Kaggle** (Dataset source)  

---

## 📌 Author  
👤 [Linkedin](https://www.linkedin.com/in/aditya-jalgaonkar-b72a04282)  
- Portfolio Project on SQL & Data Analysis  
- Open to feedback & collaboration 🚀  
