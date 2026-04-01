*** Settings ***
Library             SeleniumLibrary
Resource            ../variables/variables.robot
Resource            ../locators/locators.robot

*** Keywords ***
# ─── SETUP / TEARDOWN ───────────────────────────────────────────────

Abrir Navegador
    [Documentation]    Abre o navegador e acessa a página de login do SauceDemo
    Open Browser        ${BASE_URL}    chrome
    ...    options=add_argument("--headless");add_argument("--no-sandbox");add_argument("--disable-dev-shm-usage");add_argument("--disable-background-networking")
    Maximize Browser Window
    Set Selenium Implicit Wait    ${IMPLICIT_WAIT}

Fechar Navegador
    [Documentation]    Fecha o navegador ao final do teste
    Close Browser

# ─── SESSÃO ─────────────────────────────────────────────────────────

Limpar Sessao
    [Documentation]    Limpa o localStorage para destruir a sessão ativa
    Execute Javascript              window.localStorage.clear()
    Go To                           ${BASE_URL}
    Wait Until Element Is Visible   ${BTN_LOGIN}    ${TIMEOUT}

# ─── LOGIN ──────────────────────────────────────────────────────────

Realizar Login
    [Documentation]    Realiza login com usuário e senha fornecidos
    [Arguments]    ${username}    ${password}
    Input Text          ${INPUT_USERNAME}    ${username}
    Input Text          ${INPUT_PASSWORD}    ${password}
    Click Button        ${BTN_LOGIN}

Realizar Login Com Sucesso
    [Documentation]    Login com credenciais válidas e valida redirecionamento
    Realizar Login      ${VALID_USER}    ${VALID_PASSWORD}
    Wait Until Element Is Visible    ${TITLE_PRODUCTS}    ${TIMEOUT}
    Element Text Should Be    ${TITLE_PRODUCTS}    Products

Fazer Logout
    [Documentation]    Realiza logout limpando a sessão via JavaScript
    Execute Javascript    window.localStorage.clear()
    Go To                 ${BASE_URL}
    Wait Until Element Is Visible    ${BTN_LOGIN}    ${TIMEOUT}

# ─── CARRINHO ───────────────────────────────────────────────────────

Adicionar Produto Ao Carrinho
    [Documentation]    Adiciona um produto ao carrinho pelo botão fornecido
    [Arguments]    ${btn_locator}
    Click Button        ${btn_locator}

Verificar Badge Do Carrinho
    [Documentation]    Verifica se o número no badge do carrinho está correto
    [Arguments]    ${quantidade_esperada}
    Wait Until Element Is Visible    ${CART_BADGE}    ${TIMEOUT}
    Element Text Should Be           ${CART_BADGE}    ${quantidade_esperada}

Ir Para O Carrinho
    [Documentation]    Navega para a página do carrinho via URL direta
    Go To                            ${BASE_URL}/cart.html
    Wait Until Element Is Visible    ${BTN_CHECKOUT}    ${TIMEOUT}

# ─── CHECKOUT ───────────────────────────────────────────────────────

Preencher Dados De Entrega
    [Documentation]    Preenche os dados pessoais no checkout
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Input Text          ${INPUT_FIRST_NAME}    ${first_name}
    Input Text          ${INPUT_LAST_NAME}     ${last_name}
    Input Text          ${INPUT_POSTAL_CODE}   ${postal_code}
    Click Button        ${BTN_CONTINUE}

Finalizar Compra
    [Documentation]    Clica em Finish e valida a tela de confirmação
    Click Button        ${BTN_FINISH}
    Wait Until Element Is Visible    ${TITLE_COMPLETE}    ${TIMEOUT}
    Element Text Should Be    ${TITLE_COMPLETE}    Thank you for your order!
