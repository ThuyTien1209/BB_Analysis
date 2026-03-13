# BB_Dataset — Data Source Metadata

**Project:** Data Analysis for Business Professionals — Fashion Retail  
**Period:** January 1, 2024 – May 26, 2024 (5 months)  

---

## 1. Daily Sales 

### Overview
Aggregated daily sales data recorded at the store level. Each row represents one operating day.

### Fields

| Field | Type | Description |
|---|---|---|
| `Date` | date | Date of sales transactions (`YYYY-MM-DD`) |
| `Day` | integer | Day of the month (1–31) |
| `Month` | integer | Month number (1–12) |
| `Year` | integer | Year |
| `Week_No` | integer | ISO week number of the year |
| `Weekday` | string | Day of the week (e.g., Thứ Hai, Thứ Ba) |
| `Bill_Count` | integer | Total number of transactions (bills) processed that day |
| `Units` | integer | Total number of items sold |
| `APT` | float | Average Price per Transaction — total daily revenue divided by number of bills |
| `UPT` | float | Units per Transaction — total units sold divided by number of bills |
| `Traffic` | integer | Total number of store visitors (footfall) |
| `Conversion_Rate` | float (%) | Percentage of visitors who made a purchase (`Bill_Count / Traffic`) |
| `Revenue` | float (VND) | Total revenue generated for the day |
| `Target_by_Day` | float (VND) | Daily revenue target set for that day |


### Notes
- `APT` in this dataset is equivalent to Average Transaction Value (ATV) or Average Order Value (AOV).
- Daily targets vary — higher targets are assigned on weekends and promotional periods.

---

## 2. Transaction Data 

### Overview
Line-item level transaction data. Each row represents one product item sold within a specific order. Multiple rows can share the same `Order_ID` when a customer purchases more than one item.

### Fields

| Field | Type | Description |
|---|---|---|
| `Date` | date | Date of the transaction (`YYYY-MM-DD`) |
| `Day` | integer | Day of the month |
| `Month` | integer | Month number |
| `Year` | integer | Year |
| `Week_No` | integer | ISO week number |
| `Weekday` | string | Day of the week |
| `Hour` | time | Timestamp of the transaction (HH:MM:SS) |
| `SKU_1` | string | Base product code — identifies a design regardless of size or color (e.g., `D2928`) |
| `SKU_2` | string | Full product code — unique per size and color variant (e.g., `D2928-1`) |
| `Product_Category` | string | Physical garment type (e.g., Đầm, Set, Áo dài, Áo, Quần, Chân váy) |
| `Product_Type` | string | Occasion or use-case classification (e.g., Tiệc, Công sở, Lifestyle, BST) |
| `Order_ID` | string | Unique identifier for each customer transaction (e.g., `#283578`) |
| `Units` | integer | Number of this SKU purchased in the order |
| `Discount` | float (VND) | Discount amount applied to this line item (`-` if no discount) |
| `Revenue` | float (VND) | Net revenue from this line item after discount |
| `Merchandise_Type` | string | Inventory lifecycle classification (see below) |
| `Customer_Type` | string | Whether the customer is new or returning (`Khách Hàng Mới` / `Khách Hàng Cũ`) |

### Merchandise Type Reference

| Value | Description |
|---|---|
| `Hàng mới đợt 1` | Newly launched products — listed within the past 30 days |
| `Hero` | High-performing products with a lifecycle of 6–12 months |
| `Đinh` | Evergreen staples sold year-round; lifecycle of 18–24 months |
| `Hàng bán bình thường` | Standard sellers; lifecycle of 3–6 months before moving to Off mã |
| `Off mã` | Slow-moving products; discontinued once current stock is sold |
| `Phụ kiện` | Accessories sourced from third-party suppliers |

### Relationships
- `SKU_1` → `SKU_2`: One-to-many (one design can have multiple size/color variants)
- `Order_ID` → rows: One-to-many (one order can contain multiple line items)
- `Date` in `transaction_data` → `Date` in `daily_sales`: Many-to-one (join key for combining datasets)


