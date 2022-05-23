
-- Exemplo de drop e adicionar foreign a uma tabela existente
ALTER TABLE `taxi`.`fila` DROP FOREIGN KEY `zona_fk`;
ALTER TABLE `taxi`.`fila` ADD FOREIGN KEY (`zona`) REFERENCES `taxi`.`zona` (`zona`) ON UPDATE CASCADE;