-- MISSÃO 03: Contas que mais enviaram dinheiro
-- Pergunta: quais contas tiveram o maior volume financeiro de saída?

SELECT
    source_account_id,
    COUNT(*) AS outgoing_transactions,
    SUM(amount) AS total_sent
FROM transactions
GROUP BY source_account_id
ORDER BY total_sent DESC
LIMIT 10;

-- Descoberta:
-- A conta 5034 realizou 12 transferências e enviou R$ 33.956,08.
-- Embora não tenha a maior quantidade de operações, apresentou
-- um volume financeiro de saída muito superior às demais contas.
