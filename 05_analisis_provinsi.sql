### Analisis Provinsi

-- 1. Ranking Berdasarkan Total Sales
SELECT
  provinsi,
  COUNT(*) AS jumlah_transaksi,
  ROUND(SUM(nett_sales), 2) AS total_nett_sales,
  ROUND(SUM(nett_profit), 2) AS total_nett_profit
FROM `rakamin-kf-analytics-510915.kimia_farma.kf_analisa`
GROUP BY provinsi
ORDER BY total_nett_sales DESC;


-- 2. Ranking Berdasarkan Total Profit
SELECT
  provinsi,
  COUNT(*) AS jumlah_transaksi,
  ROUND(SUM(nett_sales), 2) AS total_nett_sales,
  ROUND(SUM(nett_profit), 2) AS total_nett_profit
FROM `rakamin-kf-analytics-510915.kimia_farma.kf_analisa`
GROUP BY provinsi
ORDER BY total_nett_profit DESC;


-- 3. Ranking Berdasarkan Jumlah Transaksi
SELECT
  provinsi,
  COUNT(*) AS jumlah_transaksi,
  ROUND(SUM(nett_sales), 2) AS total_nett_sales,
  ROUND(SUM(nett_profit), 2) AS total_nett_profit
FROM `rakamin-kf-analytics-510915.kimia_farma.kf_analisa`
GROUP BY provinsi
ORDER BY jumlah_transaksi DESC;


-- 4. Rata-rata Sales dan Profit per Transaksi
SELECT
  provinsi,
  COUNT(*) AS jumlah_transaksi,
  ROUND(AVG(nett_sales), 2) AS rata_rata_nett_sales,
  ROUND(AVG(nett_profit), 2) AS rata_rata_nett_profit
FROM `rakamin-kf-analytics-510915.kimia_farma.kf_analisa`
GROUP BY provinsi
ORDER BY rata_rata_nett_sales DESC;


-- 5. Kontribusi Provinsi terhadap Total Sales dan Profit
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
