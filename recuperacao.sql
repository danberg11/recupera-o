-- Criação do banco de dados
create database basquete;
use basquete;

-- Criação das tabelas
create table jogadores (
    jogador_id int auto_increment primary key,
    nome varchar(255) not null,
    data_nascimento date,
    nacionalidade varchar(100),
    altura decimal(4, 2),
    peso decimal(5, 2)
);

create table equipes (
    equipe_id int auto_increment primary key,
    nome_equipe varchar(255) not null,
    cidade varchar(100),
    estado varchar(100),
    ano_fundacao year
);

create table partidas (
    partida_id int auto_increment primary key,
    data_partida date,
    equipe_casa_id int,
    equipe_visitante_id int,
    pontos_casa int,
    pontos_visitante int,
    constraint fk_equipe_casa foreign key (equipe_casa_id) references equipes(equipe_id),
    constraint fk_equipe_visitante foreign key (equipe_visitante_id) references equipes(equipe_id)
);

create table estatisticas (
    estatistica_id int auto_increment primary key,
    jogador_id int,
    partida_id int,
    pontos int,
    assistencias int,
    rebotes int,
    roubos int,
    bloqueios int,
    constraint fk_jogador foreign key (jogador_id) references jogadores(jogador_id),
    constraint fk_partida foreign key (partida_id) references partidas(partida_id)
);

-- Inserção de dados nas tabelas
insert into jogadores (nome, data_nascimento, nacionalidade, altura, peso) values 
('lebron james', '1984-12-30', 'americano', 2.01, 113.40),
('stephen curry', '1988-03-14', 'americano', 1.91, 86.18),
('giannis antetokounmpo', '1994-12-06', 'grego', 2.11, 110.70),
('kevin durant', '1988-09-29', 'americano', 2.06, 109.77);

insert into equipes (nome_equipe, cidade, estado, ano_fundacao) values 
('los angeles lakers', 'los angeles', 'california', 1947),
('golden state warriors', 'san francisco', 'california', 1946),
('milwaukee bucks', 'milwaukee', 'wisconsin', 1968),
('brooklyn nets', 'brooklyn', 'new york', 1967);

insert into partidas (data_partida, equipe_casa_id, equipe_visitante_id, pontos_casa, pontos_visitante) 
values 
('2024-08-01', 1, 2, 110, 98),
('2024-08-02', 3, 4, 105, 115),
('2024-08-03', 1, 3, 120, 102),
('2024-08-04', 2, 4, 112, 110);

insert into estatisticas (jogador_id, partida_id, pontos, assistencias, rebotes, roubos, bloqueios) 
values 
(1, 1, 28, 7, 8, 2, 1),
(2, 1, 34, 6, 5, 3, 0),
(3, 2, 30, 4, 12, 2, 3),
(4, 2, 25, 5, 7, 1, 2);

-- Exibição 
select * from jogadores;
select * from equipes;
select * from partidas;
select * from estatisticas;

--  dados das partidas
select * from partidas
where data_partida between '2024-08-01' and '2024-08-31';

select * from estatisticas
where pontos > 30;
