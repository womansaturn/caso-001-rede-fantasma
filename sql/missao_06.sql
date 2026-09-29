-- MISSÃO 06: Movimentações dos destinos recorrentes
-- Pergunta: o que as contas 5007 e 5011 fizeram após receberem
-- transferências da conta 5034?

SELECT
    transaction_id,
    source_account_id,
    destination_account_id,
    amount,
    occurred_at
FROM transactions
WHERE source_account_id IN (5007, 5011)
  AND occurred_at >= '2026-09-09'
ORDER BY occurred_at;
