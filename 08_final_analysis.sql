### Final Analysis

-- 1. Ringkasan Performa Bisnis
SELECT
  MIN(date) AS tanggal_awal,
  MAX(date) AS tanggal_akhir,
  COUNT(*) AS jumlah_transaksi,
  COUNT(DISTINCT branch_id) AS jumlah_cabang,
  COUNT(DISTINCT product_id) AS jumlah_produk,
  COUNT(DISTINCT provinsi) AS jumlah_provinsi,
  ROUND(SUM(nett_sales), 2) AS total_nett_sales,
  ROUND(SUM(nett_profit), 2) AS total_nett_profit,
  ROUND(AVG(nett_sales), 2) AS rata_rata_nett_sales,
  ROUND(AVG(nett_profit), 2) AS rata_rata_nett_profit,
  ROUND(AVG(discount_percentage) * 100, 2) AS rata_rata_diskon_persen,
  ROUND(AVG(rating_cabang), 2) AS rata_rata_rating_cabang
FROM `rakamin-kf-analytics-510915.kimia_farma.kf_analisa`;


-- 2. Ringkasan Performa Tahunan
SELECT
  EXTRACT(YEAR FROM date) AS tahun,
  COUNT(*) AS jumlah_transaksi,
  ROUND(SUM(nett_sales), 2) AS total_nett_sales,
  ROUND(SUM(nett_profit), 2) AS total_nett_profit
FROM `rakamin-kf-analytics-510915.kimia_farma.kf_analisa`
GROUP BY tahun
ORDER BY tahun;


-- 3. Kontribusi Provinsi terhadap Total Sales dan Profit
SELECT
  provinsi,
  COUNT(*) AS jumlah_transaksi,
  ROUND(SUM(nett_sales), 2) AS total_nett_sales,
  ROUND(SUM(nett_profit), 2) AS total_nett_profit,
  ROUND(
    SUM(nett_sales) /
    SUM(SUM(nett_sales)) OVER () * 100,
    2
  ) AS kontribusi_sales_persen,
  ROUND(
    SUM(nett_profit) /
    SUM(SUM(nett_profit)) OVER () * 100,
    2
  ) AS kontribusi_profit_persen
FROM `rakamin-kf-analytics-510915.kimia_farma.kf_analisa`
GROUP BY provinsi
ORDER BY total_nett_sales DESC;


-- 4. Evaluasi Diskon
SELECT
  ROUND(discount_percentage * 100, 0) AS diskon_persen,
  COUNT(*) AS jumlah_transaksi,
  ROUND(SUM(nett_sales), 2) AS total_nett_sales,
  ROUND(SUM(nett_profit), 2) AS total_nett_profit,
  ROUND(AVG(nett_sales), 2) AS rata_rata_nett_sales,
  ROUND(AVG(nett_profit), 2) AS rata_rata_nett_profit
FROM `rakamin-kf-analytics-510915.kimia_farma.kf_analisa`
GROUP BY diskon_persen
ORDER BY diskon_persen;


-- 5. Top 10 Produk Berdasarkan Profit per Transaksi
SELECT
  product_id,
  product_name,
  COUNT(*) AS jumlah_transaksi,
  ROUND(SUM(nett_sales), 2) AS total_nett_sales,
  ROUND(SUM(nett_profit), 2) AS total_nett_profit,
  ROUND(AVG(nett_sales), 2) AS rata_rata_nett_sales,
  ROUND(AVG(nett_profit), 2) AS rata_rata_nett_profit
FROM `rakamin-kf-analytics-510915.kimia_farma.kf_analisa`
GROUP BY
  product_id,
  product_name
ORDER BY rata_rata_nett_profit DESC
LIMIT 10;
