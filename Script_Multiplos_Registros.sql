SELECT * FROM produtos;
SELECT * FROM tabela_de_produtos;

-- INSERT COM SELE��O DE LOTES (erro porque j� existe um item na tabela 'PRODUTOS' com mesmo c�digo da 'TABELA_DE_PRODUTOS')
INSERT INTO PRODUTOS
(SELECT CODIGO_DO_PRODUTO AS CODIGO
, NOME_DO_PRODUTO AS DESCRITOR
, SABOR
, TAMANHO, EMBALAGEM
, PRECO_DE_LISTA AS PRECO_LISTA
FROM tabela_de_produtos); 


-- DESCOBRIR PRODUTO(S) QUE J� EXISTE(M) NAS DUAS TABELAS
SELECT * FROM tabela_de_produtos
INNER JOIN produtos
ON produtos.codigo = tabela_de_produtos.codigo_do_produto;


-- RETORNA ITENS QUE N�O EXISTEM NA TABELA 'PRODUTOS'
-- (traz itens cujos c�digos s� existem na tabela da esquerda - "tabela_de_produtos")
SELECT CODIGO_DO_PRODUTO
, tp.NOME_DO_PRODUTO
, tp.SABOR
, tp.TAMANHO
, tp.EMBALAGEM
, tp.PRECO_DE_LISTA
FROM tabela_de_produtos tp
LEFT JOIN produtos p
ON tp.codigo_do_produto = p.codigo
WHERE p.codigo IS NULL;

-- INSERT DOS ITENS QUE AINDA N�O EXISTEM NA TABELA PRODUTOS
INSERT INTO PRODUTOS(

SELECT CODIGO_DO_PRODUTO
, tp.NOME_DO_PRODUTO
, tp.SABOR
, tp.TAMANHO
, tp.EMBALAGEM
, tp.PRECO_DE_LISTA
FROM tabela_de_produtos tp
LEFT JOIN produtos p
ON tp.codigo_do_produto = p.codigo
WHERE p.codigo IS NULL

); 

-- OUTRA SOLU��O ---

INSERT INTO PRODUTOS(

SELECT CODIGO_DO_PRODUTO
, tp.NOME_DO_PRODUTO
, tp.SABOR
, tp.TAMANHO
, tp.EMBALAGEM
, tp.PRECO_DE_LISTA
FROM tabela_de_produtos tp
WHERE codigo_do_produto NOT IN (select codigo from produtos)

); 

