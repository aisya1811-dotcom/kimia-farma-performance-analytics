### Analisis Cabang

-- 1. Ranking Cabang Berdasarkan Total Sales
SELECT
  branch_id,
  branch_name,
  kota,
  provinsi,
  rating_cabang,
  COUNT(*) AS jumlah_transaksi,
  ROUND(SUM(nett_sales), 2) AS total_nett_sales,
  ROUND(SUM(nett_profit), 2) AS total_nett_profit
FROM `rakamin-kf-analytics-510915.kimia_farma.kf_analisa`
GROUP BY
  branch_id,
  branch_name,
  kota,
  provinsi,
  rating_cabang
ORDER BY total_nett_sales DESC;


-- 2. Ranking Cabang Berdasarkan Total Profit
SELECT
  branch_id,
  branch_name,
  kota,
  provinsi,
  rating_cabang,
  COUNT(*) AS jumlah_transaksi,
  ROUND(SUM(nett_sales), 2) AS total_nett_sales,
  ROUND(SUM(nett_profit), 2) AS total_nett_profit
FROM `rakamin-kf-analytics-510915.kimia_farma.kf_analisa`
GROUP BY
  branch_id,
  branch_name,
  kota,
  provinsi,
  rating_cabang
ORDER BY total_nett_profit DESC;


-- 3. Ranking Cabang Berdasarkan Jumlah Transaksi
SELECT
  branch_id,
  branch_name,
  kota,
  provinsi,
  rating_cabang,
  COUNT(*) AS jumlah_transaksi,
  ROUND(SUM(nett_sales), 2) AS total_nett_sales,
  ROUND(SUM(nett_profit), 2) AS total_nett_profit
FROM `rakamin-kf-analytics-510915.kimia_farma.kf_analisa`
GROUP BY
  branch_id,
  branch_name,
  kota,
  provinsi,
  rating_cabang
ORDER BY jumlah_transaksi DESC;


-- 4. Ranking Cabang Berdasarkan Rata-rata Sales
SELECT
  branch_id,
  branch_name,
  kota,
  provinsi,
  rating_cabang,
  COUNT(*) AS jumlah_transaksi,
  ROUND(AVG(nett_sales), 2) AS rata_rata_nett_sales,
  ROUND(AVG(nett_profit), 2) AS rata_rata_nett_profit
FROM `rakamin-kf-analytics-510915.kimia_farma.kf_analisa`
GROUP BY
  branch_id,
  branch_name,
  kota,
  provinsi,
  rating_cabang
ORDER BY rata_rata_nett_sales DESC;


-- 5. Analisis Berdasarkan Rating Cabang
SELECT
  rating_cabang,
  COUNT(DISTINCT branch_id) AS jumlah_cabang,
  COUNT(*) AS jumlah_transaksi,
  ROUND(AVG(nett_sales), 2) AS rata_rata_nett_sales,
  ROUND(AVG(nett_profit), 2) AS rata_rata_nett_profit,
  ROUND(SUM(nett_sales), 2) AS total_nett_sales,
  ROUND(SUM(nett_profit), 2) AS total_nett_profit
FROM `rakamin-kf-analytics-510915.kimia_farma.kf_analisa`
GROUP BY rating_cabang
ORDER BY rating_cabang DESC;

-- 6. Top 5 Cabang dengan Rating Cabang Tertinggi
-- namun Rating Transaksi Terendah

SELECT
  branch_id,
  branch_name,
  kota,
  provinsi,
  rating_cabang,
  COUNT(*) AS jumlah_transaksi,
  ROUND(AVG(rating_transaksi), 2) AS rata_rata_rating_transaksi,
  ROUND(AVG(nett_sales), 2) AS rata_rata_nett_sales,
  ROUND(AVG(nett_profit), 2) AS rata_rata_nett_profit
FROM `rakamin-kf-analytics-510915.kimia_farma.kf_analisa`
GROUP BY
  branch_id,
  branch_name,
  kota,
  provinsi,
  rating_cabang
ORDER BY
  rating_cabang DESC,
  rata_rata_rating_transaksi ASC
LIMIT 5;
