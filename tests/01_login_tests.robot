*** Settings ***
Documentation       Testes para o fluxo de Login do SauceDemo
Resource            ../resources/keywords/keywords.robot


Test Setup          Run Keywords    Abrir Navegador    AND    Limpar Sessao
Test Teardown       Fechar Navegador

*** Test Cases ***

CT001 - Login com credenciais válidas
    [Documentation]    Verifica que um usuário válido consegue acessar a plataforma
    [Tags]    login    smoke    regressao
    Realizar Login Com Sucesso

CT002 - Login com senha incorreta
    [Documentation]    Verifica mensagem de erro ao usar senha inválida
    [Tags]    login    negativo
    Realizar Login      ${VALID_USER}    ${INVALID_PASSWORD}
    Wait Until Element Is Visible    ${LBL_ERROR}    ${TIMEOUT}
    Element Text Should Be    ${LBL_ERROR}    ${MSG_LOGIN_ERROR}

CT003 - Login com usuário incorreto
    [Documentation]    Verifica mensagem de erro ao usar usuário inválido
    [Tags]    login    negativo
    Realizar Login      ${INVALID_USER}    ${VALID_PASSWORD}
    Wait Until Element Is Visible    ${LBL_ERROR}    ${TIMEOUT}
    Element Text Should Be    ${LBL_ERROR}    ${MSG_LOGIN_ERROR}

CT004 - Login com usuário bloqueado
    [Documentation]    Verifica mensagem específica para usuário bloqueado
    [Tags]    login    negativo
    Realizar Login      ${LOCKED_USER}    ${VALID_PASSWORD}
    Wait Until Element Is Visible    ${LBL_ERROR}    ${TIMEOUT}
    Element Text Should Be    ${LBL_ERROR}    ${MSG_LOCKED_ERROR}

CT005 - Login com campos em branco
    [Documentation]    Verifica comportamento ao submeter formulário vazio
    [Tags]    login    negativo
    Click Button        ${BTN_LOGIN}
    Wait Until Element Is Visible    ${LBL_ERROR}    ${TIMEOUT}
    Element Should Be Visible    ${LBL_ERROR}

CT006 - Logout após login bem-sucedido
    [Documentation]    Verifica que o usuário consegue realizar logout corretamente
    [Tags]    login    smoke
    Realizar Login Com Sucesso
    Fazer Logout
    Wait Until Element Is Visible    ${BTN_LOGIN}    ${TIMEOUT}
    Element Should Be Visible    ${BTN_LOGIN}
