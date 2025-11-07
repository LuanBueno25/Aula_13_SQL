create database empresa_join2;

use empresa_join2;

create table departamento(
	id bigint primary key auto_increment,
    nome varchar(255)
);

create table funcionario(
	id int primary key auto_increment,
    salario decimal(10,2) not null,
    nome varchar(100),
    id_departamento bigint,
    foreign key(id_departamento) references departamento(id)
);

create table dependente(
	id int primary key auto_increment,
    nome varchar(100),
    id_funcionario int,
    foreign key(id_funcionario) references funcionario(id)
);

insert into departamento(nome)
values ('Recursos Humanos'),
	   ('Tecnologia da Informação'),
       ('Marketing'),
       ('Financeiro'),
       ('Administrativo');
# select * from departamento;

insert into funcionario(salario, nome, id_departamento)
values (8000.00, 'Pietro', 1),
	   (7500.00, 'Luan', 2),
       (9000.00, 'Hugo', 3),
       (8500.00, 'Victor', 4),
       (7000.00, 'Pedro', 5),
       (4500.00, 'Pedro', 2),
       (7400.00, 'Alisson', 3),
       (6500.00, 'Luis', 1),
       (6500.00, 'Gabriel', 5),
       (7600.00, 'Marco', 4);
# select * from funcionario;

insert into dependente(nome, id_funcionario)
values ('Luana', 2),
	   ('Maria', 1),
       ('José', 3),
       ('João', 4),
       ('Marcos', 5),
       ('Carlos', 7),
       ('Luiz', 6),
       ('Allan', 8),
       ('Walisson', 9),
       ('Tonico', 10);
# select * from dependente;

	# Atividade 1
select func.nome as nomeFuncionario, count(depen.id) as quantDependentes 
from funcionario func
inner join dependente depen
on func.id = depen.id_funcionario
group by func.nome
having count(depen.id) > 1;

	# Atividade 2
select dep.nome as nomeDepartamento, func.nome as nomeFuncionario
from departamento dep
inner join funcionario func
on dep.id = func.id
order by func.nome;
    
    # Atividade 3
select func.nome as nomeFuncionario, depen.nome as nomeDependente
from funcionario func
left join dependente depen
on func.id = depen.id;

	# Atividade 4
select dep.nome as nomeDepartamento, avg(func.salario) as mediaSalario
from departamento dep
inner join funcionario func
on dep.id = func.id_departamento
group by dep.nome;

	# Atividade 5
select dep.nome as nomeDepartamento, func.nome as nomeFuncionario
from departamento dep
left join funcionario func
on dep.id = func.id;

	# Atividade 6
select sum(salario) as salarioGeral 
from funcionario;
	
    # Atividade 7
select dep.nome, sum(func.salario) as salarioFuncionario
from departamento dep
inner join funcionario func
on dep.id = func.id_departamento
group by dep.nome;