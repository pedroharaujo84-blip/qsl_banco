CREATE DATABASE academia_vb;
USE academia_vb;

CREATE TABLE planos(
    id_planos INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    valor_mensal DECIMAL(8,2),
    duracao_meses INT NOT NULL
);

CREATE TABLE alunos(
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    data_nascimento DATE NOT NULL
);

CREATE TABLE instrutores(
    id_instrutor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50) NOT NULL,
    telefone VARCHAR(20)
);

CREATE TABLE matriculas(
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_plano INT NOT NULL,
    id_instrutor INT,
    data_inicio DATE DEFAULT (CURRENT_DATE),
    status VARCHAR(20) DEFAULT 'Ativo',

    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_plano) REFERENCES planos(id_planos),
    FOREIGN KEY (id_instrutor) REFERENCES instrutores(id_instrutor)
);

INSERT INTO planos (nome, valor_mensal, duracao_meses) VALUES
('Mensal Básico', 89.90, 1),
('Trimestral Fit', 79.90, 3),
('Semestral Plus', 69.90, 6),
('Anual VIP', 59.90, 12);

INSERT INTO instrutores (nome, especialidade, telefone) VALUES
('Alberto', 'Musculação', '41997774137'),
('Fernando', 'Pilates', '41867774127'),
('Roberto', 'Crossfit', '41996664127'),
('Jorge', 'Musculação', '41997710127'),
('Vitor', 'Natação', '41997778127');

INSERT INTO alunos (nome, cpf, telefone, data_nascimento) VALUES
('Ana Clara Ribeiro', '137.965.609-54', '41997774123', '1985-05-14'),
('Maria', '137.965.609-55', '41996674123', '1995-05-08'),
('Diego', '127.965.609-78', '41287773127', '2005-06-12'),
('Ana', '111.665.600-55', '41996784127', '2012-10-03');

INSERT INTO matriculas 
(id_aluno, id_plano, id_instrutor, data_inicio, status) VALUES
(1, 4, 1, '2026-01-10', 'Ativo'),
(2, 1, 1, '2026-02-01', 'Ativo'),
(3, 2, 2, '2026-02-15', 'Ativo'),
(4, 3, 3, '2026-01-20', 'Cancelado'),
(3, 1, 2, '2026-02-15', 'Ativo'),
(4, 3, 2, '2026-02-15', 'Ativo');

SELECT * FROM planos;
SELECT * FROM alunos;
SELECT * FROM instrutores;
SELECT * FROM matriculas;
