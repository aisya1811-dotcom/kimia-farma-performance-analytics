### Data Preparation

-- 1. Membuat Tabel Analisa
CREATE OR REPLACE TABLE
  `rakamin-kf-analytics-510915.kimia_farma.kf_analisa` AS

SELECT
    -- Informasi Transaksi
    t.transaction_id,
    t.date,
    t.branch_id,

    -- Informasi Cabang
    c.branch_name,
    c.kota,
    c.provinsi,
    c.rating AS rating_cabang,

    -- Informasi Pelanggan
    t.customer_name,

    -- Informasi Produk
    t.product_id,
    p.product_name,
    t.price AS actual_price,
    t.discount_percentage,

    -- Persentase Gross Laba
    CASE
        WHEN t.price <= 50000 THEN 0.10
        WHEN t.price <= 100000 THEN 0.15
        WHEN t.price <= 300000 THEN 0.20
        WHEN t.price <= 500000 THEN 0.25
        ELSE 0.30
    END AS persentase_gross_laba,

    -- Nett Sales
    t.price * (1 - t.discount_percentage) AS nett_sales,

    -- Nett Profit
    (
        t.price * (1 - t.discount_percentage)
    ) *
    CASE
        WHEN t.price <= 50000 THEN 0.10
        WHEN t.price <= 100000 THEN 0.15
        WHEN t.price <= 300000 THEN 0.20
        WHEN t.price <= 500000 THEN 0.25
        ELSE 0.30
    END AS nett_profit,

    -- Rating Transaksi
    t.rating AS rating_transaksi

FROM
    `rakamin-kf-analytics-510915.kimia_farma.kf_final_transaction` AS t

LEFT JOIN
    `rakamin-kf-analytics-510915.kimia_farma.kf_kantor_cabang` AS c
    ON t.branch_id = c.branch_id

LEFT JOIN
    `rakamin-kf-analytics-510915.kimia_farma.kf_product` AS p
    ON t.product_id = p.product_id;


-- 2. Melihat Data Awal
SELECT *
FROM `rakamin-kf-analytics-510915.kimia_farma.kf_analisa`
LIMIT 10;


-- 3. Melihat Kolom-Kolom Utama
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
