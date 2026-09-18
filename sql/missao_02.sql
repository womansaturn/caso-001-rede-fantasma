-- MISSÃO 02: Os maiores movimentos
-- Pergunta: quais foram as 10 maiores transações do período?

SELECT
    transaction_id,
    source_account_id,
    destination_account_id,
    amount,
    occurred_at
FROM transactions
ORDER BY amount DESC
LIMIT 10;

-- Descoberta:
-- A conta de origem 5034 aparece três vezes entre as maiores
-- transações, enviando valores elevados para contas diferentes
-- em um intervalo inferior a cinco dias.
