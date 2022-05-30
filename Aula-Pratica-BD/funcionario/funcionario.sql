USE funcionario;

-- Recuperar os nomes de todos os funcionários que não possuem supervisores
SELECT Pnome, Unome
FROM funcionario.funcionario
WHERE Cpf_supervisor IS NULL;

-- retorna os nomes dos funcionários cujo salário é maior do que o salário de todos os funcionários no departamento 5.
SELECT Unome, Pnome
FROM FUNCIONARIO
WHERE Salario > ALL (SELECT Salario FROM FUNCIONARIO WHERE Dnr=5);

-- Recuperar o cpf de todos os funcionários que trabalham na mesma combinação (projeto, hora) em algum projeto em que
-- o funcionário João Silva (cujo cpf é 12345678966) trabalha.
SELECT DISTINCT Fcpf
FROM TRABALHA_EM
WHERE (Pnr, Horas) IN (
SELECT Pnr, Horas
FROM TRABALHA_EM
WHERE Fcpf='123.456.789-66');

-- Recuperar o nome de cada funcionário que tem pelo menos um dependente com o mesmo nome e com o mesmo sexo do funcionário.
SELECT F.Pnome, F.Unome
FROM FUNCIONARIO AS F
WHERE EXISTS ( SELECT * FROM DEPENDENTE AS D
WHERE F.Cpf=D.Fcpf
AND F.Sexo=D.Sexo
AND F.Pnome=D.Nome_dependente
);

-- Recuperar os nomes de funcionários que não possuem dependentes.
SELECT Pnome, Unome
FROM FUNCIONARIO
WHERE NOT EXISTS (
SELECT *
FROM DEPENDENTE
WHERE Cpf=Fcpf );

-- Liste todos os números de projeto para aqueles que envolvam um funcionário cujo último nome é „Silva‟, seja como um trabalhador
-- ou como um gerente do departamento que controla o projeto.
(SELECT DISTINCT Projnumero
FROM PROJETO, DEPARTAMENTO, FUNCIONARIO
WHERE Dnum=Dnumero AND Cpf_gerente=Cpf AND Unome='Silva')
UNION
(SELECT DISTINCT Projnumero
FROM PROJETO, TRABALHA_EM, FUNCIONARIO
WHERE Projnumero=Pnr AND Fcpf=Cpf AND Unome='Silva');

-- listar o nome e endereço dos funcionários que trabalhamno departamento ’Pesquisa’.
SELECT Pnome, Unome, Endereco
FROM FUNCIONARIO
INNER JOIN DEPARTAMENTO AS DEP
WHERE Dnome='Pesquisa';

-- listar o nome e endereço dos funcionários que trabalham no departamento ’Pesquisa’.
SELECT Pnome, Unome, Endereco
FROM FUNCIONARIO
INNER JOIN DEPARTAMENTO ON (Dnr=Dnumero)
WHERE Dnome='Pesquisa';

--  para cada funcionário, liste o seu primeiro e o seu último nome acompanhado do último nome de seu supervisor, mesmo se o funcionário não
-- tiver supervisor, liste seu nome.
SELECT F.Unome AS Nome_funcionario, S.Unome AS Nome_supervisor
FROM
FUNCIONARIO AS F
LEFT OUTER JOIN FUNCIONARIO AS S
ON (F.Cpf_supervisor =S.Cpf);

-- Trigger exemplo.
-- Delimiter muda o delimitador (geralmente ';') para permitir a execução como um bloco.
-- Delimiter no final muda novamente para ';'
delimiter //
CREATE TRIGGER VIOLACAO_SALARIAL BEFORE INSERT
ON FUNCIONARIO
FOR EACH ROW
IF NEW.salario > (SELECT salario
	FROM FUNCIONARIO
	WHERE cpf = NEW.cpf_supervisor) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Salário não pode ser maior que o do gerente';
END IF; //
delimiter ;

-- Insert exemplo que viola o trigger
INSERT INTO funcionario.funcionario VALUES ('Mayara', 'Souza', '171.771.711-11', '1982-02-15', 'Zahran', 'Masculino', 10000, '333.333.333-33', 1);

-- Exemplo de stored procedures
-- Selecionar x (quantidade) de funcionarios
DELIMITER $$
CREATE PROCEDURE Selecionar_Funcionarios(IN quantidade INT)
BEGIN
SELECT * FROM funcionario
LIMIT quantidade;
END $$
DELIMITER ;

CALL Selecionar_funcionarios(2);

-- Stored Procedure de atualizar
DELIMITER $$
CREATE PROCEDURE Atualizar_Salarios(IN quantidade INT)
BEGIN
UPDATE funcionario SET salario = salario + quantidade;
END $$
DELIMITER ;

-- Stored Procedure que atualiza o salário do funcionario com o maior salário do departamento que ele trabalha
DELIMITER $$
CREATE PROCEDURE Atualizar_salario_funcionario(IN cpf_entrada VARCHAR(15), IN Dnr_entrada INT)
BEGIN
DECLARE maior_salario Decimal(10,2);
SET maior_salario = (
	SELECT MAX(salario) 
	from funcionario f 
    where f.Dnr = Dnr_entrada);
UPDATE funcionario SET salario = maior_salario where Cpf = cpf_entrada;
END $$
DELIMITER ;

-- Chama a procedure -- Departamento 5
CALL Atualizar_salario_funcionario('123.456.789-66', 5);


-- Desligar o modo safe update, e chamar a função.
SET SQL_SAFE_UPDATES = 0;
CALL Atualizar_Salarios(200);

-- View
CREATE VIEW TRABALHA_EM1
AS SELECT Pnome, Unome, Projnome
FROM FUNCIONARIO, PROJETO, TRABALHA_EM
WHERE cpf=fcpf AND Pnr=Projnumero;

-- Consulta na View
SELECT * FROM funcionario.trabalha_em1;

-- View 
CREATE VIEW DEP_INF(Dep_nome, Qtd_func, Total_sal)
AS SELECT Dnome, COUNT(*), SUM(salario)
FROM DEPARTAMENTO, FUNCIONARIO
WHERE Dnumero=Dnr
GROUP BY Dnome;

-- Consulta na View
Select * from funcionario.DEP_INF;

-- Consulta na view com where
SELECT Pnome, Unome
FROM TRABALHA_EM1
WHERE Projnome='Recrutamento';

-- Drop View
DROP VIEW TRABALHA_EM1;