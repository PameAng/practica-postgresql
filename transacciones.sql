-- CREACION DE TABLAS


CREATE TABLE usuarios(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	apellido VARCHAR(100) NOT NULL,
	email VARCHAR(200) UNIQUE
);

CREATE TABLE cuenta(
	id SERIAL PRIMARY KEY,
	usuario_id INTEGER NOT NULL,
	monto DECIMAL(10, 2) CHECK(monto >= 0),
	FOREIGN KEY(usuario_id) REFERENCES usuarios(id)
);


BEGIN;

UPDATE cuenta SET monto = monto - 200 WHERE usuario_id = 1;

UPDATE cuenta SET monto = monto + 200 WHERE usuario_id = 2;

COMMIT;

SELECT * FROM cuenta;



BEGIN;

UPDATE cuenta SET monto = monto - 500 WHERE usuario_id = 1;

ROLLBACK;

SELECT * FROM cuenta;


-- SESION 1

BEGIN;

UPDATE cuenta SET monto = monto - 100 WHERE usuario_id = 1;

ROLLBACK;

SELECT * FROM cuenta;


-- SESION 2

BEGIN;

UPDATE cuenta SET monto = monto - 300 WHERE usuario_id = 1;

COMMIT;

SELECT * FROM cuenta;
