# Fashion Retail Sales Analysis

## Overview
This project analyzes the sales performance of a women's fashion retail store using transactional data.  
The goal is to explore sales trends, product performance, and customer purchasing behavior to generate actionable insights for retail decision-making.

## Dataset
Aggregated data from multiple sources (POS transactions, product catalog, sales summary, and store traffic) to create a consolidated dataset. After cleaning and preprocessing, the data was divided into two datasets for analysis:

- **Daily Sales:** aggregated store metrics such as revenue, number of bills, units sold, traffic, and calculated conversion rate, APT, UPT
- **Transaction Data:** transaction-level records including product category, SKU, price, discount, and customer type

## Analysis
Key analyses include:

- Sales trends and revenue performance over time  
- Revenue contribution by product category  
- Best-selling and underperforming products  
- Customer type analysis (new vs member)

## Tools
Python (Pandas, NumPy), Excel, Power BI, SQL, PowerPoint

## Main findings
## Main Findings

- Store generated **~6.2B VND revenue from 20,127 units**, with an average **conversion rate of 63.1%**.
- **Weekend drives more revenue**, with **Sat–Sun averaging ~50–55M VND/day** while weekly revenue fluctuates.
- **Customer basket remains stable:** **UPT ~1.83 items** and **APT ~561K VND** per transaction.
- **Revenue highly concentrated by category:** **“Tiệc” contributes ~55% (~4B VND)**, far exceeding other categories.
- **Peak shopping hours occur in the evening (19:00–21:00)**.
- **Top SKUs dominate sales:** e.g., **BBQ1671S** and **Q2183S**.

## Outcome
Developed 2 retail performance dashboards to generate insights to support data-driven decisions in product strategy, pricing, and sales performance

- **Sales Dashboard:** utilized Pivot in Excel to visualise sales performance
- **Product Dashboard:** using PowerBI for further analysing on product performance and customer type contribution.

<table>
<tr>
<td><img src="<img width="1869" height="933" alt="Excel_Daily_Sailes" src="https://github.com/user-attachments/assets/315e1c36-b77b-4659-8824-adee9b590575" />
" width="100%"></td>
<td><img src="[PowerBI_Transaction_Data.pdf](https://github.com/user-attachments/files/25924417/PowerBI_Transaction_Data.pdf)
" width="100%"></td>
</tr>
</table>
