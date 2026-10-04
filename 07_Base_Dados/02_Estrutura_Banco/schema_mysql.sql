-- Base acadêmica SINTÉTICA – IFS Campus Aracaju – Técnico Integrado ao Ensino Médio
-- Exportação simulada em 2026-09-25 (ano letivo 2026 com 2 bimestres fechados)
CREATE DATABASE IF NOT EXISTS ifs_integrado CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE ifs_integrado;

CREATE TABLE cursos (
  id_curso SMALLINT PRIMARY KEY, nome VARCHAR(80) NOT NULL, eixo_tecnologico VARCHAR(60),
  turno VARCHAR(12), vagas_anuais TINYINT, duracao_anos TINYINT, campus VARCHAR(30));

CREATE TABLE disciplinas (
  id_disciplina INT PRIMARY KEY, codigo VARCHAR(10) UNIQUE NOT NULL, id_curso SMALLINT NOT NULL,
  serie TINYINT NOT NULL, nome VARCHAR(80) NOT NULL, nucleo ENUM('Básico','Técnico'),
  carga_horaria SMALLINT, peso_exatas DECIMAL(3,2),
  FOREIGN KEY (id_curso) REFERENCES cursos(id_curso));

CREATE TABLE alunos (
  id_aluno BIGINT PRIMARY KEY, id_curso SMALLINT NOT NULL, ano_ingresso SMALLINT NOT NULL,
  forma_ingresso VARCHAR(30), modalidade_cota VARCHAR(4), sexo CHAR(1), idade_ingresso TINYINT,
  municipio_residencia VARCHAR(40), escola_origem_publica CHAR(1), distancia_campus_km DECIMAL(5,1),
  nota_processo_seletivo DECIMAL(3,1), recebe_auxilio_estudantil CHAR(1), serie_atual TINYINT NULL,
  total_retencoes TINYINT, situacao_vinculo VARCHAR(45), ano_saida SMALLINT NULL, motivo_saida VARCHAR(60) NULL,
  FOREIGN KEY (id_curso) REFERENCES cursos(id_curso));

CREATE TABLE matriculas_serie (
  id_matricula_serie INT PRIMARY KEY, id_aluno BIGINT NOT NULL, id_curso SMALLINT NOT NULL,
  ano_letivo SMALLINT NOT NULL, serie TINYINT NOT NULL, vez_na_serie TINYINT, qtd_reprovacoes TINYINT NULL,
  situacao_serie VARCHAR(30),
  FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno));

CREATE TABLE notas (
  id_nota INT PRIMARY KEY, id_matricula_serie INT NOT NULL, id_aluno BIGINT NOT NULL,
  ano_letivo SMALLINT, serie TINYINT, id_disciplina INT NOT NULL, codigo_disciplina VARCHAR(10),
  nota_b1 DECIMAL(3,1) NULL, nota_b2 DECIMAL(3,1) NULL, nota_b3 DECIMAL(3,1) NULL, nota_b4 DECIMAL(3,1) NULL,
  media_anual DECIMAL(3,1) NULL, prova_final DECIMAL(3,1) NULL, media_final DECIMAL(3,1) NULL,
  frequencia_pct DECIMAL(4,1), situacao VARCHAR(30),
  FOREIGN KEY (id_matricula_serie) REFERENCES matriculas_serie(id_matricula_serie),
  FOREIGN KEY (id_disciplina) REFERENCES disciplinas(id_disciplina));

CREATE TABLE dependencias (
  id_dependencia INT PRIMARY KEY, id_aluno BIGINT NOT NULL, ano_letivo SMALLINT,
  codigo_disciplina VARCHAR(10), nota_final DECIMAL(3,1), situacao VARCHAR(12),
  FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno));

-- Carga (ajuste o caminho; requer local_infile=1). Campos vazios viram NULL via NULLIF.
-- Exemplo para alunos (repita o padrão para as demais tabelas, na ordem: cursos, disciplinas, alunos, matriculas_serie, notas, dependencias):
-- LOAD DATA LOCAL INFILE 'alunos.csv' INTO TABLE alunos CHARACTER SET utf8mb4
--   FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES
--   (id_aluno,id_curso,ano_ingresso,forma_ingresso,modalidade_cota,sexo,idade_ingresso,municipio_residencia,
--    escola_origem_publica,distancia_campus_km,nota_processo_seletivo,recebe_auxilio_estudantil,@serie,
--    total_retencoes,situacao_vinculo,@ano_saida,@motivo)
--   SET serie_atual=NULLIF(@serie,''), ano_saida=NULLIF(@ano_saida,''), motivo_saida=NULLIF(@motivo,'');

-- Consultas de exemplo
-- Taxa de retenção por curso e série:
-- SELECT c.nome, m.serie, ROUND(100*AVG(m.situacao_serie='Retido'),1) AS pct_retidos
--   FROM matriculas_serie m JOIN cursos c USING(id_curso)
--  WHERE m.situacao_serie NOT IN ('Em curso','Evadido') GROUP BY c.nome, m.serie;
-- Disciplinas que mais reprovam:
-- SELECT d.nome, c.nome curso, ROUND(100*AVG(n.situacao LIKE 'Reprovado%'),1) pct_reprov
--   FROM notas n JOIN disciplinas d USING(id_disciplina) JOIN cursos c ON c.id_curso=d.id_curso
--  WHERE n.situacao NOT IN ('Em curso','Cancelada') GROUP BY d.id_disciplina ORDER BY pct_reprov DESC LIMIT 15;
