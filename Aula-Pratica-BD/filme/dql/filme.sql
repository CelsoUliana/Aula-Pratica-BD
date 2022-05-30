-- Encontre os nomes de todos os revisores que contribuíram com três ou mais classificações
SELECT 
    des_nome
FROM 
    filme.revisor as revisor,
    (SELECT
        idt_revisor, COUNT(num_estrelas) AS qtd
    FROM
        filme.classificacao
    GROUP BY
        idt_revisor) as tx
WHERE
    revisor.idt_revisor = tx.idt_revisor AND
    tx.qtd >= 3;

-- Encontre o título de todos os filmes que não possuem classificação
SELECT
    des_titulo
FROM 
    filme.filme
WHERE
    idt_filme NOT IN (SELECT idt_filme FROM filme.classificacao);