create database projeto;
use projeto;

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50)
);

CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
);
alter table aviso add column momento datetime default current_timestamp;

select * from aviso;

select count(*), second(momento) 
        from aviso as descricao join usuario
        on descricao.fk_usuario = usuario.id
        where fk_usuario = 4
        group by second(momento) ;
select * from aviso;
select count(*), second(momento) from aviso group by second(momento);

select count(*) as descricao, 
    second(momento) from aviso where fk_usuario = 4
    group by second(momento) limit 7 desc;

select top 1, count(*), second(momento) from medida group by second(momento);
create table aquario (
/* em nossa regra de negócio, um aquario tem apenas um sensor */
	id INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(300)
);

insert into aquario values
(1, ' peixes'),
(2, 'caramujos');
select* from aquario;

/* esta tabela deve estar de acordo com o que está em INSERT de sua API do arduino - dat-acqu-ino */

create table medida (
	id INT PRIMARY KEY AUTO_INCREMENT,
	dht11_umidade DECIMAL,
	dht11_temperatura DECIMAL,
	luminosidade DECIMAL,
	lm35_temperatura DECIMAL,
	chave TINYINT,
	momento DATETIME,
	fk_aquario INT,
	FOREIGN KEY (fk_aquario) REFERENCES aquario(id)
);

insert into medida(dht11_umidade, dht11_temperatura, momento, fk_aquario) values
(20, 34, now(), 1),
(21, 34, now(), 1),
(22, 36, now(), 1),
(23, 37, now(), 1),
(22, 36, now(), 1),
(23, 37, now(), 1),
(24, 39, now(), 1);
insert into medida(dht11_umidade, dht11_temperatura, momento, fk_aquario) values
(98, 10, now(), 2),
(99, 11, now(), 2),
(100, 14, now(), 2),
(97, 37, now(), 2),
(96, 16, now(), 2),
(95, 16, now(), 2),
(99, 11, now(), 2);

select* from aviso;