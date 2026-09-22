-- MISSÃO 05: Destinos recorrentes da conta 5034
-- Pergunta: quais contas receberam dinheiro da conta 5034 mais de uma vez?

SELECT
    destination_account_id,
    COUNT(*) AS times_received,
    SUM(amount) AS total_received
FROM transactions
WHERE source_account_id = 5034
GROUP BY destination_account_id
HAVING COUNT(*) > 1;

-- Descoberta:
-- Duas contas de destino receberam transferências da conta 5034
-- mais de uma vez. Entre elas, a conta 5007 recebeu duas
-- transferências, totalizando R$ 8.348,28.
