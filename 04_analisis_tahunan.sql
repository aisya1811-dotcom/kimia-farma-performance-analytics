### Analisis Tahunan

-- 1. Performa Bisnis per Tahun
SELECT
  EXTRACT(YEAR FROM date) AS tahun,
  COUNT(*) AS jumlah_transaksi,
  ROUND(SUM(nett_sales), 2) AS total_nett_sales,
  ROUND(SUM(nett_profit), 2) AS total_nett_profit,
  ROUND(AVG(nett_sales), 2) AS rata_rata_nett_sales,
  ROUND(AVG(nett_profit), 2) AS rata_rata_nett_profit
FROM `rakamin-kf-analytics-510915.kimia_farma.kf_analisa`
GROUP BY tahun
ORDER BY tahun;
