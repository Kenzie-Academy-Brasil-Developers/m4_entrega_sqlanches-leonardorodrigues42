-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
SELECT * FROM pedidos, produtos;
-- 2)
SELECT 
	DISTINCT pedidos.id 
FROM
	pedidos, produtos, produtos_pedidos
	WHERE produtos.id = produtos_pedidos.produto_id
    AND produtos.nome = 'Fritas'
    AND pedidos.id = produtos_pedidos.pedido_id;

-- 3)
SELECT 
	clientes.nome as gostam_de_fritas 
FROM
	clientes, pedidos, produtos, produtos_pedidos
	WHERE produtos.id = produtos_pedidos.produto_id
    AND produtos.nome = 'Fritas'
    AND pedidos.id = produtos_pedidos.pedido_id
    AND clientes.id = pedidos.cliente_id;

-- 4)
SELECT 
	sum(preço)
FROM 
	pedidos, clientes, produtos, produtos_pedidos
	WHERE pedidos.id = produtos_pedidos.pedido_id
    AND produtos.id = produtos_pedidos.produto_id
    AND clientes.id = pedidos.cliente_id
    AND clientes.nome = 'Laura';

-- 5)
SELECT 
	distinct produtos.nome, count(produtos_pedidos.id)
FROM
	produtos, produtos_pedidos
    WHERE produtos_pedidos.produto_id = produtos.id
    GROUP BY produtos.nome;