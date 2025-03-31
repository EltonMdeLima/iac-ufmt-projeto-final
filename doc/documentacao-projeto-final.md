# Projeto Final - Infraestrutura como Código (IaC)  
**Disciplina: Infraestrutura como Código - UFMT 2025**  
**Aluno: Elton**  
**Data de Entrega: 31/03/2025**

---

## 1. Descrição da Arquitetura da Aplicação

Este projeto tem como objetivo demonstrar a aplicação prática de Infraestrutura como Código (IaC), utilizando as ferramentas **Ansible**, **Docker**, **Docker Compose** e **Terraform** para provisionar localmente um servidor NGINX que hospeda um site estático.

A aplicação consiste em:

- Um container Docker rodando **NGINX**
- Um site estático responsivo servido via NGINX
- Provisionamento e configuração automatizados com **Ansible** (imperativo), **Docker Compose** e **Terraform** (declarativos)
- Scripts auxiliares para execução e parada do ambiente local
- Ambiente reprodutível com Nix (via `shell.nix`)

![Estrutura do Projeto](/doc/Fluxo-IaC.png)

---

## 2. Estrutura do Projeto

Abaixo está a estrutura completa dos diretórios e arquivos do projeto:

```
.
├── doc
│   └── documentacao-projeto-final.md
├── estrutura-projeto-DEVELOPER.txt
├── infra
│   ├── ansible
│   │   ├── inventory
│   │   ├── nginx.conf
│   │   └── playbook.yml
│   ├── docker
│   │   ├── default.conf
│   │   ├── docker-compose.yml
│   │   ├── Dockerfile
│   │   ├── nginx.conf
│   │   └── site
│   │       ├── css/
│   │       ├── fonts/
│   │       ├── img/
│   │       ├── js/
│   │       ├── index.html
│   │       └── LICENSE
│   └── terraform-local
│       ├── main.tf
│       └── versions.tf
├── site
│   ├── css/
│   ├── fonts/
│   ├── img/
│   ├── js/
│   ├── index.html
│   └── LICENSE
├── start.sh
├── stop.sh
├── shell.nix
└── README.md
```

---

## 3. Serviços e Tecnologias Utilizadas

| Tecnologia / Ferramenta | Papel no Projeto |
|-------------------------|------------------|
| **Docker**              | Criação de containers de forma padronizada |
| **Docker Compose**      | Orquestração dos containers e seus volumes e redes |
| **Terraform (Provider Docker)** | Provisionamento declarativo de container e volume Docker local |
| **NGINX**               | Servidor web para o site estático |
| **Ansible**             | Provisionamento imperativo e execução automatizada |
| **Shell Script**        | Automatiza execução com `start.sh` e `stop.sh` |
| **Nix**                 | Garante ambiente reprodutível com `shell.nix` |
| **GitHub**              | Versionamento e disponibilização do projeto |
| **draw.io**             | Criação do diagrama da arquitetura |

---

## 4. Diagrama da Arquitetura

> Diagrama elaborado com [draw.io](https://draw.io)

![Diagrama da Arquitetura](./img/diagrama-arquitetura.png)

- Navegador local faz requisição para `localhost:8080`
- Ansible executa `docker-compose` ou Terraform e sobe container com NGINX
- NGINX responde com arquivos estáticos do site dentro do container

---

## 5. Justificativas das Escolhas Tecnológicas

| Tecnologia | Justificativa |
|------------|---------------|
| **Docker** | Permite ambiente portável, reproduzível e isolado |
| **Docker Compose** | Facilita execução e configuração de serviços |
| **Terraform (Docker Provider)** | Demonstra aplicação declarativa de IaC localmente, sem depender de nuvem |
| **Ansible** | Automatiza o provisionamento sem necessidade de agentes |
| **NGINX** | Servidor estático leve, ideal para sites responsivos |
| **Nix** | Proporciona ambiente imutável e reprodutível |
| **Execução local** | Evita custo de nuvem e demonstra compreensão dos conceitos de IaC |

---

## 6. Execução do Projeto (Passo a Passo)

### 6.1. Ativar ambiente com Nix

```bash
nix-shell
```

### 6.2. Subir a infraestrutura (interativamente)

```bash
./start.sh
```

Escolha uma das opções:
- `1` - Docker Compose
- `2` - Terraform
- `3` - Docker run direto
- `4` - Subir tudo

### 6.3. Parar a infraestrutura

```bash
./stop.sh
```

Escolha uma das opções:
- `1` - Docker Compose
- `2` - Terraform
- `3` - Docker run direto
- `4` - Finalizar tudo

### 6.4. Acessar o site

Abra o navegador em:
```
http://localhost:8080
```

---

## 7. Resultados Obtidos

- Site estático responsivo carregando corretamente no container NGINX
- Provisionamento totalmente automatizado via Ansible e/ou Terraform
- Scripts de execução funcionais para reprodução local do ambiente
- Projeto versionado no GitHub com README explicativo

---

## 8. Conclusão

O projeto demonstra de forma objetiva a aplicação dos conceitos de Infraestrutura como Código. A escolha por execução local mostrou-se eficiente e suficiente para a complexidade exigida na disciplina. Com Ansible, Docker, Terraform, Nix e scripts de automação, foi possível montar um ambiente funcional, versionado e documentado, apto para entrega e apresentação.

---

## 9. Repositório do Projeto

> [https://github.com/usuario/repositorio-iac](https://github.com/usuario/repositorio-iac)

