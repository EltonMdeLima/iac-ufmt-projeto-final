#!/bin/bash

echo ""
echo "🛑 Finalizador do Projeto DEVELOPER"
echo "Escolha como deseja parar a aplicação:"
echo ""
echo "1 - Parar com Docker Compose"
echo "2 - Parar com Terraform"
echo "3 - Parar container Docker direto (web_nginx)"
echo "4 - Finalizar tudo (Compose + Terraform + container direto)"
echo "0 - Cancelar"
echo ""

read -p "Digite a opção desejada: " opcao

case $opcao in
  1)
    echo "🐳 Parando containers via Docker Compose..."
    cd infra/docker || exit 1
    docker-compose down
    ;;
  2)
    echo "📦 Destruindo infraestrutura via Terraform..."
    cd infra/terraform-local || exit 1
    terraform destroy -auto-approve
    ;;
  3)
    if docker ps --format '{{.Names}}' | grep -q web_nginx; then
      echo "🧹 Parando e removendo container web_nginx..."
      docker stop web_nginx
      docker rm web_nginx
    else
      echo "ℹ️ Nenhum container chamado 'web_nginx' está rodando."
    fi
    ;;
  4)
    echo "🔁 Finalizando tudo..."

    echo "➡️ Parando Docker Compose..."
    cd infra/docker && docker-compose down || echo "⚠️ Falha no Docker Compose"

    echo "➡️ Destruindo infraestrutura Terraform..."
    cd ../terraform-local && terraform destroy -auto-approve || echo "⚠️ Falha no Terraform"

    echo "➡️ Parando container direto (web_nginx)..."
    if docker ps --format '{{.Names}}' | grep -q web_nginx; then
      docker stop web_nginx && docker rm web_nginx
    else
      echo "ℹ️ Nenhum container web_nginx ativo."
    fi
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
echo "✅ Aplicação finalizada!"
