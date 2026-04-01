*** Settings ***
Documentation       Testes para a listagem e ordenação de produtos do SauceDemo
Resource            ../resources/keywords/keywords.robot


Test Setup          Run Keywords    Abrir Navegador    AND    Limpar Sessao    AND    Realizar Login Com Sucesso
Test Teardown       Fechar Navegador

*** Test Cases ***

CT014 - Verificar listagem de produtos na página inicial
    [Documentation]    Valida que a página de produtos exibe os itens corretamente
    [Tags]    inventario    smoke
    Element Text Should Be    ${TITLE_PRODUCTS}    Products
    ${qtd_produtos}=    Get Element Count    ${ITEM_CONTAINER}
    Should Be Equal As Integers    ${qtd_produtos}    6

CT015 - Ordenar produtos por nome (A-Z)
    [Documentation]    Verifica ordenação de produtos por nome A-Z
    [Tags]    inventario    regressao
    Select From List By Value    ${SORT_DROPDOWN}    az
    ${primeiro}=    Get Text    css=.inventory_item_name:first-of-type
    Should Be Equal    ${primeiro}    Sauce Labs Backpack

CT016 - Ordenar produtos por nome (Z-A)
    [Documentation]    Verifica ordenação de produtos por nome Z-A
    [Tags]    inventario    regressao
    Select From List By Value    ${SORT_DROPDOWN}    za
    ${primeiro}=    Get Text    css=.inventory_item_name:first-of-type
    Should Be Equal    ${primeiro}    Test.allTheThings() T-Shirt (Red)

CT017 - Ordenar produtos por menor preço
    [Documentation]    Verifica ordenação de produtos por preço crescente
    [Tags]    inventario    regressao
    Select From List By Value    ${SORT_DROPDOWN}    lohi
    ${primeiro}=    Get Text    css=.inventory_item_name:first-of-type
    Should Be Equal    ${primeiro}    Sauce Labs Onesie

CT018 - Ordenar produtos por maior preço
    [Documentation]    Verifica ordenação de produtos por preço decrescente
    [Tags]    inventario    regressao
    Select From List By Value    ${SORT_DROPDOWN}    hilo
    ${primeiro}=    Get Text    css=.inventory_item_name:first-of-type
    Should Be Equal    ${primeiro}    Sauce Labs Fleece Jacket
