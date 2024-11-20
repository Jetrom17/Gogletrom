# Gogletrom

Gogletrom é uma inteligência artificial desenvolvida em Shell Bash, que utiliza a API de linguagem natural Google Gemini para gerar respostas com base em perguntas fornecidas pelo usuário. O script suporta dois modos de exibição: um com efeito de digitação (padrão) e outro com respostas rápidas (-f).

## Funcionalidades

- Envia perguntas para a API Google Gemini  
- Exibe respostas de forma dinâmica (efeito de digitação) ou instantaneamente  
- Implementado inteiramente em Shell Bash  

---

## Instalação e Dependências

Para executar o Gogletrom, você precisará das seguintes dependências instaladas no Linux:

### 1. Curl
O `curl` é necessário para enviar requisições HTTP para a API.

#### Instalação
`sudo apt install curl`     # Para sistemas baseados em Debian ou Ubuntu  
`sudo yum install curl`     # Para sistemas baseados em Red Hat ou CentOS  

### 2. jq
O `jq` é necessário para manipular e extrair dados de respostas JSON.

#### Instalação
`sudo apt install jq`       # Para sistemas baseados em Debian ou Ubuntu  
`sudo yum install jq `      # Para sistemas baseados em Red Hat ou CentOS  

### 3. Chave de API do Google Gemini
Você precisará de uma chave válida da API Google Gemini  
- Gere a chave no Google Cloud Console e habilite a API de linguagem correspondente  
- Substitua a variável `API_KEY` no script pela sua chave válida  

### 4. Permissões de execução
Garanta que o script tenha permissões para ser executado  
`chmod +x gogletrom.sh`

---

## Como usar

### 1. Clonar ou criar o script
Salve o código do Gogletrom em um arquivo chamado gogletrom.sh

### 2. Executar o script
./gogletrom.sh [-f] Sua pergunta aqui  

### Parâmetros
- [-f] (opcional) Ativa o modo de exibição rápida (respostas instantâneas)  
- Sua pergunta aqui: A pergunta que você deseja fazer à inteligência artificial  

### Exemplo
Modo padrão (com efeito de digitação)  
./gogletrom.sh Qual é a capital da França  

Modo rápido  
./gogletrom.sh -f Qual é a capital da França  

---

## Observação

- A API_KEY fornecida no script deve ser substituída por uma chave válida da API [Google Gemini](aistudio.google.com/apikey)
- Verifique se todas as dependências foram instaladas corretamente antes de usar o script  

---

## Licença

Este projeto é distribuído como código aberto e pode ser modificado para atender às suas necessidades. Sinta-se à vontade para contribuir com melhorias.
