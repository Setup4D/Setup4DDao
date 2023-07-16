 CREATE TABLE clientes (
  id serial4 NOT NULL,
  nome varchar(100) NOT NULL,
  email varchar(100) NULL,
  ocultar varchar(2) NULL,
  CONSTRAINT clientes_pkey PRIMARY KEY (id)
  );