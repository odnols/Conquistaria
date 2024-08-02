create database Conquistas;

use Conquistas;

create table usuario(
    id_user int not null auto_increment primary key,
    gamertag varchar(100),
    senha varchar(50),
    pontuacao int,
    nome_img varchar(50),
    biografia varchar(500),
    moderacao int
) engine = InnoDB;

create table game(
    id_game int not null auto_increment primary key,
    nome_game varchar(255) not null,
    img_game varchar(50),
    plataforma varchar(50) not null,
    total_conquistas int
) engine = InnoDB;

create table conquista(
    id_conquista int not null auto_increment primary key,
    id_game int not null,
    nome_conquista varchar(255) not null,
    pontuacao int,
    descricao varchar(500),
    img_conquista varchar(50),
    plataforma varchar(20),
    secreta boolean,
    foreign key(id_game) references game(id_game)
) engine = InnoDB;

create table alcancada(
    id_alcance int not null auto_increment primary key,
    id_conquista int not null,
    id_jogador int not null,
    data_alcancada date,
    foreign key(id_conquista) references conquista(id_conquista),
    foreign key(id_jogador) references usuario(id_user)
) engine = InnoDB;

create table jogos_possuidos(
    id_game int not null,
    id_jogador int not null,
    foreign key(id_game) references game(id_game),
    foreign key(id_jogador) references usuario(id_user)
) engine = InnoDB;