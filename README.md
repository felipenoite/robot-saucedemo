# 🤖 Robot Framework - SauceDemo Tests

Automação de testes Web para o site [SauceDemo](https://www.saucedemo.com) utilizando **Robot Framework** + **SeleniumLibrary**.

---

## 📁 Estrutura do Projeto

```
robot-saucedemo/
├── tests/
│   ├── login_tests.robot         # Testes de login (CT001–CT006)
│   ├── checkout_tests.robot      # Testes de carrinho e checkout (CT007–CT013)
│   └── inventory_tests.robot     # Testes de produtos e ordenação (CT014–CT018)
├── resources/
│   ├── keywords/
│   │   └── keywords.robot        # Keywords reutilizáveis
│   ├── locators/
│   │   └── locators.robot        # Mapeamento de elementos da UI
│   └── variables/
│       └── variables.robot       # Variáveis globais do projeto
├── reports/                      # Relatórios gerados após execução
├── requirements.txt
└── README.md
```

---

## 🧪 Casos de Teste

| ID     | Módulo     | Descrição                                      | Tags                    |
|--------|------------|------------------------------------------------|-------------------------|
| CT001  | Login      | Login com credenciais válidas                  | smoke, regressao        |
| CT002  | Login      | Login com senha incorreta                      | negativo                |
| CT003  | Login      | Login com usuário incorreto                    | negativo                |
| CT004  | Login      | Login com usuário bloqueado                    | negativo                |
| CT005  | Login      | Login com campos em branco                     | negativo                |
| CT006  | Login      | Logout após login bem-sucedido                 | smoke                   |
| CT007  | Carrinho   | Adicionar produto ao carrinho                  | smoke                   |
| CT008  | Carrinho   | Adicionar múltiplos produtos                   | regressao               |
| CT009  | Carrinho   | Visualizar carrinho com produto adicionado     | regressao               |
| CT010  | Checkout   | Fluxo completo de compra (happy path)          | smoke, e2e              |
| CT011  | Checkout   | Checkout sem preencher dados obrigatórios      | negativo                |
| CT012  | Checkout   | Verificar valores no resumo do checkout        | regressao               |
| CT013  | Carrinho   | Continuar comprando após adicionar produto     | regressao               |
| CT014  | Inventário | Verificar listagem de produtos                 | smoke                   |
| CT015  | Inventário | Ordenar produtos por nome A-Z                  | regressao               |
| CT016  | Inventário | Ordenar produtos por nome Z-A                  | regressao               |
| CT017  | Inventário | Ordenar produtos por menor preço               | regressao               |
| CT018  | Inventário | Ordenar produtos por maior preço               | regressao               |

---

## ⚙️ Pré-requisitos

- Python 3.8+
- Google Chrome instalado
- ChromeDriver (gerenciado automaticamente pelo webdriver-manager)

---

## 🚀 Instalação

```bash
# Clone o repositório
git clone https://github.com/felipenoite/robot-saucedemo.git
cd robot-saucedemo

# Instale as dependências
pip install -r requirements.txt
```

---

## ▶️ Como Executar

```bash
# Executar todos os testes
robot -d reports tests/

# Executar apenas testes de login
robot -d reports tests/login_tests.robot

# Executar por tag (ex: somente smoke)
robot -d reports --include smoke tests/

# Executar por tag (ex: somente testes negativos)
robot -d reports --include negativo tests/

# Executar excluindo uma tag
robot -d reports --exclude negativo tests/
```

---

## 📊 Relatórios

Após a execução, os relatórios são gerados na pasta `reports/`:

- `report.html` — Relatório visual com resultado dos testes
- `log.html` — Log detalhado de cada passo executado
- `output.xml` — Saída em XML para integração com CI/CD

---

## 🏷️ Tags Disponíveis

| Tag        | Descrição                                      |
|------------|------------------------------------------------|
| `smoke`    | Testes críticos de verificação rápida          |
| `regressao`| Testes de regressão completos                  |
| `negativo` | Testes de fluxos negativos e erros esperados   |
| `e2e`      | Testes de ponta a ponta                        |
| `login`    | Testes relacionados ao módulo de login         |
| `carrinho` | Testes relacionados ao carrinho de compras     |
| `checkout` | Testes relacionados ao fluxo de checkout       |
| `inventario` | Testes relacionados à listagem de produtos   |

---

## 🛠️ Tecnologias

![Robot Framework](https://img.shields.io/badge/Robot_Framework-000000?style=for-the-badge&logo=robot-framework&logoColor=white)
![Selenium](https://img.shields.io/badge/Selenium-43B02A?style=for-the-badge&logo=selenium&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
