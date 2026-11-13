# M3 – Critérios de Priorização de Estudantes

**Projeto:** SAD-PE
**Autoria:** Renan Felipe Barbosa Matos · **Versão:** 1.0 · **Data:** 27/10/2026

---

## 1. Objetivo

No processo atual (AS-IS), a equipe consegue acompanhar poucos estudantes por semana e não tem um critério claro para ordenar os casos (E13, gargalo M3). Este documento define **como o M3 ordena os estudantes que precisam de apoio**: critérios, pesos, faixas de nota e regras.

A fila é uma **recomendação**. A decisão final é sempre da equipe pedagógica.

## 2. Princípios

- O resultado descreve uma **situação momentânea**, nunca um rótulo do estudante. Nas telas: "estudante que precisa de apoio".
- Todos os critérios são **explicáveis**: para cada estudante, o sistema mostra quais critérios pesaram e por quê.
- Pesos, faixas e limites são **parametrizáveis**, pois as regras acadêmicas podem mudar com o ROD.
- Os pesos foram definidos pelos Validadores (Emelyn e Renan).

## 3. Ordem de prioridade

| #   | Critério                           | Papel                                                                                    |
| --- | ---------------------------------- | ---------------------------------------------------------------------------------------- |
| 1   | Frequência                         | Principal gatilho: sem presença, nenhuma intervenção funciona                            |
| 2   | Gravidade acadêmica                | Tamanho do problema atual                                                                |
| 3   | Intervenções anteriores sem efeito | Indica caso mais complexo                                                                |
| 4   | Vulnerabilidade                    | Peso extra: menor rede de apoio                                                          |
| 5   | Histórico                          | Repetência; também desempata                                                             |
| 6   | Momento do ano                     | Contexto de urgência: define o nível de urgência, não altera o score nem a ordem da fila |

## 4. Cálculo do score

Cada critério gera uma **nota de 0 a 100** (faixas em 4.2). Os cinco primeiros entram numa soma ponderada. O momento do ano não entra na conta: ele define o nível de urgência (4.3).

```
Score = 0,30·Freq + 0,25·Grav + 0,20·IntAnt + 0,15·Vuln + 0,10·Hist
```

### 4.1 Pesos

| Critério                           | Peso     | Peso sem registro de intervenções |
| ---------------------------------- | -------- | --------------------------------- |
| Frequência                         | **30%**  | 37,5%                             |
| Gravidade acadêmica                | **25%**  | 31,25%                            |
| Intervenções anteriores sem efeito | **20%**  | inativo                           |
| Vulnerabilidade                    | **15%**  | 18,75%                            |
| Histórico                          | **10%**  | 12,5%                             |
| **Total**                          | **100%** | **100%**                          |

**Regra de dado ausente.** Hoje a base não tem registro de atendimentos. Enquanto não houver, o critério "Intervenções anteriores" fica **inativo** e os demais pesos são redistribuídos na mesma proporção (coluna da direita), para que o score continue indo de 0 a 100 e os limites de urgência de 4.3 sigam válidos. Quando o registro existir, os pesos da coluna do meio passam a valer.

### 4.2 Notas por critério

**Frequência** (`frequencia_pct` parcial; o mínimo é 75%; quanto mais perto, mais urgente)

| Frequência parcial | Nota |
| ------------------ | ---- |
| ≥ 90%              | 0    |
| 85% a 89,9%        | 30   |
| 80% a 84,9%        | 60   |
| < 80%              | 100  |

**Gravidade acadêmica** (nº de disciplinas abaixo de 6,0 nos bimestres já lançados)

| Situação           | Nota |
| ------------------ | ---- |
| Nenhuma disciplina | 0    |
| 1 disciplina       | 25   |
| 2 disciplinas      | 50   |
| 3 a 4 disciplinas  | 75   |
| 5 ou mais          | 100  |

Ajuste: somar **+15** (limitado a 100) se uma das disciplinas abaixo de 6,0 for de exatas (`peso_exatas`, como Matemática e Física). O E13 mostra retenção de 39% na 1ª série entre quem tem média < 6,0 nessas disciplinas, contra 12% nos demais.

**Intervenções anteriores sem efeito** (exige registro de atendimentos; hoje inativo)

| Situação                     | Nota |
| ---------------------------- | ---- |
| Nenhuma intervenção anterior | 0    |
| 1 intervenção sem melhora    | 60   |
| 2 ou mais sem melhora        | 100  |

**Vulnerabilidade** (indicadores da Ficha 2: `recebe_auxilio_estudantil` e distância do campus; conta-se quantos estão presentes)

| Situação         | Nota |
| ---------------- | ---- |
| Nenhum indicador | 0    |
| 1 indicador      | 50   |
| 2 indicadores    | 100  |

A distância conta como indicador presente quando supera um limite parametrizável, definido pelo grupo de dados.

**Histórico** (`total_retencoes` e `vez_na_serie`)

| Situação                                          | Nota |
| ------------------------------------------------- | ---- |
| Repetente na série atual ou com retenção anterior | 100  |
| Sem retenção anterior                             | 0    |

### 4.3 Momento do ano (nível de urgência)

Quanto mais tarde no ano letivo, menor a chance de recuperação. Como todos os estudantes estão no mesmo bimestre, o momento do ano **não muda a ordem da fila**: ele muda o **nível de urgência** atribuído a cada score. O mesmo score que pede atenção em março pode ser urgência crítica em novembro.

| Bimestre atual | Urgência alta a partir de | Urgência crítica a partir de |
| -------------- | ------------------------- | ---------------------------- |
| 1º             | 50                        | 75                           |
| 2º             | 45                        | 65                           |
| 3º             | 40                        | 55                           |
| 4º             | 35                        | 50                           |

Abaixo do limite de urgência alta, o nível é "atenção". O sistema também mostra quantos estudantes estão em cada nível.

## 5. Regras complementares

**Gatilho de frequência.** Estudante com frequência parcial **< 80%** entra na faixa de topo da fila, independentemente do restante do score. Dentro da faixa de topo, a ordem segue o score.

**Desempate.** Com scores iguais, vale: (1) menor frequência, (2) mais disciplinas abaixo de 6,0, (3) repetente na série atual.

## 6. Exemplo

Estudante X, 3º bimestre: frequência 78%, 3 disciplinas abaixo de 6,0 (sem exatas), 1 indicador de vulnerabilidade, sem retenção anterior. Sem registro de intervenções, usam-se os pesos da coluna da direita.

| Critério        | Nota | Peso   | Contribuição |
| --------------- | ---- | ------ | ------------ |
| Frequência      | 100  | 0,375  | 37,50        |
| Gravidade       | 75   | 0,3125 | 23,44        |
| Vulnerabilidade | 50   | 0,1875 | 9,38         |
| Histórico       | 0    | 0,125  | 0,00         |
| **Score**       |      |        | **70,31**    |

No 3º bimestre, 70,31 supera o limite de urgência crítica (55). Como a frequência é < 80%, o estudante também entra na faixa de topo. No 1º bimestre, o mesmo score seria urgência alta (limite crítico de 75).

## 7. Capacidade e restrições das intervenções

As intervenções da Ficha 2 foram confimadas, mas **não há capacidade nem restrições definidas** para elas. Por isso:

- A fila é **completa**, ordenada pelo score e agrupada por urgência, sem corte automático. A equipe decide quantos estudantes atende por semana.
- Capacidade (vagas por semana ou por turma) e restrições (horário, turno, transporte) ficam como **parâmetros vazios**. Quando forem preenchidos, o sistema marca o corte da fila e filtra as intervenções compatíveis com cada estudante.
- Premissa: os requisitos de capacidade e de restrições do M3 só serão plenamente atendidos quando esses dados existirem.

## 8. Cuidados éticos e LGPD

A maioria dos estudantes é menor de idade (LGPD, art. 14): o tratamento deve atender ao melhor interesse deles. Usar renda ou distância para **priorizar apoio** é diferente de usá-las para **prever fracasso**. Salvaguardas adotadas para o critério de vulnerabilidade:

1. **Minimização.** Só dois indicadores entram (auxílio estudantil e distância). Nenhum outro dado socioeconômico é usado.
2. **Finalidade restrita.** O critério serve apenas para direcionar apoio. Ele só **soma** pontos: nunca reduz a prioridade de ninguém, e não é usado para prever retenção ou evasão nem para limitar oportunidades.
3. **Explicação sem estigma.** Na tela aparece apenas "contexto de apoio socioeconômico considerado", sem detalhar qual indicador nem valores. Nunca se usa o termo "estudante vulnerável".
4. **Quem vê o quê.** O detalhamento do fator é visível só à coordenação e ao setor pedagógico. O professor da disciplina vê a posição na fila e o nível de urgência, sem esse fator.
5. **Segurança.** Acesso restrito aos dados e registro de quem consultou cada informação.
6. **Retenção.** O histórico fica guardado apenas enquanto o estudante estiver no curso, salvo prazo diferente definido pela instituição.
7. **Decisão humana.** O sistema recomenda; a equipe decide e pode ajustar a fila.
