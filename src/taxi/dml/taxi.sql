
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