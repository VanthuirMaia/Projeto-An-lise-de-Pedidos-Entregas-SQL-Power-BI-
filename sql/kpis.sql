-- ===========================================
-- Projeto NewFase - Análise de Pedidos e Entregas
-- Etapa B — KPIs via SQL
-- Autor: Vanthuir
-- Data: 21-08-2025
-- ===========================================

--1. OTD (On-Time Delivery %)
SELECT
    DATE_TRUNC('month', order_date) AS mes,
    COUNT(*) AS total_entregas,
    SUM(CASE WHEN on_time = 1 THEN 1 ELSE 0 END) AS entregas_no_prazo,
    ROUND(SUM(CASE WHEN on_time = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS perc_otd
FROM newfase.stg_dados
WHERE order_date IS NOT NULL AND trim(order_date) <> ''
GROUP BY mes
ORDER BY mes;