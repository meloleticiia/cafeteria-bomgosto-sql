CREATE TABLE cardapio (
    codigo INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL UNIQUE,
    descricao TEXT,
    preco_unitario REAL NOT NULL
);

CREATE TABLE comanda (
    codigo INTEGER PRIMARY KEY AUTOINCREMENT,
    data TEXT NOT NULL,
    mesa INTEGER NOT NULL,
    nome_cliente TEXT NOT NULL
);

CREATE TABLE item_comanda (
    codigo_comanda INTEGER,
    codigo_cardapio INTEGER,
    quantidade INTEGER NOT NULL,
    PRIMARY KEY (codigo_comanda, codigo_cardapio),
    FOREIGN KEY (codigo_comanda) REFERENCES comanda(codigo),
    FOREIGN KEY (codigo_cardapio) REFERENCES cardapio(codigo)
);

INSERT INTO cardapio (nome, descricao, preco_unitario)
VALUES
('Café Expresso', 'Café forte e encorpado', 5.00),
('Café com Leite', 'Mistura de café e leite quente', 6.00),
('Cappuccino', 'Café com leite e espuma cremosa', 8.00),
('Mocha', 'Café, chocolate e leite vaporizado', 9.00);

INSERT INTO comanda (data, mesa, nome_cliente)
VALUES
('2025-10-15', 1, 'Letícia'),
('2025-10-15', 2, 'João'),
('2025-10-16', 3, 'Maria'),
('2025-10-16', 4, 'Pedro');

INSERT INTO item_comanda (codigo_comanda, codigo_cardapio, quantidade)
VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 1),
(3, 4, 2),
(4, 1, 1),
(4, 3, 1);

SELECT * FROM cardapio ORDER BY nome;

SELECT 
    c.codigo AS codigo_comanda,
    c.data,
    c.mesa,
    c.nome_cliente,
    ca.nome AS nome_cafe,
    ca.descricao,
    i.quantidade,
    ca.preco_unitario,
    (i.quantidade * ca.preco_unitario) AS preco_total
FROM comanda c
JOIN item_comanda i ON c.codigo = i.codigo_comanda
JOIN cardapio ca ON i.codigo_cardapio = ca.codigo
ORDER BY c.data, c.codigo, ca.nome;

SELECT 
    c.codigo,
    c.data,
    c.mesa,
    c.nome_cliente,
    SUM(i.quantidade * ca.preco_unitario) AS valor_total_comanda
FROM comanda c
JOIN item_comanda i ON c.codigo = i.codigo_comanda
JOIN cardapio ca ON i.codigo_cardapio = ca.codigo
GROUP BY c.codigo, c.data, c.mesa, c.nome_cliente
ORDER BY c.data;

SELECT 
    c.codigo,
    c.data,
    c.mesa,
    c.nome_cliente,
    SUM(i.quantidade * ca.preco_unitario) AS valor_total_comanda
FROM comanda c
JOIN item_comanda i ON c.codigo = i.codigo_comanda
JOIN cardapio ca ON i.codigo_cardapio = ca.codigo
GROUP BY c.codigo, c.data, c.mesa, c.nome_cliente
HAVING COUNT(DISTINCT i.codigo_cardapio) > 1
ORDER BY c.data;

SELECT 
    c.data,
    SUM(i.quantidade * ca.preco_unitario) AS faturamento_total
FROM comanda c
JOIN item_comanda i ON c.codigo = i.codigo_comanda
JOIN cardapio ca ON i.codigo_cardapio = ca.codigo
GROUP BY c.data
ORDER BY c.data;
