
-- Selecionando todos os taxis com ano de fabricação maior que 2000 (WHERE)
SELECT 
    * 
FROM 
    taxi.taxi
WHERE 
    anofab > 2000;

-- Selecionando todos os taxis com ano de fabricação maior que 2000 e da marca 'Volkswagen' (WHERE)
SELECT 
    * 
FROM
    taxi.taxi
WHERE 
    anofab > 2000 AND 
    marca = 'Volkswagen';

-- Selecionando todos os taxis com marca que possua qualquer string + wagen (WHERE LIKE)
SELECT 
    *
FROM 
    taxi.taxi
WHERE 
    marca like '%wagen';

-- Selecionando todos os taxis com marca que possuem qualquer caractere + olks + qualquer string (WHERE LIKE)
SELECT 
    *
FROM 
    taxi.taxi
WHERE 
    marca like '_olks%';

-- Selecionando coluna com nome personalizado (AS)
SELECT
    placa as placa_renomeada, placa
FROM
    taxi.taxi;

-- Selecionando tabela com nome personalizado (AS)
SELECT 
    placa, modelo
FROM
    taxi.taxi AS tx;

-- Seelcionando todas marcas e modelos (incluem duplicados)
SELECT
    marca, modelo
FROM
    taxi.taxi;

-- Selecionando marcas e modelos sem duplicados
SELECT DISTINCT
    marca, modelo
FROM
    taxi.taxi;