INSERT INTO funcionario.departamento VALUES ('Estoque', 1, NULL, NULL);
INSERT INTO funcionario.departamento VALUES ('Logística', 2, NULL, NULL);
INSERT INTO funcionario.departamento VALUES ('Administração', 3, NULL, NULL);
INSERT INTO funcionario.departamento VALUES ('RH', 4, NULL, NULL);
INSERT INTO funcionario.departamento VALUES ('Pesquisa', 5, NULL, NULL);

INSERT INTO funcionario.funcionario VALUES ('Jorge', 'Souza', '111.111.111-11', '1982-02-15', 'Zahran', 'Masculino', 3000, NULL, 1);
INSERT INTO funcionario.funcionario VALUES ('Agatha', 'Ramos', '222.222.222-22', '1986-05-20', 'Afonso Pena', 'Feminino', 3500, NULL, 2);
INSERT INTO funcionario.funcionario VALUES ('Maia', 'Ferreira', '333.333.333-33', '1999-10-21', 'João Domingos', 'Feminino', 6000, NULL, 3);
INSERT INTO funcionario.funcionario VALUES ('Daniil', 'Mata', '444.333.333-33', '1991-11-21', 'Paulo Tognini', 'Masculino', 5000, NULL, 4);
INSERT INTO funcionario.funcionario VALUES ('João', 'Silva', '123.456.789-66', '1982-10-01', 'João Domingos', 'Masculino', 5500, NULL, 5);

INSERT INTO funcionario.localizacoes_dep VALUES (1, 'Estoque - Rua brilhante');
INSERT INTO funcionario.localizacoes_dep VALUES (4, 'RH - Afonso Pena');
INSERT INTO funcionario.localizacoes_dep VALUES (2, 'Zahran');

INSERT INTO funcionario.projeto VALUES ('Recrutamento', 1, 'RH - Afonso Pena', 4);
INSERT INTO funcionario.projeto VALUES ('Relatório de despesas', 2, 'Logística - Zahran', 2);

INSERT INTO funcionario.trabalha_em VALUES ('111.111.111-11', 1, 15);
INSERT INTO funcionario.trabalha_em VALUES ('222.222.222-22', 1, 50);
INSERT INTO funcionario.trabalha_em VALUES ('333.333.333-33', 2, 200);
INSERT INTO funcionario.trabalha_em VALUES ('444.333.333-33', 2, 30);
INSERT INTO funcionario.trabalha_em VALUES ('123.456.789-66', 2, 500);
INSERT INTO funcionario.trabalha_em VALUES ('222.222.222-22', 2, 500);

INSERT INTO funcionario.dependente VALUES ('111.111.111-11', 'Marcel Canedo Abelho', 'Masculino', '2015-12-15', 'Filho');

INSERT INTO funcionario.dependente VALUES ('111.111.111-11', 'Marcel Canedo Abelho', 'Masculino', '2015-12-15', 'Filho');
INSERT INTO funcionario.dependente VALUES ('111.111.111-11', 'Jorge', 'Masculino', '2015-12-15', 'Filho');

UPDATE funcionario.funcionario SET Cpf_supervisor = '333.333.333-33' WHERE cpf = '111.111.111-11';
UPDATE funcionario.departamento SET Cpf_gerente = '333.333.333-33', Data_inicio_gerente = '2020-01-03' WHERE Dnumero = 2;