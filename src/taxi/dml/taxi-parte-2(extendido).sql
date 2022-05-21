-- chn e nome dos motoristas que já tiveram e estao na fila
SELECT DISTINCT m.cnh, m.nome
FROM motorista m
INNER JOIN fila f
ON m.cnh = f.cnh;

-- Select com atributos ambiguos
SELECT 
    ta.placa,
    modelo,
    cliid
FROM
    taxi ta,
    corrida co
WHERE
    ta.placa = co.placa;


-- Select utilizando ORDER BY
SELECT anofab, marca, modelo
FROM taxi
ORDER BY anofab DESC; -- ASC

-- Menor quilometragem de entrada em cada zona
SELECT zona, MIN(kmin)
FROM fila
GROUP BY zona;

-- Menor quilometragem até 5000 km de entrada em cada zona
SELECT zona, MIN(kmin) mkmin
FROM fila
GROUP BY zona
HAVING mkmin < 5000;

-- Zonas que receberam algum taxi na fila (com aninhamento / IN)
SELECT z.zona
    FROM Zona z
    WHERE z.zona IN (SELECT DISTINCT f.zona FROM fila f);

-- Zonas que não receberam algum taxi na fila (com aninhamento / IN)
SELECT z.zona
    FROM Zona z
    WHERE z.zona NOT IN (SELECT DISTINCT f.zona FROM fila f);