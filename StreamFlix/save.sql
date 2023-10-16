create schema filme;

use filme;

create table filmes(
codigo int not null primary key,
nome varchar(50) null,
genero varchar(50) null,
classificacao int null,
lancamento int null,
duracao int null
);



'1', 'O Terno de 2 Bilhões de Dólares', 'Comédia/Artes Marciais/Ação', '12', '2002', '98'
'2', 'Esposa de mentira', 'Comédia/Romance', '12', '2011', '116'
'3', 'Soinic 2: O Filme', 'Para familia toda/Comédia', '10', '2022', '124'
'4', 'Superbad É Hoje', 'Comédia', '16', '2007', '113'
'5', 'Este é Meu Garoto', 'Sátiras/Comédia', '16', '2012', '114'
'6', 'Como se Tornar o Pior Aluno da Escola', 'Comédia/Filmes teen/Brasileiros', '18', '2017', '105'
'7', 'Jobs', 'Drama/Baseado na vida real', '12', '2013', '127'
'8', 'O Pequenino', 'Comédia', '12', '2006', '97'
'9', 'Carga Máxima', 'Brasileiro/Ação', '14', '2023', '98'
'10', 'Duelo no Asfalto', 'Comédia/Ação', '12', '2020', '100'