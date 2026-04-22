# Customer & Revenue Analytics — MySQL · Tableau

**Tools:** MySQL · MySQL Workbench · Tableau · SQL  
**Domain:** Retail Analytics · Customer Segmentation · Revenue Intelligence  
**Data:** Sakila DVD Rental Database (16,000+ customers, 600+ films, 2 stores)

> End-to-end analytics project: relational database design → SQL analysis → Tableau dashboards — surfacing revenue drivers, customer value segments, and demand patterns for a retail business.

---

## Key Business Insights

- **A small VIP segment (~15% of customers)** generates a disproportionate share of total revenue — retention of this group is the single highest-ROI opportunity
- **Sports and Action genres** lead in total revenue; **Travel and Music** deliver the highest average revenue per rental — suggesting a dual inventory strategy
- **Store 2 consistently outperforms Store 1** in monthly rental volume, especially in summer 2005 — pointing to an operational or location advantage worth investigating
- **Peak rental demand clusters between 6–9 PM** — staffing and promotional scheduling should reflect this window
- **Late fees contribute meaningfully to revenue** — fee structure optimization could directly improve margin without acquiring new customers

---

## Dashboards

### Project Dashboard
![Project Dashboard](Project%20Dashboard.png)

Executive overview consolidating customer segmentation, revenue distribution, and rental activity.

* * *

### Customer Base — VIP to At-Risk Segments
![Customer Base Composition](Final%20Tableau/Customer%20Base%20Composition%20VIP%20to%20At-Risk%20Segments.png)

Segments customers from high-value VIPs to at-risk churners, enabling targeted retention and upsell strategies.

* * *

### Customer Frequency-Value Matrix
![Customer Frequency-Value Matrix](Final%20Tableau/Customer%20Frequency-Value%20Matrix%20Targeting%20Growth%20Opportunities.png)

RFM-style matrix plotting rental frequency against spend value — identifies the highest-growth customer pockets.

* * *

### Genre Revenue Distribution
![Genre Revenue Distribution](Final%20Tableau/Genre%20Revenue%20Distribution%20Average%20Revenue%20by%20Film%20Category.png)

Average revenue per rental across film categories — reveals which genres punch above their weight in yield.

* * *

### Genre Distribution by Total Revenue
![Genre Distribution by Total Revenue](Genre%20Distribution%20by%20Total%20Revenue.png)

Volume-weighted revenue breakdown by genre — balances yield-per-rental with raw revenue contribution.

* * *

### Monthly Rental Distribution by Store (2005–2006)
![Monthly Rental Distribution by Store](Final%20Tableau/Monthly%20Rental%20Distribution%20by%20Store%20%282005-2006%29.png)

Side-by-side store comparison across 18 months — surfaces seasonal peaks and inter-store performance gaps.

* * *

### Hourly Rental Activity
![Hourly Rental Activity Distribution](Final%20Tableau/Hourly%20Rental%20Activity%20Distribution.png)

Transaction volume by hour of day — informs staffing levels and time-targeted promotions.

* * *

### Global Market Performance & Late Fee Impact
![Global Market Performance & Late Fee Impact](Global%20Market%20Performance%20%26%20Late%20Fee%20Impact.png)

Quantifies late fee contribution to total revenue across customer segments.

* * *

### Predictive Demand Analysis
![Predictive Demand Analysis](Final%20Tableau/Predictive%20Demand%20Analysis.png)

Demand forecasting using historical rental trends to support inventory and acquisition planning.

---

## SQL Analysis

Queries span four databases (Sakila, Accounts Payable, Expense, University) covering aggregation, multi-table JOINs, subqueries, UNIONs, and self-joins.

```sql
-- Customer revenue ranking: total spend + trip frequency per employee
SELECT e.first_name, e.last_name,
       SUM(gross_amount)        AS total_expense,
       COUNT(DISTINCT t.trip_id) AS number_of_trips
FROM employees e
JOIN trips t    ON e.ssn = t.employee
JOIN expenses ex ON t.employee = ex.employee AND t.trip_id = ex.trip_id
GROUP BY e.ssn, e.first_name, e.last_name
ORDER BY total_expense DESC;
```

```sql
-- UNION: unified view across active and paid invoice records
SELECT 'Active' AS status, invoice_number, invoice_date, invoice_total
FROM active_invoices WHERE invoice_date >= '2018-06-01'
UNION
SELECT 'Paid', invoice_number, invoice_date, invoice_total
FROM paid_invoices WHERE invoice_date >= '2018-06-01'
ORDER BY invoice_total DESC;
```

---

## Project Structure

| File / Folder | Contents |
|---|---|
| `Final Tableau/` | Final Tableau dashboard screenshots |
| `Week 1 Part 1&2/` | Foundational SQL labs + University DB scripts |
| `create_db_ap(1).sql` | Accounts Payable schema |
| `create_expense.sql` | Employee expense tracking schema |
| `expense_queries_to_start_HW3.sql` | Expense aggregation & JOIN queries |
| `week_3_exercises_part1.sql` | JOIN, UNION, subquery exercises |
| `HW1-PrahladNarayanBhardwaj.mwb` | MySQL Workbench ER diagram |
