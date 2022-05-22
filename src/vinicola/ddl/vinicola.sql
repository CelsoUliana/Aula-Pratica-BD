
DROP DATABASE IF EXISTS `vinicola`;
-- Criar esquema vinicola
CREATE SCHEMA IF NOT EXISTS `vinicola`; 

-- Criar tabela regiao
CREATE TABLE IF NOT EXISTS `vinicola`.`regiao` (
  `regiao_id` INT NOT NULL,
  `nome_regiao` VARCHAR(50) NOT NULL,
  `mapa_regiao` VARCHAR(30) NOT NULL,
  `descricao_regiao` VARCHAR(200) NULL,
  PRIMARY KEY (`regiao_id`));

-- Criar tabela vinicola
CREATE TABLE IF NOT EXISTS `vinicola`.`vinicola` (
  `vinicola_id` INT NOT NULL,
  `nome_vinicola` VARCHAR(80) NOT NULL,
  `descricao_vinicola` VARCHAR(200) NULL,
  `fone_vinicola` VARCHAR(11) NOT NULL,
  `fax_vinicola` VARCHAR(30) NOT NULL,
  `regiao_id` INT NOT NULL,
  PRIMARY KEY (`vinicola_id`),
    CONSTRAINT `regiao_regiao_id`
    FOREIGN KEY (`regiao_id`)
    REFERENCES `vinicola`.`regiao` (`regiao_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- Criar tabela vinho
CREATE TABLE IF NOT EXISTS `vinicola`.`vinho` (
  `vinho_id` INT NOT NULL,
  `nome_vinho` VARCHAR(100) NOT NULL,
  `tipo_vinho` VARCHAR(100) NOT NULL,
  `ano_vinho` INT NOT NULL,
  `descricao_vinho` VARCHAR(200) NOT NULL,
  `preço` DECIMAL NOT NULL,
  `vinicola_id` INT NOT NULL,
  PRIMARY KEY (`vinho_id`),
  CONSTRAINT `vinicola_vinicola_id`
    FOREIGN KEY (`vinicola_id`)
    REFERENCES `vinicola`.`vinicola` (`vinicola_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);