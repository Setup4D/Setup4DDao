CREATE TABLE clientes (
  id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100),
  ocultar VARCHAR(2)
);
