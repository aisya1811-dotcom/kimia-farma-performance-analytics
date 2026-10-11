### Data Cleaning & Validation

-- 1. Mengecek Jumlah Baris Data
SELECT
  COUNT(*) AS jumlah_baris
FROM `rakamin-kf-analytics-510915.kimia_farma.kf_analisa`;


-- 2. Mengecek Missing Value
SELECT
  COUNTIF(transaction_id IS NULL) AS null_transaction_id,
  COUNTIF(date IS NULL) AS null_date,
  COUNTIF(branch_id IS NULL) AS null_branch_id,
  COUNTIF(product_id IS NULL) AS null_product_id,
  COUNTIF(nett_sales IS NULL) AS null_nett_sales,
  COUNTIF(nett_profit IS NULL) AS null_nett_profit
FROM `rakamin-kf-analytics-510915.kimia_farma.kf_analisa`;


-- 3. Mengecek Duplicate Transaction ID
SELECT
  transaction_id,
  COUNT(*) AS jumlah
FROM `rakamin-kf-analytics-510915.kimia_farma.kf_analisa`
GROUP BY transaction_id
HAVING COUNT(*) > 1;


-- 4. Mengecek Range Data
SELECT
  MIN(date) AS tanggal_awal,
  MAX(date) AS tanggal_akhir,
  MIN(actual_price) AS harga_minimum,
  MAX(actual_price) AS harga_maksimum,
  MIN(discount_percentage) AS diskon_minimum,
  MAX(discount_percentage) AS diskon_maksimum,
  MIN(rating_cabang) AS rating_minimum,
  MAX(rating_cabang) AS rating_maksimum
FROM `rakamin-kf-analytics-510915.kimia_farma.kf_analisa`;
