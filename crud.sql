-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)

INSERT INTO clientes
	(nome, lealdade)
VALUES
	('Georgia', 0);

-- 2)

SELECT id
	FROM clientes
    WHERE clientes.nome = 'Georgia';

INSERT INTO pedidos
	(status, cliente_id)
VALUES
	('Recebido', 6);

-- 3)

SELECT id
	FROM pedidos
    WHERE pedidos.cliente_id = 6;

INSERT INTO produtos_pedidos 
	(pedido_id, produto_id)
VALUES 
	(6, 1),
	(6, 2),
	(6, 6),
	(6, 8),
	(6, 8);

-- Leitura

-- 1)

SELECT *
	FROM clientes
    JOIN pedidos
    	ON clientes.id = pedidos.cliente_id
    JOIN produtos_pedidos
	    ON produtos_pedidos.pedido_id = pedidos.id
    JOIN produtos
    	ON produtos_pedidos.produto_id = produtos.id
        WHERE clientes.id = 6;

-- Atualização

-- 1)

SELECT sum(pts_de_lealdade)
	FROM produtos, pedidos, clientes, produtos_pedidos
    WHERE clientes.id = pedidos.cliente_id
    AND pedidos.id = produtos_pedidos.pedido_id
    AND produtos_pedidos.produto_id = produtos.id
    AND clientes.id = 6;

UPDATE clientes 
	SET lealdade = 48
    WHERE id = 6;

-- Deleção

-- 1)

SELECT *
	FROM clientes
    WHERE nome = 'Marcelo';

DELETE
	FROM clientes
    WHERE id = 4
    AND nome = 'Marcelo';	
