# Olist E-Commerce Analytics Pipeline

An end-to-end data modeling project built with **dbt** and **Google BigQuery** on the Brazilian E-Commerce dataset by Olist — 100k+ real orders from a Brazilian marketplace.

---

## What this project does

Raw e-commerce data (orders, customers, products, sellers, payments) gets cleaned, modeled, and transformed into business-ready tables that answer questions like:

- How much revenue did we generate per day per state?
- Which sellers have the highest delay rate?
- What percentage of orders are delivered late?

---

## Stack

- **dbt** — data modeling and testing
- **Google BigQuery** — cloud data warehouse
- **GitHub Actions** — runs dbt automatically on every push
- **Looker Studio** — dashboard connected to the marts

---

## Project structure

```
models/
├── staging/       # clean and rename raw tables
│   ├── stg_orders.sql
│   ├── stg_customers.sql
│   ├── stg_order_items.sql
│   ├── stg_products.sql
│   ├── stg_sellers.sql
│   └── stg_payments.sql
└── marts/         # business logic and aggregations
    ├── fct_orders.sql
    ├── mart_revenue_daily.sql
    └── mart_seller_performance.sql
```

---

## Data quality

23 dbt tests running on every model — not_null, unique, and accepted_values checks.

```bash
dbt test
# 23 of 23 PASS ✅
```

---

## How to run it

1) Prerequisites

Python 3.11+
Google Cloud account with BigQuery access
dbt-bigquery installed

2) SETUP


bash# Clone the repo
git clone https://github.com/YOUR_USERNAME/olist-ecommerce-dbt-bigquery.git
cd olist-ecommerce-dbt-bigquery

#Install dependencies
pip install dbt-bigquery

#Configure your BigQuery connection
Edit ~/.dbt/profiles.yml with your project credentials => IMPORTANT

#Run the pipeline
cd olist_project
dbt run
dbt test

Generate docs
dbt docs generate
dbt docs serve
```
