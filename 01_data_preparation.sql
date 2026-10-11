### Data Preparation

-- 1. Melihat Data Awal
SELECT *
FROM `rakamin-kf-analytics-510915.kimia_farma.kf_analisa`
LIMIT 10;


-- 2. Melihat Kolom-Kolom Utama
SELECT
  transaction_id,
  date,
  branch_id,
  branch_name,
  kota,
  provinsi,
  rating_cabang,
  customer_name,
  product_id,
  product_name,
  actual_price,
  discount_percentage,
  persentase_gross_laba,
  nett_sales,
  nett_profit
FROM `rakamin-kf-analytics-510915.kimia_farma.kf_analisa`
LIMIT 10;
