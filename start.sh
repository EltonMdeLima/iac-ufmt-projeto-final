#!/bin/bash

set -e

echo ""
echo "🚀 Inicializador do Projeto DEVELOPER"
echo "Escolha como deseja subir a aplicação:"
echo ""
echo "1 - Subir com Docker Compose"
echo "2 - Subir com Terraform"
echo "3 - Subir com Docker run direto (modo rápido)"
echo "4 - Subir tudo (Compose + Terraform)"
echo "0 - Cancelar"
echo ""

read -p "Digite a opção desejada: " opcao

case $opcao in
  1)
    echo "🐳 Subindo com Docker Compose..."
    cd infra/docker || exit 1
    docker-compose up --build -d
    ;;
  2)
    echo "📦 Subindo com Terraform..."
    cd infra/terraform-local || exit 1
    terraform init
    terraform apply -auto-approve
    ;;
  3)
    echo "🔧 Subindo com Docker run direto..."
    docker run -d --name web_nginx -p 8080:80 \
      -v "$(pwd)/site:/usr/share/nginx/html" \
      -v "$(pwd)/infra/ansible/nginx.conf:/etc/nginx/conf.d/default.conf" \
      nginx:alpine
    ;;
  4)
    echo "🚀 Subindo tudo: Docker Compose + Terraform..."
    cd infra/docker || exit 1
    docker-compose up --build -d
    cd ../terraform-local || exit 1
    terraform init
    terraform apply -auto-approve
    ;;
  0)
    echo "❌ Operação cancelada pelo usuário."
    exit 0
    ;;
  *)
    echo "❗ Opção inválida. Tente novamente."
    exit 1
    ;;
esac

echo ""
echo "✅ Aplicação iniciada!"
echo "🌐 Acesse em: http://localhost:8080"
