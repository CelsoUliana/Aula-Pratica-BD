
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
