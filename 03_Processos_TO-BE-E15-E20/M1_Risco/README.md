# M1 - Identificação de Risco

Este diretório reúne o artefato TO-BE do módulo **M1 - Identificação de Risco**
do SAD-PE, referente ao processo proposto para identificar estudantes que
necessitam de acompanhamento preventivo ou estruturado no Campus Aracaju do
IFS.

## Documento principal

- [`M1_to-be.pdf`](./M1_to-be.pdf) - BPMN TO-BE do M1, versão 2.

O modelo apresenta os fluxos entre o estudante e a família, docentes,
coordenação do curso, setor pedagógico, assistência estudantil, TI/Registro
Acadêmico, SAD-PE, M2 e M4.

## Objetivo

O processo TO-BE busca substituir classificações informais por um fluxo
padronizado de identificação, registro e encaminhamento de risco. As principais
premissas são:

- considerar dados acadêmicos e cadastrais antes de gerar um alerta;
- evitar a criação de casos duplicados;
- associar cada estudante ativo a um único caso no SAD-PE;
- minimizar a exposição de dados pessoais e socioeconômicos;
- enviar ao M2 apenas as informações necessárias ao acolhimento e à
  intervenção;
- manter critérios calibráveis e aprovados pelo processo de governança do M4.

## Fluxo geral TO-BE

1. Dados acadêmicos e cadastrais são recebidos pelo SAD-PE.
2. O sistema valida a integridade e a consistência das informações.
3. O perfil de risco inicial é avaliado com critérios padronizados.
4. A ausência de dados suficientes gera uma pendência cadastral, sem
   classificação automática de risco.
5. Quando o risco é confirmado, o sistema verifica a existência de um caso
   ativo.
6. Casos já existentes recebem uma atualização de histórico, evitando alertas
   duplicados.
7. Novos casos recebem um ID único e são segregados conforme o perfil de
   acesso.
8. Um dossiê estruturado ou preventivo é enviado ao M2 para acolhimento,
   definição de responsável e intervenção.
9. O M4 monitora os resultados e pode propor recalibração dos parâmetros de
   risco.

## Entradas do processo

O processo pode começar pelas seguintes fontes:

- Registro de notas e frequências pelo docente;
- Alerta pedagógico recebido pela disciplina;
- Solicitação de apoio presencial ou digital feita pelo estudante ou pela
  família;
- Dados disponibilizados pela base SUAP e pelo Registro Acadêmico;
- Complementação de dados cadastrais pendentes;
- Encerramento de matrículas;
- Solicitação de conselho realizada pela coordenação ou pela equipe
  responsável.

## Produtos e encaminhamentos

### Caso preventivo

É criado para estudantes que precisam de acolhimento preventivo. O processo
envia ao M2 um dossiê com o identificador do caso e os dados necessários ao
início do acompanhamento.

### Caso estruturado

É criado quando os critérios de risco são atingidos. O M2 recebe o caso com
ID, dossiê e indicadores utilizados na avaliação.

### Caso já ativo

Uma demanda recebida é vinculada ao caso existente e o histórico é atualizado.
Esse mecanismo evita alertas duplicados e mantém uma única titularidade.

### Caso espontâneo

Quando o estudante ou a família solicita apoio, a equipe pedagógica consulta o
cadastro único, verifica o caso ativo e cria ou vincula o atendimento conforme
o resultado.

### Alerta pedagógico

O docente recebe apenas recomendações pedagógicas acionáveis, sem exposição de
dados socioeconômicos ou rótulos de risco. A coordenação analisa os alertas
consolidados da turma e pode solicitar acionamento do conselho no M2.

## Critérios e governança

Os critérios representados no processo incluem:

- presença mínima de 75%;
- média anual mínima de 6,0 para cursos integrados;
- ciclo contínuo de avaliação e registro;
- aprovação da recalibração pelo M4 antes da atualização dos parâmetros;
- encerramento do monitoramento quando o estudante deixa de atender às
  condições do processo.

Os parâmetros não são considerados permanentes. O M4 pode analisar resultados,
falsos positivos e eficácia das intervenções antes de propor novos pesos ou
limiares.

## Proteções de LGPD

O modelo TO-BE registra os seguintes controles:

- minimização de dados enviados aos docentes;
- uso de ID único para identificação interna do caso;
- segregação de dados por perfil de acesso;
- prevenção de duplicidade de alertas;
- geração de pendências cadastrais quando os dados não forem suficientes;
- aplicação das regras previstas para menores, conforme o artigo 14 da LGPD,
  durante a governança do processo.

As regras finais de retenção, acesso, compartilhamento e consentimento devem
ser validadas pelas áreas responsáveis e pela política institucional do
campus.

## Relação com outros módulos

- **M1 - Identificação de Risco:** valida dados, identifica o perfil de risco
  e cria ou atualiza casos.
- **M2 - Intervenção e Acompanhamento:** recebe os casos, define responsáveis
  e executa as intervenções.
- **M4 - Painel Analítico:** monitora permanência, recalibra critérios e
  avalia a eficácia das ações.
- **Registro Acadêmico/SUAP:** fornece dados acadêmicos e cadastrais.

## Participantes

- Estudante e família;
- Professor da disciplina;
- Coordenação do curso;
- Setor pedagógico;
- Assistência estudantil;
- TI e Registro Acadêmico;
- SAD-PE;
- M2 - Intervenção e Acompanhamento;
- M4 - Painel Analítico.

## Observações

Este README descreve o processo TO-BE representado no PDF. Os critérios,
permissões de acesso e condições de recalibração devem ser confirmados pelas
regras oficiais do ROD e pelas responsabilidades institucionais antes da
implementação.