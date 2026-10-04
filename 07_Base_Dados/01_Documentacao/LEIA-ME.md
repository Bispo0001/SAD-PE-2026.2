# Base acadêmica sintética — IFS Campus Aracaju (Técnico Integrado)

**Dados 100% fictícios, gerados para uso didático (SAD / previsão de vagas / evasão).** Nenhum registro corresponde a aluno real. Semente fixa (`20260925`): rodar `gera.py` reproduz exatamente os mesmos arquivos.

Exportação simulada em 25/09/2026. Coortes de ingresso 2017–2026; ano letivo 2026 em andamento (só B1 e B2 lançados).

## Arquivos
| Arquivo | Linhas | Conteúdo |
|---|---|---|
| cursos.csv | 6 | Eletrotécnica (101), Eletrônica (102), Edificações (103), Informática (104), Química (105), Alimentos (106) |
| disciplinas.csv | 230 | Grade por curso e série, com `peso_exatas` (0–1) |
| alunos.csv | 2.633 | Um registro por aluno; `id_aluno` = ano + curso + sequencial (ex.: 2019103027) |
| matriculas_serie.csv | 7.595 | Um registro por aluno por ano letivo (repetições de série aparecem em `vez_na_serie`) |
| notas.csv | 97.600 | Notas bimestrais, média, prova final, frequência e situação por disciplina |
| dependencias.csv | 1.693 | Disciplinas cursadas em progressão parcial |
| base_academica_ifs_aracaju.xml | — | Tudo acima, aninhado por aluno → ano letivo → disciplina |
| schema_mysql.sql | — | DDL MySQL + exemplo de LOAD DATA + consultas |

## Regras acadêmicas simuladas
- Escala 0–10, uma casa decimal. Aprovado se média anual ≥ 6,0. Abaixo disso: prova final, com MF = (MA + PF)/2 ≥ 5,0.
- Frequência < 75% na disciplina → reprovado por falta.
- 1–2 reprovações (1ª e 2ª série) → aprovado com dependência; 3+ reprovações, ou qualquer reprovação na 3ª série → retido.
- A partir da 3ª retenção, o aluno pode ser desligado (jubilado).

## Lógica de geração
Cada aluno recebe duas habilidades latentes (geral e matemática/física). A nota esperada numa disciplina cai proporcionalmente ao `peso_exatas` × dificuldade de exatas do curso, e sobe com a habilidade matemática. Evasão depende de reprovações, número de retenções, série (maior na 1ª), renda (cota), distância do campus e auxílio estudantil.

## Resultado (coortes 2017–2021, já encerradas)
| Curso | Conclusão | Evasão | Retenção geral | Retenção 1ª série |
|---|---|---|---|---|
| Eletrotécnica | 48% | 39% | 33% | 37% |
| Eletrônica | 56% | 35% | 33% | 38% |
| Edificações | 64% | 29% | 26% | 24% |
| Informática | 70% | 26% | 23% | 24% |
| Química | 67% | 29% | 24% | 23% |
| Alimentos | 78% | 14% | 20% | 16% |

Disciplinas que mais reprovam: Eletricidade CC (≈39%), Circuitos Elétricos I (≈37%), Eletricidade CA, Matemática e Física (≈25% cada).

## Campos com nulo proposital
`nota_b3`/`nota_b4`/médias em 2026 (bimestres abertos); `serie_atual` só para quem está cursando; `ano_saida`/`motivo_saida` só para quem saiu; `prova_final` só para quem ficou abaixo de 6,0; disciplinas de alunos que evadiram no meio do ano ficam com situação "Cancelada" e só os bimestres cursados.
