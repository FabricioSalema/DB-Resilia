CREATE TABLE `aluno` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(100),
  `idade` int,
  `turma_id` int,
  `curso_id` int
);

CREATE TABLE `curso` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(100),
  `aluno_id` int,
  `carga_horas` int
);

CREATE TABLE `professor` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(100),
  `email` varchar(100)
);

CREATE TABLE `turma` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(50),
  `professor_id` int,
  `curso_id` int
);

ALTER TABLE `aluno` ADD FOREIGN KEY (`turma_id`) REFERENCES `turma` (`id`);

ALTER TABLE `turma` ADD FOREIGN KEY (`professor_id`) REFERENCES `professor` (`id`);

ALTER TABLE `turma` ADD FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id`);

ALTER TABLE `curso` ADD FOREIGN KEY (`aluno_id`) REFERENCES `aluno` (`id`);

ALTER TABLE `aluno` ADD FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id`);

INSERT INTO professor (nome, email) values ("Ian", "ian@gmail.com"), ("Patrícia", "patricia@gmail.com");
INSERT INTO aluno (nome, idade) values ("Fabricio", 26), ("Salema", 20);
INSERT INTO curso (nome, carga_horas) values ("Soft", 200), ("Hard", 280);
INSERT INTO curso (nome) values ("201"), ("301");

SELECT turmas.id, turmas.curso_id, turmas.professor_id, professor.id, cursos.id
FROM ((turmas
INNER JOIN professor ON turmas.professor_id=professor.id)
INNER JOIN curso ON turmas.curso_id=curso.id);
