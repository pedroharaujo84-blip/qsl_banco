CREATE DATABASE academia_bd;
USE academia_bd;

CREATE TABLE planos(
id_planos INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
valor_mensal DECIMAL (8,2) NOT NULL,
duracao_mes INT NOT NULL
);

CREATE TABLE alunos(
id_aluno INT AUTO_INCREMENT PRIMARY KEY,
cpf VARCHAR(14) UNIQUE NOT NULL,
telefone VARCHAR (20),
data_nascimento DATE NOT NULL
);

CREATE TABLE instrutores(
id_instrutor INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
especialidade VARCHAR(50) NOT NULL,
telefone VARCHAR(20)
);

CREATE TABLE matriculas(
id_matriculas INT AUTO_INCREMENT PRIMARY KEY,
id_aluno INT NOT NULL,
id_plano INT NOT NULL,
id_instrutor INT,
data_inicio DATE DEFAULT (CURRENT_DATE),
status VARCHAR(20) DEFAULT 'Ativo',
FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
FOREIGN KEY (id_planos) REFERENCES planos(id_planos),
FOREIGN KEY (id_instrutor) REFERENCES instrutor(id_instrutor)
);
