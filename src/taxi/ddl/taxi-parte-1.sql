
-- Criar esquema taxi
CREATE SCHEMA `taxi`; 

-- Criar tabela taxi
CREATE TABLE `taxi`.`taxi` (
  `placa` VARCHAR(7) NOT NULL,
  `marca` VARCHAR(30) NOT NULL,
  `modelo` VARCHAR(30) NOT NULL,
  `anofab` INT NULL,
  `licenca` VARCHAR(9) NULL,
  PRIMARY KEY (`placa`));

-- Criar tabela cliente
CREATE TABLE `taxi`.`cliente` (
  `cliid` VARCHAR(4) NOT NULL,
  `nome` VARCHAR(80) NOT NULL,
  `cpf` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`cliid`));

-- Criar tabela corrida
CREATE TABLE `taxi`.`corrida` (
  `cliid` VARCHAR(4) NOT NULL,
  `placa` VARCHAR(7) NOT NULL,
  `datapedido` DATE NOT NULL,
  PRIMARY KEY (`cliid`, `placa`, `datapedido`),
  CONSTRAINT `cliid_cliente`
    FOREIGN KEY (`cliid`)
    REFERENCES `taxi`.`cliente` (`cliid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `placa_taxi`
    FOREIGN KEY (`placa`)
    REFERENCES `taxi`.`taxi` (`placa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- Populando as tabelas com alguns dados
INSERT INTO taxi.cliente VALUES ('1532', 'Asdrúbal', '448.754.253.65');
INSERT INTO taxi.cliente VALUES ('1755', 'Doriana', '567.387.387.44');
INSERT INTO taxi.cliente VALUES ('1780', 'Quincas', '546.373.762.02');

INSERT INTO taxi.taxi VALUES ('DAE6534', 'Ford', 'Fiesta', 1999, 'MN572345');
INSERT INTO taxi.taxi VALUES ('DKL4598', 'Volkswagen', 'Gol', 2001, 'AU876543');
INSERT INTO taxi.taxi VALUES ('DKL7878', 'Ford', 'Fiesta', 2001, 'OP102938');
INSERT INTO taxi.taxi VALUES ('JDM8776', 'Volkswagen', 'Santana', 2002, 'QM365923');
INSERT INTO taxi.taxi VALUES ('JJM3692', 'Chevrolet', 'Corsa', 1999, 'UU335577');

INSERT INTO taxi.corrida VALUES('1755', 'DAE6534', '2003-02-15');
INSERT INTO taxi.corrida VALUES('1780', 'JDM8776', '2003-02-18');
INSERT INTO taxi.corrida VALUES('1755', 'DKL7878', '2003-02-16');
INSERT INTO taxi.corrida VALUES('1780', 'DKL4598', '2003-02-17');
INSERT INTO taxi.corrida VALUES('1532', 'DKL4598', '2003-02-18');
INSERT INTO taxi.corrida VALUES('1780', 'DAE6534', '2003-02-16');