delete from produtos where codigo = 1001000;

select * from produtos;


sELECT * from PRODUTOS WHERE SUBSTR(DESCRITOR,1,15) = 'Sabor dos Alpes';

select * from tabela_de_produtos where substr(nome_do_produto,1,15) = 'Sabor dos Alpes';

select count(*) from produtos;

select count(*) from tabela_de_produtos;

DELETE FROM produtos
WHERE codigo NOT IN (SELECT codigo_do_produto FROM tabela_de_produtos);