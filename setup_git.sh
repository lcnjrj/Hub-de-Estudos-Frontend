#!/bin/bash

echo "=== Criando repositório Git ==="
read -p "Nome do commit inicial: " CM
read -p "URL SSH do repositório (ex: git@github.com:usuario/repo.git): " URL
read -p "Caminho da chave SSH (ex: ~/.ssh/id_rsa): " KEY

echo
echo "[1] Inicializando repositório..."
git init

echo
echo "[2] Adicionando arquivos..."
git add .

echo
echo "[3] Criando commit..."
git commit -m "$CM"

echo
echo "[4] Adicionando remoto..."
git remote add origin "$URL"
git remote -v

echo
echo "[5] Iniciando ssh-agent..."
eval "$(ssh-agent -s)"

echo
echo "[6] Adicionando chave ao agente..."
ssh-add "$KEY"

echo
echo "[7] Testando conexão com GitHub..."
ssh -T git@github.com

echo
echo "🎉 Pronto! Repositório configurado."
