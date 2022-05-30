-- cnh e nome dos motoristas que já tiveram e estao na fila - Junção
SELECT 
    m.cnh, m.nome
FROM 
    taxi.motorista m
INNER JOIN 
    taxi.fila f ON m.cnh = f.cnh;

-- cnh e nome dos motoristas que já tiveram e estao na fila - Produto cartesiano
SELECT DISTINCT
    m.cnh, m.nome
FROM
    taxi.fila f, taxi.motorista m
WHERE 
    f.cnh = m.cnh;

-- Select com atributos ambiguos
SELECT 
    ta.placa,
    modelo,
    cliid
FROM
    taxi.taxi ta,
    taxi.corrida co
WHERE
    ta.placa = co.placa;

-- Select utilizando ORDER BY
SELECT 
    anofab, marca, modelo
FROM 
    taxi.taxi
ORDER BY 
    anofab DESC; -- ASC

-- Menor quilometragem de entrada em cada zona
SELECT 
    zona, MIN(kmin)
FROM 
    taxi.fila
GROUP BY 
    zona;

-- Menor quilometragem até 5000 km de entrada em cada zona
SELECT 
    zona, MIN(kmin) mkmin
FROM 
    taxi.fila
GROUP BY 
    zona
HAVING 
    mkmin < 5000;

-- Zonas que receberam algum taxi na fila (com aninhamento / IN)
SELECT 
    z.zona
FROM 
    taxi.zona z
WHERE 
    z.zona IN (SELECT DISTINCT f.zona FROM taxi.fila f);

-- Zonas que não receberam algum taxi na fila (com aninhamento / NOT IN)
SELECT 
    z.zona
FROM 
    taxi.zona z
WHERE 
    z.zona NOT IN (SELECT DISTINCT f.zona FROM taxi.fila f);