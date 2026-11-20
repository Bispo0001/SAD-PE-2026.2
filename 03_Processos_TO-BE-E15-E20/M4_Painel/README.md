
# M4 - Painel Analítico de Permanência

Este diretório reúne o artefato TO-BE do módulo **M4 - Painel Analítico de
Permanência** do SAD-PE, referente ao processo proposto para consolidar
dados acadêmicos e de atendimento e apoiar decisões sobre permanência
estudantil no Campus Aracaju do IFS.

## Documento principal

- [`SAD-PE_TO-BE_M4_Painel_Analitico.pdf`](./SAD-PE_TO-BE_M4_Painel_Analitico.pdf) -
  BPMN TO-BE do M4, revisão 1.0.

O documento possui duas partes:

1. o processo BPMN da carga, consulta e decisão;
2. o complemento com o detalhamento do subprocesso de capacitação e os pontos
   pendentes de validação.

## Objetivo

O M4 substitui relatórios estáticos e consolidação manual em PDF por um painel
com modelo dimensional e consultas OLAP.

O modelo proposto pretende:

- atualizar indicadores a cada bimestre;
- disponibilizar filtros por curso, série, ano, disciplina e coorte;
- acompanhar a eficácia das intervenções durante o ano;
- apresentar fórmula, recorte e população de cada indicador;
- apoiar reuniões de decisão sem rotular estudantes;
- realizar revisões mais rápidas do que o ciclo anual do AS-IS.

A atualização bimestral é uma proposta derivada da estratégia do SAD-PE e
precisa ser confirmada pela gestão.

## Entradas do processo

O ciclo começa no bimestre e depende das seguintes fontes:

### M3 - Intervenção

O setor pedagógico envia registros de atendimento com dados do aluno e o
auxílio oferecido. O contrato entre M3 e M4 ainda precisa definir campos,
formato, frequência e responsável.

O PDF também questiona se “auxílio ofertado” equivale aos registros reais de
atendimento.

### TI e Registro Acadêmico

O TI disponibiliza uma extração da base acadêmica. A estratégia indica dados
como:

- notas;
- frequência;
- matrículas por série;
- dependências;
- histórico acadêmico;
- série histórica.

O processo pode usar o SISTEC ou SIGAA. A automação da extração, o responsável
pela TI e o prazo ainda devem ser definidos.

## Fluxo geral TO-BE

1. No início de cada bimestre, o ciclo é iniciado.
2. A equipe multiprofissional envia os registros de atendimento.
3. A TI disponibiliza a extração acadêmica.
4. Os dados são recebidos pelo SAD-PE em paralelo.
5. O sistema verifica a qualidade e a consistência dos dados.
6. Se houver inconsistência, a origem dos dados é solicitada a corrigir e o
   processo retorna à validação.
7. Dados consistentes são carregados em um modelo dimensional.
8. O sistema calcula indicadores, rankings e explicações.
9. Decisores são capacitados no primeiro uso e quando houver mudança no painel.
10. Direção e colegiados consultam o painel com filtros OLAP.
11. O ranking das disciplinas e a eficácia das intervenções são analisados.
12. Participantes realizam uma reunião de decisão.
13. Quando são necessárias novas ações, elas são definidas e registradas.

## Modelo dimensional

O modelo proposto utiliza uma tabela fato e dimensões, incluindo como
possibilidades:

- aluno;
- curso;
- série;
- disciplina;
- tempo;
- intervenção.

O diagrama definitivo deve ser fechado pela Guilda de Dados. Mudanças históricas
de curso e série também precisam ser representadas de forma consistente.

## Indicadores

O painel deve apresentar indicadores como:

- taxa por curso;
- taxa por série;
- taxa por disciplina;
- ranking das disciplinas com maior retenção;
- acompanhamento das intervenções;
- eficácia das ações ao longo do ano;
- tempo de permanência e situação registrada.

Cada indicador deve possuir:

- fórmula;
- recorte;
- população;
- explicação.

As fórmulas de conclusão, evasão e retenção devem ser validadas pela gestão e
coerentes com o ROD. O documento cita como referências:

- média anual mínima de 6,0;
- frequência mínima de 75%;
- regras de dependência;
- regras de retenção.

## Ranking de disciplinas

O ranking das disciplinas mais retentoras é uma ferramenta de diagnóstico. A
leitura deve ser definida sem atribuir culpa a docentes ou estudantes.

O painel deve considerar população, recorte e contexto, evitando conclusões
baseadas apenas em valores absolutos.

## Avaliação da eficácia

A eficácia das intervenções deve ser acompanhada com dados dos atendimentos.
Ainda são pendentes:

- definição do método de comparação;
- uso de coortes ou grupos de comparação;
- controle de viés de seleção;
- tratamento de amostras pequenas por curso;
- regra para avaliar intervenções com poucos participantes.

Por isso, o modelo não considera que os indicadores atuais de eficácia estejam
definitivamente validados.

## Capacitação dos decisores

O subprocesso de capacitação é realizado no primeiro uso do painel e também
quando o painel sofrer mudanças.

Ele consiste em:

1. apresentação do painel;
2. explicação das fórmulas, recortes e populações;
3. prática de consultas com um caso de exemplo;
4. registro de dúvidas e ajustes.

Formato, duração, responsável e periodicidade da capacitação ainda precisam
ser definidos.

## Decisão e governança

A Direção de Ensino e os colegiados consultam o painel, analisam resultados e
realizam uma reunião de decisão.

As decisões seguem um gateway:

- **Não há necessidade de novas ações:** o ciclo termina sem alterações;
- **Há necessidade de novas ações:** as ações são definidas e registradas.

Os seguintes pontos precisam ser definidos pela gestão:

- participantes da reunião;
- frequência;
- registro em ata;
- formato do registro das decisões no painel;
- retorno das decisões ao M3;
- retorno das decisões ao M1 para ajuste dos critérios;
- responsável por aprovar e executar cada ação.

## Qualidade dos dados

Antes da carga, o SAD-PE deve verificar consistência e integridade.

Caso sejam encontrados problemas:

1. solicitar correção à origem dos dados;
2. aguardar o responsável pela correção;
3. repetir a validação;
4. prosseguir somente após os dados serem considerados consistentes.

A origem, as regras de qualidade e o prazo de correção ainda precisam ser
definidos.

## LGPD e proteção de dados

O painel deve usar:

- pseudonimização por código numérico;
- minimização dos dados;
- acesso por perfil;
- resultados agregados;
- nenhum painel baseado em listas nominais;
- regra de supressão para recortes pequenos.

Recortes com poucos estudantes podem permitir reidentificação. Portanto, os
limiares de supressão e o tratamento de dados de menores devem ser validados
pela área responsável por ética e LGPD.

O painel apoia decisões institucionais sem atribuir um rótulo individual ao
estudante.

## Integração com outros módulos

- **M1 - Identificação de Risco:** pode receber ajustes de critérios a partir
  dos resultados do M4.
- **M2 - Priorização:** utiliza dados históricos e resultados de permanência
  para revisão futura dos critérios.
- **M3 - Intervenção:** fornece registros de atendimento e recebe decisões
  operacionais originadas no painel.
- **M4 - Painel Analítico:** consolida dados acadêmicos e de intervenção,
  calcula indicadores e apoia decisões.

## Relação com outros sistemas e fontes

- SISTEC;
- SIGAA;
- SUAP ou sistema institucional de Registro Acadêmico;
- registros do M3;
- ROD;
- gráficos e indicadores publicados pelo PROEN.

A integração com os relatórios oficiais do PROEN ainda precisa ser definida:
substituição, integração ou convivência.

## Pontos pendentes

Principais validações antes da implementação:

- periodicidade bimestral e responsável pelo disparo do ciclo;
- relação com o PROEN e demais gráficos institucionais;
- participantes e registro das reuniões;
- contrato M3→M4;
- automação da extração acadêmica;
- responsável por corrigir dados inconsistentes;
- modelo dimensional definitivo;
- fórmulas dos indicadores;
- método de avaliação da eficácia;
- critério do ranking de disciplinas;
- tratamento de recortes pequenos;
- pseudonimização e acesso por perfil;
- formato e execução da capacitação.

## Premissas

- o processo é separado do AS-IS, mas parte dos mesmos participantes e fluxos;
- o ciclo depende dos dados da equipe multiprofissional e da TI;
- a reunião e o gateway de decisão existentes no AS-IS são mantidos;
- o painel agrega dados e não substitui o julgamento institucional;
- os valores apresentados no artefato podem ser didáticos e podem diferir
  quando o modelo receber dados reais.
