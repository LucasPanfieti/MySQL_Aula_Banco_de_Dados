CREATE DATABASE IF NOT EXISTS loja;

USE loja;

DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
    id INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    cpf VARCHAR(11),
    endereco VARCHAR(255),
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS pedidos;

CREATE TABLE pedidos (
    numero_do_pedido INT AUTO_INCREMENT,
    data_pedido VARCHAR(100) NOT NULL,
    valor VARCHAR(100) NOT NULL UNIQUE,
    codigo_cliente VARCHAR(11),
    PRIMARY KEY (numero_do_pedido)
);

INSERT INTO clientes (nome, email, cpf, endereco) 
VALUES 
('João Silva', 'joao.silva@email.com', '12345678901', 'Rua A, 123'),
('Maria Oliveira', 'maria.oliveira@email.com', '98765432100', 'Rua B, 456'),
('Carlos Souza', 'carlos.souza@email.com', '11223344556', 'Rua C, 789');

INSERT INTO pedidos (data_pedido, valor, codigo_cliente) 
VALUES 
('2025-03-14', 150.00, 1),
('2025-03-15', 200.50, 2),
('2025-03-16', 75.00, 3);

SELECT p.numero_do_pedido, p.data_pedido, p.valor, c.nome, c.email
FROM pedidos p
JOIN clientes c ON p.codigo_cliente = c.id;
