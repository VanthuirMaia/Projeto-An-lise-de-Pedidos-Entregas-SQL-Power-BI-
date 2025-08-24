-- ===========================================
-- Projeto NewFase - Análise de Pedidos e Entregas
-- Criação de Views para facilitar consultas futuras
-- Autor: Vanthuir
-- Data: 24-08-2025
-- ===========================================

-- vw_otd_mensal: On-Time Delivery Mensal
CREATE OR REPLACE VIEW newfase.vw_otd_mensal AS
SELECT 
    DATE_TRUNC('month', order_date::date) AS mes,
    COUNT(*) AS total_entregas,
    SUM(CASE WHEN on_time IS TRUE THEN 1 ELSE 0 END) AS entregas_no_prazo,
    ROUND(
        SUM(CASE WHEN on_time IS TRUE THEN 1 ELSE 0 END) * 100.0 / NULLIF(COUNT(*), 0), 
        2
    ) AS perc_otd
FROM newfase.fato_entregas
WHERE order_date IS NOT NULL
GROUP BY DATE_TRUNC('month', order_date::date)
ORDER BY mes;

-- OTD por transportadora 
CREATE OR REPLACE VIEW newfase.vw_otd_por_transportadora AS
SELECT 
    carrier,
    COUNT(*) AS total_entregas,
    SUM(CASE WHEN on_time IS TRUE THEN 1 ELSE 0 END) AS entregas_no_prazo,
    ROUND(SUM(CASE WHEN on_time IS TRUE THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS perc_otd
FROM newfase.fato_entregas
GROUP BY carrier
ORDER BY perc_otd DESC;

-- OTD por veículo
CREATE OR REPLACE VIEW newfase.vw_otd_por_veiculo AS
SELECT 
    vehicle_type,
    COUNT(*) AS total_entregas,
    SUM(CASE WHEN on_time IS TRUE THEN 1 ELSE 0 END) AS entregas_no_prazo,
    ROUND(SUM(CASE WHEN on_time IS TRUE THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS perc_otd
FROM newfase.fato_entregas
GROUP BY vehicle_type
ORDER BY perc_otd DESC;

-- OTD por região de origem
CREATE OR REPLACE VIEW newfase.vw_otd_por_regiao AS
SELECT 
    origin_region,
    COUNT(*) AS total_entregas,
    SUM(CASE WHEN on_time IS TRUE THEN 1 ELSE 0 END) AS entregas_no_prazo,
    ROUND(SUM(CASE WHEN on_time IS TRUE THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS perc_otd
FROM newfase.fato_entregas
GROUP BY origin_region
ORDER BY perc_otd DESC;
