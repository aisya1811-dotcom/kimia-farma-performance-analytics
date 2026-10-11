# Kimia Farma Performance Analytics

Performance Analytics Kimia Farma periode 2020–2023 menggunakan BigQuery dan Google Looker Studio.

## Project Overview

Project ini bertujuan untuk melakukan analisis data transaksi dan performa bisnis Kimia Farma periode 2020–2023. Analisis dilakukan menggunakan BigQuery untuk pengolahan dan analisis data, kemudian hasilnya divisualisasikan melalui Google Looker Studio dalam bentuk dashboard interaktif.

## Objectives

Analisis dilakukan untuk memperoleh insight mengenai:

- Perkembangan nett sales dan nett profit dari tahun ke tahun
- Pengaruh tingkat diskon terhadap sales dan profit
- Performa transaksi dan sales berdasarkan provinsi
- Performa cabang berdasarkan rating
- Performa produk berdasarkan sales dan profit
- Distribusi nett profit berdasarkan provinsi

## Tools

- Google BigQuery
- Google Looker Studio
- GitHub

## Data Period

**2020–2023**

## SQL Analysis

Repository ini berisi syntax SQL yang digunakan dalam proses analisis:

1. `01_data_preparation.sql` — Data preparation
2. `02_data_cleaning_validation.sql` — Data cleaning dan validation
3. `03_analisis_diskon.sql` — Analisis berdasarkan tingkat diskon
4. `04_analisis_tahunan.sql` — Analisis tahunan
5. `05_analisis_provinsi.sql` — Analisis berdasarkan provinsi
6. `06_analisis_cabang.sql` — Analisis performa cabang
7. `07_analisis_produk.sql` — Analisis performa produk
8. `08_final_analysis.sql` — Final analysis untuk kebutuhan dashboard

## Dashboard

Hasil analisis divisualisasikan dalam dashboard **Kimia Farma Performance Analytics 2020–2023** menggunakan Google Looker Studio.

Dashboard mencakup:

- Total Transactions
- Total Nett Sales
- Total Nett Profit
- Total Branches
- Nett Sales by Year
- Top 10 Total Transactions by Province
- Top 10 Nett Sales by Province
- Top 5 Branches berdasarkan Branch Rating dan Transaction Rating
- Nett Profit by Province melalui peta Indonesia
- Filter berdasarkan periode tanggal dan provinsi

## Project Output

Dashboard digunakan sebagai media untuk menyajikan hasil analisis secara interaktif dan membantu memberikan gambaran mengenai performa bisnis Kimia Farma selama periode 2020–2023.
