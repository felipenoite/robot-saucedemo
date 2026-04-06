*** Settings ***
Documentation       Testes para o fluxo de Carrinho e Checkout do SauceDemo
Resource            ../resources/keywords/keywords.robot

Test Setup          Run Keywords    Abrir Navegador    AND    Limpar Sessao    AND    Realizar Login Com Sucesso
Test Teardown       Fechar Navegador


*** Test Cases ***

CT007 - Adicionar produto ao carrinho
    [Documentation]    Verifica que um produto pode ser adicionado ao carrinho
    [Tags]    carrinho    smoke
    Adicionar Produto Ao Carrinho    ${BTN_ADD_BACKPACK}
    Verificar Badge Do Carrinho      1

CT008 - Adicionar múltiplos produtos ao carrinho
    [Documentation]    Verifica que múltiplos produtos podem ser adicionados
    [Tags]    carrinho    regressao
    Adicionar Produto Ao Carrinho    ${BTN_ADD_BACKPACK}
    Adicionar Produto Ao Carrinho    ${BTN_ADD_BIKE_LIGHT}
    Adicionar Produto Ao Carrinho    ${BTN_ADD_SHIRT}
    Verificar Badge Do Carrinho      3

CT009 - Visualizar carrinho com produto adicionado
    [Documentation]    Verifica que o produto aparece corretamente na página do carrinho
    [Tags]    carrinho    regressao
    Adicionar Produto Ao Carrinho    ${BTN_ADD_BACKPACK}
    Ir Para O Carrinho
    ${itens}=    Get Element Count    ${CART_ITEMS}
    Should Be Equal As Integers    ${itens}    1

CT010 - Fluxo completo de compra (happy path)
    [Documentation]    Realiza o fluxo completo: adicionar produto, checkout e confirmação
    [Tags]    checkout    smoke    e2e
    Adicionar Produto Ao Carrinho    ${BTN_ADD_BACKPACK}
    Ir Para O Carrinho
    Click Button        ${BTN_CHECKOUT}    ${TIMEOUT}
    Wait Until Element Is Visible    ${INPUT_FIRST_NAME}    ${TIMEOUT}
    Preencher Dados De Entrega      Felipe    Noite    12345-678
    Wait Until Element Is Visible    ${BTN_FINISH}    ${TIMEOUT}
    Finalizar Compra

CT011 - Checkout sem preencher dados obrigatórios
    [Documentation]    Verifica erro ao avançar no checkout sem preencher campos
    [Tags]    checkout    negativo
    Adicionar Produto Ao Carrinho    ${BTN_ADD_BACKPACK}
    Ir Para O Carrinho
    Click Button        ${BTN_CHECKOUT}
    Wait Until Element Is Visible    ${INPUT_FIRST_NAME}    ${TIMEOUT}
    Click Button        ${BTN_CONTINUE}
    Wait Until Element Is Visible    ${LBL_CHECKOUT_ERROR}    ${TIMEOUT}
    Element Should Be Visible        ${LBL_CHECKOUT_ERROR}

CT012 - Verificar valores na tela de resumo do checkout
    [Documentation]    Valida que o subtotal, taxa e total são exibidos na tela de resumo
    [Tags]    checkout    regressao
    Adicionar Produto Ao Carrinho    ${BTN_ADD_BACKPACK}
    Ir Para O Carrinho
    Click Button        ${BTN_CHECKOUT}
    Wait Until Element Is Visible    ${INPUT_FIRST_NAME}    ${TIMEOUT}
    Preencher Dados De Entrega      Felipe    Noite    12345-678
    Wait Until Element Is Visible    ${SUMMARY_SUBTOTAL}    ${TIMEOUT}
    Element Should Be Visible        ${SUMMARY_SUBTOTAL}
    Element Should Be Visible        ${SUMMARY_TAX}
    Element Should Be Visible        ${SUMMARY_TOTAL}

CT013 - Continuar comprando após adicionar produto ao carrinho
    [Documentation]    Verifica que o botão "Continue Shopping" retorna ao catálogo
    [Tags]    carrinho    regressao
    Adicionar Produto Ao Carrinho    ${BTN_ADD_BACKPACK}
    Ir Para O Carrinho
    Click Button        ${BTN_CONTINUE_SHOPPING}
    Wait Until Element Is Visible    ${TITLE_PRODUCTS}    ${TIMEOUT}
    Element Text Should Be    ${TITLE_PRODUCTS}    Products
