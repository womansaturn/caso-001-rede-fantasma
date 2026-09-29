-- MISSÃO 07: Conexões entre contas, clientes e dispositivos
-- Objetivo: identificar possíveis vínculos entre as contas
-- 5034, 5007 e 5011 por meio dos registros de login.


-- PARTE 1: Identificar os titulares das contas investigadas

SELECT
    accounts.account_id,
    accounts.customer_id,
    customers.full_name
FROM accounts
JOIN customers
    ON accounts.customer_id = customers.customer_id
WHERE accounts.account_id IN (5034, 5007, 5011);


-- PARTE 2: Consultar o histórico de login das contas investigadas

SELECT
    logins.account_id,
    customers.full_name,
    logins.device_id,
    logins.ip_address,
    logins.login_at
FROM logins
JOIN accounts
    ON logins.account_id = accounts.account_id
JOIN customers
    ON accounts.customer_id = customers.customer_id
WHERE logins.account_id IN (5034, 5007, 5011)
ORDER BY logins.login_at;


-- PARTE 3: Encontrar dispositivos usados por mais de uma conta

SELECT
    device_id,
    COUNT(DISTINCT account_id) AS different_accounts
FROM logins
GROUP BY device_id
HAVING COUNT(DISTINCT account_id) > 1
ORDER BY different_accounts DESC;


-- PARTE 4: Identificar as contas ligadas ao dispositivo suspeito

SELECT DISTINCT
    logins.account_id,
    accounts.customer_id,
    customers.full_name,
    logins.device_id
FROM logins
JOIN accounts
    ON logins.account_id = accounts.account_id
JOIN customers
    ON accounts.customer_id = customers.customer_id
WHERE logins.device_id = 'dev_D31QVAWK'
ORDER BY logins.account_id;


-- PARTE 5: Organizar cronologicamente os acessos do dispositivo

SELECT
    account_id,
    device_id,
    ip_address,
    login_at
FROM logins
WHERE device_id = 'dev_D31QVAWK'
ORDER BY login_at;

-- Descoberta:
-- O mesmo dispositivo foi utilizado para acessar contas diferentes.
-- Os acessos ocorreram no mesmo dia, com intervalos de aproximadamente
-- quatro minutos, indicando uma possível ligação entre as contas.
