USE escola;

DROP TEMPORARY TABLE IF EXISTS e14_coorte;
CREATE TEMPORARY TABLE e14_coorte AS
SELECT a.id_aluno, a.id_curso, a.ano_ingresso, sv.nome AS situacao_vinculo
FROM alunos a
JOIN situacoes_vinculo sv ON sv.id_situacao_vinculo = a.id_situacao_vinculo
WHERE a.ano_ingresso BETWEEN 2017 AND 2021;

DROP TEMPORARY TABLE IF EXISTS e14_matriculas;
CREATE TEMPORARY TABLE e14_matriculas AS
SELECT m.id_matricula_serie, m.id_aluno, c.id_curso, c.ano_ingresso,
       m.ano_letivo, m.serie, ss.nome AS situacao_serie,
       SUM(CASE WHEN sn.nome IN ('Reprovado por falta', 'Reprovado por nota')
                THEN 1 ELSE 0 END) AS qtd_reprovacoes,
       CASE WHEN ss.nome NOT IN ('Em curso', 'Evadido') THEN 1 ELSE 0 END AS encerrada_e14
FROM matriculas_serie m
JOIN e14_coorte c ON c.id_aluno = m.id_aluno
JOIN situacoes_serie ss ON ss.id_situacao_serie = m.id_situacao_serie
LEFT JOIN notas n ON n.id_matricula_serie = m.id_matricula_serie
LEFT JOIN situacoes_nota sn ON sn.id_situacao_nota = n.id_situacao_nota
GROUP BY m.id_matricula_serie, m.id_aluno, c.id_curso, c.ano_ingresso,
         m.ano_letivo, m.serie, ss.nome;

SELECT '01 Evasao Eletrotecnica' AS indicador,
       COUNT(*) AS denominador_ingressantes,
       SUM(situacao_vinculo IN ('Evadido', 'Cancelado a pedido',
           'Jubilado (desligado por reincidência)')) AS numerador_evasao,
       ROUND(100.0 * SUM(situacao_vinculo IN ('Evadido', 'Cancelado a pedido',
           'Jubilado (desligado por reincidência)')) / NULLIF(COUNT(*),0),1) AS percentual,
       SUM(situacao_vinculo = 'Transferido') AS transferidos_fora_numerador
FROM e14_coorte WHERE id_curso = 101;

DROP TEMPORARY TABLE IF EXISTS e14_alerta;
CREATE TEMPORARY TABLE e14_alerta AS
SELECT m.id_matricula_serie,
       MAX(CASE WHEN cp.nome IN ('Matemática', 'Física')
                 AND b1.valor IS NOT NULL AND b2.valor IS NOT NULL
                 AND (b1.valor + b2.valor) / 2.0 < 6.0
                THEN 1 ELSE 0 END) AS alerta_mf
FROM e14_matriculas m
JOIN notas n ON n.id_matricula_serie = m.id_matricula_serie
JOIN disciplinas d ON d.id_disciplina = n.id_disciplina
JOIN componentes cp ON cp.id_componente = d.id_componente
LEFT JOIN notas_bimestre b1 ON b1.id_nota = n.id_nota AND b1.bimestre = 1
LEFT JOIN notas_bimestre b2 ON b2.id_nota = n.id_nota AND b2.bimestre = 2
WHERE m.serie = 1 AND m.encerrada_e14 = 1
GROUP BY m.id_matricula_serie;

SELECT '02 Retencao 1a serie por alerta B1-B2' AS indicador,
       CASE WHEN a.alerta_mf = 1 THEN 'Com alerta' ELSE 'Sem alerta' END AS grupo,
       COUNT(*) AS denominador_matriculas,
       SUM(m.qtd_reprovacoes > 0) AS numerador_retidas,
       ROUND(100.0 * SUM(m.qtd_reprovacoes > 0) / NULLIF(COUNT(*),0),1) AS percentual
FROM e14_matriculas m
JOIN e14_alerta a ON a.id_matricula_serie = m.id_matricula_serie
WHERE m.serie = 1 AND m.encerrada_e14 = 1
GROUP BY a.alerta_mf ORDER BY a.alerta_mf DESC;

SELECT '03 Retencao geral Eletrotecnica' AS indicador,
       COUNT(*) AS denominador_matriculas,
       SUM(qtd_reprovacoes > 0) AS numerador_retidas,
       ROUND(100.0 * SUM(qtd_reprovacoes > 0) / NULLIF(COUNT(*),0),1) AS percentual
FROM e14_matriculas
WHERE id_curso = 101 AND encerrada_e14 = 1;

SELECT '04 Aprovado com dependencia' AS indicador, COUNT(*) AS total
FROM matriculas_serie m JOIN situacoes_serie ss USING (id_situacao_serie)
WHERE ss.nome = 'Aprovado com dependência';
SELECT '04 Registros em dependencias' AS indicador, COUNT(*) AS total FROM dependencias;

DROP TEMPORARY TABLE IF EXISTS e14_retencoes_aluno;
CREATE TEMPORARY TABLE e14_retencoes_aluno AS
SELECT c.id_aluno, c.situacao_vinculo,
       COALESCE(SUM(CASE WHEN m.encerrada_e14 = 1 AND m.qtd_reprovacoes > 0
                         THEN 1 ELSE 0 END),0) AS retencoes_reclassificadas
FROM e14_coorte c LEFT JOIN e14_matriculas m ON m.id_aluno = c.id_aluno
GROUP BY c.id_aluno, c.situacao_vinculo;
SELECT '05 Retencoes anteriores x evasao' AS indicador,
       CASE WHEN retencoes_reclassificadas = 0 THEN 'Nunca retido'
            WHEN retencoes_reclassificadas = 1 THEN 'Retido uma vez'
            ELSE 'Retido duas ou mais vezes' END AS grupo,
       COUNT(*) AS denominador_alunos,
       SUM(situacao_vinculo IN ('Evadido','Cancelado a pedido',
           'Jubilado (desligado por reincidência)')) AS numerador_evasao,
       ROUND(100.0 * SUM(situacao_vinculo IN ('Evadido','Cancelado a pedido',
           'Jubilado (desligado por reincidência)')) / NULLIF(COUNT(*),0),1) AS percentual
FROM e14_retencoes_aluno
GROUP BY CASE WHEN retencoes_reclassificadas = 0 THEN 'Nunca retido'
              WHEN retencoes_reclassificadas = 1 THEN 'Retido uma vez'
              ELSE 'Retido duas ou mais vezes' END
ORDER BY MIN(retencoes_reclassificadas);

SELECT '06 Reprovacoes por falta' AS indicador,
       SUM(sn.nome IN ('Reprovado por falta','Reprovado por nota')) AS total_reprovacoes,
       SUM(sn.nome = 'Reprovado por falta') AS reprovacoes_por_falta,
       ROUND(100.0 * SUM(sn.nome = 'Reprovado por falta') /
           NULLIF(SUM(sn.nome IN ('Reprovado por falta','Reprovado por nota')),0),1) AS percentual_por_falta,
       SUM(sn.nome = 'Reprovado por falta' AND n.media_final >= 6.0) AS faltas_com_media_6_ou_mais,
       ROUND(100.0 * SUM(sn.nome = 'Reprovado por falta' AND n.media_final >= 6.0) /
           NULLIF(SUM(sn.nome = 'Reprovado por falta'),0),1) AS percentual_media_6_entre_faltas
FROM notas n JOIN situacoes_nota sn ON sn.id_situacao_nota = n.id_situacao_nota;

DROP TEMPORARY TABLE IF EXISTS e14_validacao;
CREATE TEMPORARY TABLE e14_validacao (
    verificacao VARCHAR(120) NOT NULL,
    resultado VARCHAR(20) NOT NULL
);

INSERT INTO e14_validacao (verificacao, resultado)
SELECT '07 Validacao Eletrotecnica evasao',
       CASE WHEN COUNT(*) = 230 AND
         SUM(situacao_vinculo IN ('Evadido','Cancelado a pedido',
             'Jubilado (desligado por reincidência)')) = 90
         THEN 'OK' ELSE 'DIVERGENTE' END
FROM e14_coorte WHERE id_curso = 101;

INSERT INTO e14_validacao (verificacao, resultado)
SELECT '07 Validacao Eletrotecnica retencao',
       CASE WHEN COUNT(*) = 710 AND SUM(qtd_reprovacoes > 0) = 419
         THEN 'OK' ELSE 'DIVERGENTE' END
FROM e14_matriculas WHERE id_curso = 101 AND encerrada_e14 = 1;

INSERT INTO e14_validacao (verificacao, resultado)
SELECT '07 Validacao alerta 1a serie',
       CASE WHEN COUNT(*) = 984 AND SUM(m.qtd_reprovacoes > 0) = 758
         THEN 'OK' ELSE 'DIVERGENTE' END
FROM e14_matriculas m JOIN e14_alerta a USING (id_matricula_serie)
WHERE a.alerta_mf = 1;

INSERT INTO e14_validacao (verificacao, resultado)
SELECT '07 Validacao sem alerta 1a serie',
       CASE WHEN COUNT(*) = 682 AND SUM(m.qtd_reprovacoes > 0) = 175
         THEN 'OK' ELSE 'DIVERGENTE' END
FROM e14_matriculas m JOIN e14_alerta a USING (id_matricula_serie)
WHERE a.alerta_mf = 0;

SELECT verificacao, resultado FROM e14_validacao ORDER BY verificacao;

DROP TEMPORARY TABLE IF EXISTS e14_validacao;
DROP TEMPORARY TABLE IF EXISTS e14_retencoes_aluno;
DROP TEMPORARY TABLE IF EXISTS e14_alerta;
DROP TEMPORARY TABLE IF EXISTS e14_matriculas;
DROP TEMPORARY TABLE IF EXISTS e14_coorte;
