### Analisis_Produk

-- 1. Ranking Produk Berdasarkan Total Sales
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
ORDER BY total_nett_sales DESC;


-- 2. Ranking Produk Berdasarkan Total Profit
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
ORDER BY total_nett_profit DESC;


-- 3. Ranking Produk Berdasarkan Jumlah Transaksi
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
ORDER BY jumlah_transaksi DESC;


-- 4. Top 10 Produk Berdasarkan Profit per Transaksi
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


-- 5. Ranking Kategori Produk Berdasarkan Total Sales
SELECT
  p.product_category,
  COUNT(*) AS jumlah_transaksi,
  COUNT(DISTINCT a.product_id) AS jumlah_produk,
  ROUND(SUM(a.nett_sales), 2) AS total_nett_sales,
  ROUND(SUM(a.nett_profit), 2) AS total_nett_profit,
  ROUND(AVG(a.nett_sales), 2) AS rata_rata_nett_sales,
  ROUND(AVG(a.nett_profit), 2) AS rata_rata_nett_profit
FROM `rakamin-kf-analytics-510915.kimia_farma.kf_analisa` a
JOIN `rakamin-kf-analytics-510915.kimia_farma.kf_product` p
  ON a.product_id = p.product_id
GROUP BY p.product_category
ORDER BY total_nett_sales DESC;


-- 6. Ranking Kategori Produk Berdasarkan Rata-rata Profit
SELECT
  p.product_category,
  COUNT(*) AS jumlah_transaksi,
  COUNT(DISTINCT a.product_id) AS jumlah_produk,
  ROUND(AVG(a.nett_sales), 2) AS rata_rata_nett_sales,
  ROUND(AVG(a.nett_profit), 2) AS rata_rata_nett_profit
FROM `rakamin-kf-analytics-510915.kimia_farma.kf_analisa` a
JOIN `rakamin-kf-analytics-510915.kimia_farma.kf_product` p
  ON a.product_id = p.product_id
GROUP BY p.product_category
ORDER BY rata_rata_nett_profit DESC;
