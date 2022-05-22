
DROP DATABASE `taxi`;
-- Criar esquema taxi
CREATE SCHEMA IF NOT EXISTS `taxi`; 

-- Criar tabela taxi
CREATE TABLE IF NOT EXISTS `taxi`.`taxi` (
  `placa` VARCHAR(7) NOT NULL,
  `marca` VARCHAR(30) NOT NULL,
  `modelo` VARCHAR(30) NOT NULL,
  `anofab` INT NULL,
  `licenca` VARCHAR(9) NULL,
  PRIMARY KEY (`placa`));

-- Criar tabela cliente
CREATE TABLE IF NOT EXISTS `taxi`.`cliente` (
  `cliid` VARCHAR(4) NOT NULL,
  `nome` VARCHAR(80) NOT NULL,
  `cpf` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`cliid`));

-- Criar tabela corrida
CREATE TABLE IF NOT EXISTS `taxi`.`corrida` (
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

CREATE TABLE IF NOT EXISTS `taxi`.`motorista` (
  `cnh` VARCHAR(11) NOT NULL,
  `placa` VARCHAR(7) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `cnhvalid` BIT NOT NULL,
   PRIMARY KEY (`cnh`),
    CONSTRAINT `motorista_placa_taxi`
    FOREIGN KEY (`placa`)
    REFERENCES `taxi`.`taxi` (`placa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


CREATE TABLE IF NOT EXISTS `taxi`.`zona` (
  `zona` VARCHAR(100) NOT NULL,
   PRIMARY KEY (`zona`)
);

CREATE TABLE IF NOT EXISTS `taxi`.`fila` (
  `zona` VARCHAR(100) NOT NULL,
  `cnh` VARCHAR(11) NOT NULL,
  `datahorain` DATETIME NOT NULL,
  `datahoraout` DATETIME NOT NULL,
  `kmin` INT NOT NULL,
   PRIMARY KEY (`zona`,`cnh`, `datahorain`),
    CONSTRAINT `cnh_motorista`
    FOREIGN KEY (`cnh`)
    REFERENCES `taxi`.`motorista` (`cnh`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `zona_fk`
    FOREIGN KEY (`zona`)
    REFERENCES `taxi`.`zona` (`zona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- Exemplo de drop e adicionar foreign a uma tabela existente
ALTER TABLE `taxi`.`fila` DROP FOREIGN KEY `zona_fk`;
ALTER TABLE `taxi`.`fila` ADD FOREIGN KEY (`zona`) REFERENCES `taxi`.`zona` (`zona`) ON UPDATE CASCADE;

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

INSERT INTO taxi.zona VAlUES('Barão geraldo');
INSERT INTO taxi.zona VAlUES('Taquaral');
INSERT INTO taxi.zona VAlUES('Unicamp');
INSERT INTO taxi.zona VAlUES('UFMS');
INSERT INTO taxi.zona VAlUES('Cambuí');

INSERT INTO taxi.motorista VALUES('0617351169', 'DAE6534', 'Jefferson Amaral', 1);
INSERT INTO taxi.motorista VALUES('1633771169', 'DKL4598', 'Roberto dos Santos', 1);
INSERT INTO taxi.motorista VALUES('1111111111', 'JDM8776', 'Diego Neves', 1);
INSERT INTO taxi.motorista VALUES('6666111111', 'JJM3692', 'Celso Antonio', 1);

INSERT INTO taxi.fila VALUES('Barão geraldo', '0617351169', '2003-02-16 13:13:17', '2003-02-16 13:33:55', 1500);
INSERT INTO taxi.fila VALUES('UFMS', '6666111111', '2003-02-18 15:15:00', '2003-02-18 15:20:30', 3000);