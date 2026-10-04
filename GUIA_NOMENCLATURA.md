# Guia de Nomenclatura e Versionamento
 
## 1. Objetivo
 
Este guia estabelece o padrão para nomear e versionar os arquivos do projeto MVP SAD, garantindo organização, rastreabilidade e facilidade de localização.
 
## 2. Estrutura do nome do arquivo
 
Os arquivos deverão seguir, preferencialmente, o seguinte formato:
 
Modulo_TipoDocumento_Descricao_Versao.extensao
 
## 3. Exemplos
 
### Processo BPMN
 
M1_BPMN_TO-BE_v1.0.pdf
 
### Modelo Entidade-Relacionamento
 
M1_Modelo_ER_Logico_v1.0.pdf
 
### Contrato de interface
 
Contrato_M1_M2_v2.0.json
 
### Modelo de decisão
 
M1_Modelo_Decisao_Aprovacao_v1.0.dmn
 
### Protótipo
 
M1_Prototipo_Dashboard_v1.0.png
 
### Documentação final
 
MVP_SAD_Relatorio_Final_v1.0.pdf
 
## 4. Regras para os nomes
 
1. Não utilizar espaços;
2. Não utilizar acentos;
3. Não utilizar caracteres especiais;
4. Utilizar o caractere sublinhado para separar as informações;
5. Manter nomes curtos e objetivos;
6. Informar o módulo relacionado ao documento;
7. Incluir a versão no final do nome;
8. Preservar a extensão original do arquivo.
 
## 5. Identificação dos módulos
 
- M1: Módulo 1;
- M2: Módulo 2;
- M3: Módulo 3;
- M4: Módulo 4;
- GERAL: Documento aplicável a todos os módulos.
 
## 6. Regras de versionamento
 
O padrão de versão será:
 
vX.Y
 
Onde:
 
- X representa uma alteração principal;
- Y representa uma alteração secundária.
 
### Alteração secundária
 
Utilizar quando ocorrer:
 
- Correção de texto;
- Ajuste visual;
- Inclusão de observação;
- Pequeno ajuste sem mudança estrutural.
 
Exemplo:
 
v1.0 → v1.1 → v1.2
 
### Alteração principal
 
Utilizar quando ocorrer:
 
- Mudança de processo;
- Alteração de estrutura;
- Mudança de regra de negócio;
- Revisão aprovada que substitui a versão anterior;
- Alteração significativa de escopo.
 
Exemplo:
 
v1.2 → v2.0
 
## 7. Status dos documentos
 
Quando necessário, o status poderá ser incluído antes da versão.
 
Exemplos:
 
M1_BPMN_TO-BE_RASCUNHO_v0.1.pdf
 
M1_BPMN_TO-BE_EM-VALIDACAO_v0.5.pdf
 
M1_BPMN_TO-BE_APROVADO_v1.0.pdf
 
## 8. Ciclo sugerido
 
- v0.1 a v0.9: documento em elaboração;
- v1.0: primeira versão aprovada;
- v1.1 a v1.9: ajustes secundários;
- v2.0: nova versão com alterações significativas.
 
## 9. Regras adicionais
 
- Não utilizar nomes como "final", "final2" ou "agora_final";
- Não apagar versões aprovadas sem autorização;
- Registrar alterações importantes no histórico do projeto;
- Verificar o nome e a versão antes de carregar o arquivo;
- Utilizar mensagens de commit claras e objetivas.
