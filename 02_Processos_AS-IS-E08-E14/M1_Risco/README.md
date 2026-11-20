
# M1 - Identificação de Risco

Este diretório reúne o artefato [`M1_Risco_AS-IS.pdf`](./M1_Risco_AS-IS.pdf),
que representa o processo de identificação de risco estudantil no Campus
Aracaju do IFS.

## Documento principal

- [`M1_Risco_AS-IS.pdf`](./M1_Risco_AS-IS.pdf) - diagrama BPMN relacionado
  ao M1 - Identificação de Risco.

## Observação sobre a nomenclatura

Apesar do nome do arquivo indicar AS-IS, o conteúdo visual do PDF declara
expressamente:

- **IFS Campus Aracaju — M1: Identificação de Risco (TO-BE v2)**;
- controles e melhorias associados à proposta TO-BE;
- integração com o M2 - Intervenção e o M4 - Painel Analítico.

Portanto, este README descreve o conteúdo confirmado no PDF, mas não trata o
arquivo como um AS-IS institucionalmente fechado enquanto essa divergência de
nome não for corrigida pela equipe responsável.

## Objetivo

O processo proposto identifica estudantes em situação de risco acadêmico ou
pedagógico, valida os dados disponíveis, cria ou atualiza casos no SAD-PE e
encaminha o acompanhamento ao M2.

O processo busca evitar classificação automática quando faltam dados,
prevenir alertas duplicados e minimizar a exposição de informações sensíveis.

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

## Fluxo geral representado

1. O processo recebe dados acadêmicos, cadastrais e socioeconômicos.
2. O SAD-PE valida a integridade e a consistência das informações.
3. Os dados insuficientes geram uma pendência cadastral.
4. Dados suficientes são usados para avaliar o perfil inicial de risco.
5. O sistema verifica se o estudante já possui um caso ativo.
6. Casos existentes recebem atualização de histórico, evitando alerta duplicado.
7. Novos casos recebem um ID único e são segregados por perfil de acesso.
8. O caso preventivo ou estruturado é enviado ao M2.
9. Os resultados do acompanhamento podem alimentar o M4 para análise e
   recalibração dos critérios.

## Entradas do processo

- Registro de notas e frequências pelos docentes;
- Solicitação presencial ou digital feita pelo estudante ou pela família;
- Dados socioeconômicos e históricos do Registro Acadêmico;
- Complementação cadastral;
- Encerramento de matrículas;
- Solicitação de conselho pela coordenação;
- Dados recebidos da base SISTEC/SIGAA.

## Tipos de saída

### Pendência cadastral

Ausência de dados não gera classificação automática de risco. O sistema registra
uma pendência cadastral para posterior complementação.

### Caso preventivo

O estudante recebe acolhimento preventivo e o M2 recebe um dossiê contendo o
ID do caso e a demanda registrada.

### Caso estruturado

O risco atingido gera um dossiê com indicadores, dados do caso e critérios
utilizados pela avaliação do ROD.

### Caso espontâneo

Uma demanda apresentada pelo estudante ou pela família é vinculada ao cadastro
único e verifica-se a existência de caso ativo.

### Atualização de caso ativo

Quando o caso já existe, o histórico é atualizado sem criação de novo alerta
ou novo identificador.

## Papel dos professores

Os docentes registram notas e frequências no sistema acadêmico. O processo
prevê o envio de recomendações pedagógicas sem exposição de dados
socioeconômicos ou rótulos de risco.

Os professores podem receber alerta pedagógico da disciplina e registrar
ciência. Alertas consolidados da turma são analisados pela coordenação.

## Papel da coordenação

A coordenação acompanha os alertas consolidados e pode solicitar acionamento
do conselho no M2.

## Governança e critérios

O PDF relaciona os seguintes critérios ROD:

- média anual mínima de 6,0;
- frequência mínima de 75% para cursos integrados;
- monitoramento de indicadores;
- recalibração com validação e aprovação pelo M4.

Os critérios não devem ser tratados como permanentes. O M4 pode analisar
resultados, falsos positivos e eficácia das intervenções antes de propor novos
pesos ou parâmetros.

## Proteções de LGPD

O diagrama registra as seguintes salvaguardas:

- ausência de dados suficientes não gera uma classificação automática;
- docentes recebem apenas orientações acionáveis;
- dados socioeconômicos e rótulos não são exibidos aos docentes;
- casos ativos recebem um ID único;
- dados são segregados por perfil de acesso;
- a atualização não duplica casos ou alertas;
- menores devem ser protegidos conforme as regras do artigo 14 da LGPD.

As regras finais de acesso, retenção e compartilhamento devem ser validadas
pela área responsável e pelas políticas institucionais.

## Relação com outros módulos

- **M1 - Identificação de Risco:** valida dados e identifica ou atualiza casos.
- **M2 - Intervenção:** recebe o dossiê e assume a titularidade do caso.
- **M4 - Painel Analítico:** monitora os resultados e pode aprovar a
  recalibração dos critérios.
- **TI e Registro Acadêmico:** fornecem dados históricos e cadastrais.

## Pontos a confirmar

- nomenclatura correta do artefato: AS-IS ou TO-BE;
- fonte oficial dos dados acadêmicos;
- critérios completos utilizados no cálculo de risco;
- responsáveis pela correção de pendências cadastrais;
- regras de acesso por perfil;
- processo formal de recalibração pelo M4;
- integração definitiva entre os módulos M1, M2 e M4.
