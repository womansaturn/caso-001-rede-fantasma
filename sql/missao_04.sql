-- MISSÃO 04: Rastreamento da conta 5034
-- Pergunta: quais transferências foram realizadas pela conta 5034?

SELECT
    transaction_id,
    source_account_id,
    destination_account_id,
    amount,
    occurred_at
FROM transactions
WHERE source_account_id = 5034
ORDER BY occurred_at;

-- Descoberta:
-- A conta 5034 realizou 12 transferências para diferentes contas
-- durante o período analisado, concentrando um volume elevado de saída.
