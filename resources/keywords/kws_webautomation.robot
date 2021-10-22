*** Settings ***
Documentation        Aqui estarão presentes todas as keywords dos testes Web.

Library             SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${URL}            http://automationpractice.com/index.php

*** Keywords ***
Abrir navegador
    Open Browser           browser=${BROWSER}
    Maximize Browser Window

Fechar navegador
    Capture Page Screenshot
    Close Browser

Acessar a página home do site Automation Practice
    Go To                               ${URL}
    Title Should Be                     My Store
    Wait Until Element Is Visible       xpath=//*[@id="block_top_menu"]/ul

# CN-01
# Sessão de Keywords - Pesquisar produto existente
Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    ${check_element}=  Run Keyword and Return Status     Wait Until Page Contains Element      id=search_block_top        10s
    Run Keyword If      '${check_element}' == 'True'     Input Text                            id=search_query_top        ${PRODUTO}

Clicar no botão pesquisar
    Click Element                       name=submit_search

Conferir se o produto "${PRODUTO}" foi listado no site
    Page Should Contain Image           xpath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']
    Title Should Be                     Search - My Store

# CN-02
# Sessão de Keywords - Caso de Teste 02: Pesquisar produto não existente
Conferir se a mensagem "No results were found for your search "itemNãoExistente""
    ${check_element}=  Run Keyword and Return Status   Wait Until Page Contains Element     id=center_column    10s
    Run Keyword If      '${check_element}' == 'True'   Wait Until Element Is Visible        xpath=//*[@id='center_column']//*[@class='alert alert-warning']

# CN-03
# Sessão de Keywords - Caso de teste 03: Listar Produtos
Passar o mouse por cima da categoria "Woman" no menu principal superior de categorias
    Mouse Over          xpath=//*[@id='block_top_menu']//*[@href="http://automationpractice.com/index.php?id_category=3&controller=category"]

Clicar na sub categoria "Summer Dresses"
    Click Element       xpath=//*[@id='block_top_menu']//*[@href="http://automationpractice.com/index.php?id_category=11&controller=category"]

Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página
    ${check_element}=  Run Keyword and Return Status     Wait Until Page Contains Element    id=account-creation_form    10s
    Run Keyword If      '${check_element}' == 'True'     Title Should Be     Summer Dresses - My Store

# CN-04
# Sessão de Keywords - Caso de teste 04: Adicionar Cliente
Clicar em "Sign in"
    Click Element       xpath=//*[@class='nav']//*[@class='login']

informar um e-mail válido
    Wait until Element is Visible       id=create-account_form
    Input Text                          id=email_create         johnmayerContinuum2008@fender.com

Clicar em "Create an account"
    Click Button                        id=SubmitCreate
Preencher os dados obrigatórios

    ${check_element}=  Run Keyword and Return Status   Wait Until Page Contains Element    id=account-creation_form    10s
    Run Keyword If      '${check_element}' == 'True'     Click Element  id=id_gender1

    Input Text          xpath=//*[@id='customer_firstname']     John
    Input Text          xpath=//*[@id='customer_lastname']      Mayer
    Input Text          xpath=//*[@id='passwd']                 0o9i8u7y
    Click Element       id=days
    Click Element       xpath=//option[contains(text(), '16')]
    Click Element       id=months
    Click Element       xpath=//option[contains(text(), 'October')]
    Click Element       id=years
    Click Element       xpath=//option[contains(text(), '1977')]
    Click Element       id=newsletter
    Click Element       id=optin
    Input Text          id=company          Prime Control
    Input Text          id=address1         100 Congress Ave, Austin, TX 78701
    Input Text          id=address2         12396 Grant St, Thornton, CO 80241, Estados Unidos
    Input Text          id=city             Estados Unidos
    Click Element       id=id_state
    Click Element       xpath=//option[contains(text(), 'Washington')]
    Input Text          id=postcode         80241
    Input Text          id=other            born October 16, 1977, Bridgeport, Connecticut, U.S.
    Input Text          id=phone            +12125650000
    Input Text          id=phone_mobile     (808) 266-1222
    Input TExt          id=alias            Nova Iorque, Nova York, EUA

Submeter cadastro
    Click Button                        id=submitAccount

Conferir se o cadastro foi efetuado com sucesso
    ${check_element}=  Run Keyword and Return Status     Wait Until Page Contains Element        xpath=//div[@class='header_user_info']  10s
    Run Keyword If      '${check_element}' == 'True'     Wait Until Element Is Visible           xpath=//div[@class='header_user_info']

    ${USER}             Get Text        xpath=//div[@class='header_user_info']//span[contains(text(),'John Mayer')]

    ${check_element}=  Run Keyword and Return Status     Wait Until Page Contains Element    xpath=//div[@class='header_user_info']    10s
    Run Keyword If      '${check_element}' == 'True'     Should Be Equal                     John Mayer                                ${USER}
