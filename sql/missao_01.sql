-- MISSÃO 01: Reconhecimento da cena
-- Pergunta: quantas transações existem e entre quais datas ocorreram?

SELECT
    COUNT(*) AS total_transactions,
    MIN(occurred_at) AS first_transaction,
    MAX(occurred_at) AS last_transaction
FROM transactions;

-- Descoberta:
-- 276 transações entre 01/09/2026 11:44 e 14/09/2026 21:36.

