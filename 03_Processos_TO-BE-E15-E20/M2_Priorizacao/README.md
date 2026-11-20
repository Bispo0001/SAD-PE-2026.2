# M2 - Priorização

Este diretório reúne o artefato TO-BE do módulo **M2 - Priorização** do
SAD-PE, referente ao processo proposto para organizar e priorizar estudantes
que necessitam de apoio pedagógico no Campus Aracaju do IFS.

## Documento principal

- [`M2_Priorizacao_TO-BE_v1_0.pdf`](./M2_Priorizacao_TO-BE_v1_0.pdf) -
  BPMN TO-BE do M2, versão 1.0.

O processo recebe relatos e dados consolidados pelo SAD-PE, calcula uma
priorização padronizada, relaciona os estudantes às intervenções disponíveis
e encaminha os casos selecionados ao M3.

## Objetivo

O processo TO-BE busca substituir o uso informal da ordem de chegada e da
agenda individual por uma fila registrada, revisável e calculada com critérios
consistentes.

As principais melhorias previstas são:

- consolidação centralizada dos dados no SAD-PE;
- cálculo padronizado do score de cada estudante;
- definição explícita do nível de urgência;
- apresentação da fila semanal;
- consideração de capacidade e restrições no agendamento;
- registro único dos atendimentos;
- encaminhamento do atendimento selecionado ao M3.

## Fluxo geral TO-BE

1. O professor percebe uma dificuldade e registra o relato no SAD-PE.
2. O sistema consolida os dados disponíveis e calcula o score de cada
   estudante.
3. O nível de urgência é definido para o bimestre conforme os critérios
   parametrizados.
4. O sistema ordena a fila.
5. Quando há necessidade de desempate, são considerados fatores como menor
   frequência, maior quantidade de disciplinas abaixo de 6,0 e repetência na
   série atual.
6. O sistema relaciona os estudantes às intervenções recomendadas pelo M3.
7. O setor pedagógico verifica a capacidade disponível e as restrições
   informadas.
8. O sistema marca o corte da fila e filtra as intervenções compatíveis.
9. A equipe pedagógica revisa a fila, ajusta a ordem quando necessário e
   seleciona os casos da semana.
10. O setor pedagógico contata o estudante e a família, agenda o atendimento e
    registra o resultado no SAD-PE.
11. Os casos não selecionados permanecem na fila.

## Cálculo da priorização

O modelo utiliza pesos, faixas e limites parametrizáveis para calcular o score
e definir a urgência de cada caso.

O score não é apresentado no PDF com todos os pesos ou fórmulas. Esses
parâmetros devem ser mantidos conforme a especificação vigente dos critérios
do M2 e aprovados pela governança responsável.

Quando necessário, o desempate considera:

- menor frequência;
- maior quantidade de disciplinas abaixo da média;
- estudante repetente na série atual.

### Intervenções anteriores

No modelo TO-BE, os registros de atendimentos anteriores podem influenciar a
priorização. O PDF informa que, sem registros disponíveis, esse critério fica
inativo e os demais pesos são redistribuídos.

## Participantes

- Professor da disciplina;
- SAD-PE;
- Setor pedagógico;
- Estudante e família;
- M3 - Intervenção.

## Papel do setor pedagógico

A equipe pedagógica mantém a responsabilidade pela revisão da fila e pela
decisão final de atendimento.

Quando a capacidade não está informada, a equipe define quantos estudantes
pode atender por semana. A decisão final pode ajustar a ordem sugerida pelo
sistema.

Os casos não atendidos permanecem na fila para consideração em períodos
posteriores.

## Vulnerabilidade e uso de dados

O PDF registra vulnerabilidade como contexto de apoio socioeconômico
considerado no processo, mas informa que o professor não deve visualizar esse
fator.

Os detalhes de acesso, uso e minimização das informações sensíveis devem seguir
as regras de LGPD e as permissões institucionais definidas para o SAD-PE.

## Problemas do AS-IS tratados

O modelo TO-BE registra como resolvidas ou mitigadas as seguintes dificuldades:

- busca lenta por dados consolidados;
- falta de critérios padronizados para score e urgência;
- registros descentralizados de atendimentos;
- dificuldade no agendamento;
- falta de tratamento sistemático de capacidade e restrições.

Ainda não existe no processo uma capacidade formalmente definida em todos os
cenários. Quando não há informação suficiente, o setor pedagógico determina
quantos estudantes podem ser atendidos por semana.

## Relação com outros módulos

- **M1 - Identificação de Risco:** identifica estudantes e encaminha dados
  relevantes para o M2.
- **M2 - Priorização:** consolida os dados, calcula a priorização e organiza a
  fila semanal.
- **M3 - Intervenção:** fornece o catálogo de intervenções e recebe os casos
  selecionados para definição e execução do atendimento.
- **M4 - Painel Analítico:** pode utilizar os resultados e históricos de
  permanência para apoiar futuras revisões dos critérios.

## Fontes citadas no documento

O PDF declara como fontes:

- Critérios de Priorização do M2, versão 1.0;
- Catálogo de Intervenções do M3;
- AS-IS do M2, versão 1.3;
- Documento de problema E13;
- Ficha 1;
- Ficha 3.

## Observações

Este README descreve o fluxo registrado no PDF TO-BE. Os pesos, faixas,
limites, critérios de vulnerabilidade e regra de capacidade devem ser
confirmados pelas especificações oficiais antes da implementação.
