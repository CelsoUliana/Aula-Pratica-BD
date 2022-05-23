
DROP DATABASE IF EXISTS `filme`;
-- Criar esquema filme
CREATE SCHEMA IF NOT EXISTS `filme`; 

-- Criar tabela filme
CREATE TABLE IF NOT EXISTS `filme`.`filme` (
  `idt_filme` INT NOT NULL,
  `des_titulo` VARCHAR(200) NOT NULL,
  `num_ano` INT NOT NULL,
  `des_diretor` VARCHAR(200) NULL,
  PRIMARY KEY (`idt_filme`));

-- Criar tabela revisor
CREATE TABLE IF NOT EXISTS `filme`.`revisor` (
  `idt_revisor` INT NOT NULL,
  `des_nome` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idt_revisor`));

-- Criar tabela classificacao
CREATE TABLE IF NOT EXISTS `filme`.`classificacao` (
  `idt_revisor` INT NOT NULL,
  `idt_filme` INT NOT NULL,
  `num_estrelas` INT NOT NULL,
  `dt_classificacao` VARCHAR(200) NULL,
  PRIMARY KEY (`idt_revisor`, `idt_filme`),
  CONSTRAINT `idt_revisor_revisor`
    FOREIGN KEY (`idt_revisor`)
    REFERENCES `filme`.`revisor` (`idt_revisor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idt_filme_filme`
    FOREIGN KEY (`idt_filme`)
    REFERENCES `filme`.`filme` (`idt_filme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);