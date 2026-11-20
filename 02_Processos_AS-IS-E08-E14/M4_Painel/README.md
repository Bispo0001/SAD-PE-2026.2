# M4 - Painel Analítico de Permanência

Este diretório reúne o artefato AS-IS do módulo **M4 - Painel Analítico de
Permanência** do SAD-PE, referente à análise atual da permanência e do êxito
dos estudantes no Campus Aracaju do IFS.

## Documento principal

- [`M4_Painel_Analitico-AS-IS.pdf`](./M4_Painel_Analitico-AS-IS.pdf) -
  BPMN AS-IS do M4, revisão 1.2.

## Objetivo

O processo atual consolida dados acadêmicos e registros de apoio ao fim do ano
letivo para analisar aprovação, retenção e evasão. A revisão ocorre
principalmente por meio de relatórios estáticos, apresentações e gráficos
publicados no PROEN.

O processo tem como objetivo apoiar a Direção de Ensino e os colegiados na
identificação de gargalos e no planejamento de novas ações.

## Participantes

- Equipe Multidisciplinar;
- Setor Pedagógico;
- TI e Registro Acadêmico;
- Direção de Ensino;
- Colegiados dos cursos;
- PROEN.

## Fluxo geral AS-IS

1. Ao fim do ano letivo, a equipe multiprofissional envia dados dos estudantes
   e informações sobre os auxílios oferecidos.
2. A Direção ou os colegiados solicitam relatórios estáticos de desempenho.
3. A TI extrai dados do SUAP e gera relatórios de aprovação, retenção
   e evasão.
4. Os relatórios são entregues em PDF ou CSV.
5. A equipe multiprofissional consolida os dados em apresentações ou PDFs.
6. A TI disponibiliza os resultados e gráficos no PROEN.
7. A Direção e os colegiados consultam os materiais publicados.
8. Os indicadores são analisados por curso, série, ano e disciplina.
9. A equipe identifica gargalos e realiza uma reunião para discutir ações.
10. Quando novas ações são necessárias, são planejados apoio, monitorias ou
    revisão metodológica.

## Entradas do processo

### Dados acadêmicos

A base acadêmica é consultada no SISTEC/SIGAA. O processo utiliza informações
de aprovação, retenção, evasão, notas, frequência e matrículas por série.

### Dados de atendimento

A equipe multiprofissional envia dados do estudante e o tipo de auxílio
ofertado. Os formatos, responsáveis e regras de envio ainda não estão
formalmente definidos no modelo.

## Saídas do processo

O resultado atual pode ser:

- relatórios estáticos em PDF ou CSV;
- apresentações consolidadas;
- gráficos publicados no PROEN;
- lista de cursos, séries ou disciplinas com maior retenção ou evasão;
- planejamento de apoio, monitorias e revisão metodológica;
- encerramento do ciclo sem novas ações.

O planejamento concluído pode conter ações para o ano seguinte.

## Governança da decisão

A Direção de Ensino e os colegiados são responsáveis por analisar os
indicadores e decidir se há necessidade de novas ações.

Quando não existem novas ações necessárias, o ciclo termina e só recomeça no
fim do próximo ano letivo.

Quando existem ações necessárias, a equipe planeja iniciativas como:

- apoio pedagógico;
- monitorias;
- revisão metodológica.

Participantes da reunião, frequência e registro em ata ainda precisam ser
confirmados.

## Pontos de dor

Principais limitações identificadas no modelo AS-IS:

- não existe visão dimensional ou OLAP;
- não é possível filtrar coortes históricas por perfil e série;
- a extração, a consolidação e a publicação são fragmentadas;
- os dados são consolidados manualmente em apresentações ou PDFs;
- a análise é estática e retroativa;
- o ciclo ocorre apenas no fim do ano letivo;
- não é possível medir a eficácia real das intervenções;
- os históricos e os filtros disponíveis nos gráficos do IFS precisam ser
  confirmados;
- não existe registro institucional claro da execução e do acompanhamento das
  ações planejadas.

## Base sintética apresentada no documento

Os exemplos informados no PDF são didáticos e não substituem a análise com
dados reais.

O documento cita:

- 6 cursos;
- 230 disciplinas;
- 2.633 alunos;
- 7.595 matrículas por série;
- na 1ª série, média B1+B2 abaixo de 6,0 em Matemática ou Física associada a
  39% de retidos, contra 12% nos demais casos.

Esse dado sintético não demonstra causalidade e precisa ser validado com dados
institucionais reais.

## Critérios acadêmicos citados

O PDF relaciona o processo às regras acadêmicas do ROD:

- terceira série: qualquer reprovação pode gerar retenção;
- a partir da terceira retenção, pode haver desligamento;
- critérios de retenção e desligamento devem ser confirmados institucionalmente;
- as definições acadêmicas precisam orientar os indicadores de permanência.

## Relação com outros módulos

- **M1 - Identificação de Risco:** fornece dados e contextos de risco para
  futuras ações preventivas.
- **M2 - Priorização:** utiliza critérios e históricos relacionados à
  priorização dos estudantes.
- **M3 - Intervenção:** registra as ações de apoio cuja eficácia não é
  medida pelo processo atual do M4.
- **M4 - Painel Analítico:** consolida os resultados anuais e planeja novas
  ações.

## Questões a validar

- a quem a equipe multidisciplinar envia os dados e em que formato;
- quem solicita os relatórios à TI;
- prazo e prioridade utilizados pela TI;
- responsabilidade pela consolidação dos dados;
- se os gráficos do PROEN permitem filtros por curso, série e disciplina;
- se os gráficos permitem comparar anos anteriores;
- existência de modelo formal de apresentação;
- participantes e periodicidade da reunião de decisão;
- registro formal das decisões em ata;
- acompanhamento da execução das ações planejadas;
- regras completas de retenção e desligamento no ROD.

## Premissas do levantamento

Alguns elementos foram acrescentados ao diagrama por informação da equipe do
projeto e não constavam diretamente no relatório original:

- participação da equipe multidisciplinar;
- disponibilização dos dados no PROEN;
- realização da reunião antes da decisão;
- consolidação atribuída à equipe multidisciplinar;
- ciclos iniciados ao fim do ano letivo.

Essas premissas devem ser validadas pelas áreas responsáveis antes de serem
consideradas definitivas.
