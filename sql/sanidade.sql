-- ===========================================
-- Projeto NewFase - Análise de Pedidos e Entregas
-- Etapa A — Consultas de Sanidade
-- Autor: Vanthuir
-- Data: 20-08-2025
-- ===========================================

-- 1. Contagem total de registros
SELECT COUNT(*) AS total_registros
FROM newfase.stg_dados;

-- 2. Verificação de nulos ou vazios em campos críticos
SELECT
  SUM(CASE WHEN shipment_id::text IS NULL OR trim(shipment_id::text) = '' THEN 1 ELSE 0 END) AS nulos_shipment_id,
  SUM(CASE WHEN order_date::text IS NULL OR trim(order_date::text) = '' THEN 1 ELSE 0 END) AS nulos_order_date,
  SUM(CASE WHEN promised_date::text IS NULL OR trim(promised_date::text) = '' THEN 1 ELSE 0 END) AS nulos_promised_date,
  SUM(CASE WHEN ship_date::text IS NULL OR trim(ship_date::text) = '' THEN 1 ELSE 0 END) AS nulos_ship_date,
  SUM(CASE WHEN delivery_date::text IS NULL OR trim(delivery_date::text) = '' THEN 1 ELSE 0 END) AS nulos_delivery_date,
  SUM(CASE WHEN distance_km::text IS NULL OR trim(distance_km::text) = '' THEN 1 ELSE 0 END) AS nulos_distance_km,
  SUM(CASE WHEN weight_kg::text IS NULL OR trim(weight_kg::text) = '' THEN 1 ELSE 0 END) AS nulos_weight_kg,
  SUM(CASE WHEN total_cost::text IS NULL OR trim(total_cost::text) = '' THEN 1 ELSE 0 END) AS nulos_total_cost,
  SUM(CASE WHEN on_time::text IS NULL OR trim(on_time::text) = '' THEN 1 ELSE 0 END) AS nulos_on_time
FROM newfase.stg_dados;

-- 3. Faixas de datas (mínimo e máximo)
SELECT
  MIN(NULLIF(order_date::text, '')::date)       AS min_order_date,
  MAX(NULLIF(order_date::text, '')::date)       AS max_order_date,
  MIN(NULLIF(promised_date::text, '')::date)    AS min_promised_date,
  MAX(NULLIF(promised_date::text, '')::date)    AS max_promised_date,
  MIN(NULLIF(ship_date::text, '')::date)        AS min_ship_date,
  MAX(NULLIF(ship_date::text, '')::date)        AS max_ship_date,
  MIN(NULLIF(delivery_date::text, '')::date)    AS min_delivery_date,
  MAX(NULLIF(delivery_date::text, '')::date)    AS max_delivery_date
FROM newfase.stg_dados;

-- 4. Estatísticas numéricas
SELECT
  MIN(NULLIF(distance_km::text, '')::numeric)   AS min_distance,
  MAX(NULLIF(distance_km::text, '')::numeric)   AS max_distance,

  MIN(NULLIF(weight_kg::text, '')::numeric)     AS min_weight,
  MAX(NULLIF(weight_kg::text, '')::numeric)     AS max_weight,

  MIN(NULLIF(freight_price::text, '')::numeric) AS min_freight_price,
  MAX(NULLIF(freight_price::text, '')::numeric) AS max_freight_price,

  MIN(NULLIF(total_cost::text, '')::numeric)    AS min_total_cost,
  MAX(NULLIF(total_cost::text, '')::numeric)    AS max_total_cost,

  MIN(NULLIF(delay_days::text, '')::numeric)    AS min_delay_days,
  MAX(NULLIF(delay_days::text, '')::numeric)    AS max_delay_days
FROM newfase.stg_dados;

-- 5. Status das entregas
SELECT status, COUNT(*) AS qtd
FROM newfase.stg_dados
GROUP BY status
ORDER BY qtd DESC;

-- 6. Tipos de veículos
SELECT vehicle_type, COUNT(*) AS qtd
FROM newfase.stg_dados
GROUP BY vehicle_type
ORDER BY qtd DESC;

-- 7. Indicador de entrega no prazo
SELECT on_time, COUNT(*) AS qtd
FROM newfase.stg_dados
GROUP BY on_time
ORDER BY on_time;
