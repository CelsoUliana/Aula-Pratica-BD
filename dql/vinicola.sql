-- 1 (Qual é a média dos preços de todos os vinhos?)
SELECT 
    AVG(vinho.preço)
FROM vinicola.vinho as vinho;

-- 2 (Qual é a média dos preços de cada tipo de vinho?)
SELECT
    vinho.tipo_vinho, AVG(vinho.preço)
FROM
    vinicola.vinho as vinho
GROUP BY 
    vinho.tipo_vinho;

-- 3 (Qual é a soma dos preços?)
SELECT
    SUM(vinho.preço)
FROM
    vinicola.vinho;

-- 4 (Qual é o preço mais baixo?)
SELECT
    MIN(vinho.preço)
FROM
    vinicola.vinho;

-- 5 (Qual é o preço mais alto?)
SELECT
    MAX(vinho.preço)
FROM
    vinicola.vinho;

-- 6 (Quantos vinhos existem na relação vinho?)
SELECT
    COUNT(*)
FROM
    vinicola.vinho;

-- 7 (Quantos tipos de vinho diferentes existem na relação vinho?)
SELECT
    COUNT(DISTINCT vinho.tipo_vinho) as tipo_de_vinhos_unicos
FROM
    vinicola.vinho as vinho;

-- Erro safe Update:
SET SQL_SAFE_UPDATES = 0;

-- 8 (Alterar o ano de produção de vinhos de 2014 para 2016)
UPDATE 
    vinicola.vinho 
SET 
    ano_vinho = 2016 
WHERE 
    ano_vinho = 2014;

-- 9 (Liste os dados da relação vinícola, ordene pelo nome da vinícula em ordem descendente a região da vinícola em ordem ascendete)
SELECT
    *
FROM
    vinicola.vinicola as v
ORDER BY 
    v.nome_vinicola DESC,
    v.regiao_id ASC;

-- 10 (Qual é o preço do vinho mais alto e a média dos preços por tipo de vinho?)
SELECT
    tipo_vinho,
    MAX(vinho.preço) as preço_mais_alto,
    AVG(vinho.preço) as media_preço
FROM
    vinicola.vinho as vinho
GROUP BY 
    vinho.tipo_vinho;


-- 11 (Qual é o preço do vinho mais alto e a média dos preços por tipo de vinho, para as médias de preço superiores a 200.00?)
SELECT
    tipo_vinho,
    MAX(vinho.preço) as preço_mais_alto,
    AVG(vinho.preço) as media_preço
FROM
    vinicola.vinho as vinho
GROUP BY 
    vinho.tipo_vinho
HAVING 
    media_preço > 200;

-- 12 (Atualize o preço do vinho com um aumento de 2.00 em cada vinho)
UPDATE 
    vinicola.vinho 
SET 
    preço = preço + 2;