#!/usr/bin/env bash
# Inicializa o script e define que será interpretado pelo shell /bin/sh.

# Define o modo padrão de exibição como "normal".
FLASH_MODE=false

# Verifica se o primeiro argumento é "-f".
if [ "$1" = "-f" ]; then
  FLASH_MODE=true # Ativa o modo "flash" (exibição rápida sem efeito de digitação).
  shift           # Remove o primeiro argumento da lista para processar a pergunta.
fi

# Verifica se a quantidade de argumentos restantes é diferente de 1.
if [ "$#" -ne 1 ]; then
  echo "Uso: $0 [-f] 'Sua pergunta aqui'" # Instruções de uso.
  echo "       -f   Exibe resposta imediata (sem efeito de digitação)"
  exit 1 # Encerra o script com código de erro 1.
fi

# Define a chave de API para autenticação na requisição.
API_KEY="SEU_TOKEN"

# Armazena o argumento fornecido como a pergunta do usuário.
QUESTION="$1"

# Envia uma requisição POST à API e armazena a resposta na variável.
response=$(curl -s \  # Usa curl para fazer a requisição silenciosamente.
  -H "Content-Type: application/json" \  # Define o cabeçalho do tipo de conteúdo.
  -d "$(printf '{"contents":[{"parts":[{"text":%s}]}]}' "$(printf '%s' "$QUESTION" | jq -Rs .)")" \ # Formata a pergunta para o corpo JSON.
  -X POST "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=$API_KEY") # URL da API com a chave de acesso.

# Extrai o conteúdo da resposta JSON retornado pela API.
content=$(echo "$response" | jq -r '.candidates[0].content.parts[0].text')

# Verifica o modo de exibição selecionado.
if [ "$FLASH_MODE" = true ]; then
  printf "%s\n" "$content" # Exibe o texto completo de uma vez (modo flash).
else
  # Itera sobre os caracteres do texto extraído.
  for (( i=0; i<${#content}; i++ )); do
    printf "%s" "${content:i:1}" # Exibe um caractere por vez.
    sleep 0.05 # Aguarda 0.05 segundos antes de exibir o próximo caractere.
  done
  printf "\n" # Adiciona uma nova linha ao final.
fi
