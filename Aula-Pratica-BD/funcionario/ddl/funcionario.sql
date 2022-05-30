
DROP DATABASE IF EXISTS `funcionario`;
-- Criar esquema funcionario
CREATE SCHEMA IF NOT EXISTS `funcionario`; 

-- Criar tabela departamento
CREATE TABLE IF NOT EXISTS `funcionario`.`departamento` (
  `Dnome` VARCHAR(30) NOT NULL,
  `Dnumero` INT NOT NULL,
  `Cpf_gerente` VARCHAR(15) NULL,
  `Data_inicio_gerente` DATE NULL,
  PRIMARY KEY (`Dnumero`)
);

-- Criar tabela localizacoes_dep
CREATE TABLE IF NOT EXISTS `funcionario`.`localizacoes_dep` (
  `Dnumero` INT NOT NULL,
  `Dlocal` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`Dnumero`, `Dlocal`),
    CONSTRAINT `departamento_Dnumero`
    FOREIGN KEY (`Dnumero`)
    REFERENCES `funcionario`.`departamento` (`Dnumero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- Criar tabela projetos
CREATE TABLE IF NOT EXISTS `funcionario`.`projeto` (
  `Projnome` VARCHAR(30) NOT NULL,
  `Projnumero` INT NOT NULL,
  `Projlocal` VARCHAR(30) NOT NULL,
  `Dnum` INT NOT NULL,
  PRIMARY KEY (`Projnumero`),
  CONSTRAINT `departamento_Dnum`
    FOREIGN KEY (`Dnum`)
    REFERENCES `funcionario`.`departamento` (`Dnumero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `funcionario`.`funcionario` (
  `Pnome` VARCHAR(30) NOT NULL,
  `Unome` VARCHAR(30) NOT NULL,
  `Cpf` VARCHAR(15) NOT NULL,
  `Datanasc` DATE NOT NULL,
  `Endereco` VARCHAR(100) NOT NULL,
  `Sexo` VARCHAR(15) NOT NULL,
  `Salario` DECIMAL(10,2) NOT NULL,
  `Cpf_supervisor` VARCHAR(15) NULL ,
  `Dnr` INT NOT NULL,
   PRIMARY KEY (`cpf`),
    CONSTRAINT `funcionario_cpf_supervisor`
    FOREIGN KEY (`Cpf_supervisor`)
    REFERENCES `funcionario`.`funcionario` (`Cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS `funcionario`.`trabalha_em` (
  `Fcpf` VARCHAR(15) NOT NULL,
  `Pnr` INT NOT NULL,
  `Horas` INT NOT NULL,
   PRIMARY KEY (`Fcpf`, `Pnr`)
);

CREATE TABLE IF NOT EXISTS `funcionario`.`dependente` (
  `Fcpf` VARCHAR(15) NOT NULL,
  `Nome_dependente` VARCHAR(100) NOT NULL,
  `Sexo` VARCHAR(30) NOT NULL,
  `Datanasc` DATE NOT NULL,
  `Parentesco` VARCHAR(50) NOT NULL,
   PRIMARY KEY (`Fcpf`,`Nome_dependente`),
    CONSTRAINT `funcionario_fcpf`
    FOREIGN KEY (`Fcpf`)
    REFERENCES `funcionario`.`funcionario` (`Cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

ALTER TABLE `funcionario`.`departamento` ADD FOREIGN KEY (`Cpf_gerente`) REFERENCES `funcionario`.`funcionario` (`Cpf`) ON UPDATE CASCADE;