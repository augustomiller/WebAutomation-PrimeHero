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

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text                          id=search_query_top           ${PRODUTO} 

Clicar no botão pesquisar
    Click Element                       name=submit_search

Conferir se o produto "${PRODUTO}" foi listado no site
    Page Should Contain Image           xpath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']
    Title Should Be                     Search - My Store

# CN-02
# Sessão de Keywords - Caso de Teste 02: Pesquisar produto não existente

Conferir se a mensagem "No results were found for your search "itemNãoExistente""
    Wait Until Element Is Visible       xpath=//*[@id='center_column']//*[@class='alert alert-warning']

# CN-03
# Sessão de Keywords - Caso de teste 03: Listar Produtos
Passar o mouse por cima da categoria "Woman" no menu principal superior de categorias
    Mouse Over          xpath=//*[@id='block_top_menu']//*[@href="http://automationpractice.com/index.php?id_category=3&controller=category"]
Clicar na sub categoria "Summer Dresses"
    Click Element       xpath=//*[@id='block_top_menu']//*[@href="http://automationpractice.com/index.php?id_category=11&controller=category"]
    # Click Element        //*[@id='block_top_menu']//a[@title='Summer Dresses']
Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página
    Title Should Be     Summer Dresses - My Store

# CN-04
# Sessão de Keywords - Caso de teste 04: Adicionar Cliente
Clicar em "Sign in"
    Click Element       xpath=//*[@class='nav']//*[@class='login']

informar um e-mail válido "${EMAIL}"
    Wait until Element is Visible       id=create-account_form
    Input Text                          id=email_create     ${EMAIL}

Clicar em "Create an account"
    Click Button                        id=SubmitCreate
Preencher os dados obrigatórios

    Wait until Element is Visible       id=account-creation_form
    Click Element                       id=id_gender1
    Input Text                          xpath=//*[@id='customer_firstname']     John
    Input Text                          xpath=//*[@id='customer_lastname']      Mayer
    Input Text                          xpath=//*[@id='passwd']                 0o9i8u7y
    Input Text                          id=firstname        John
    Input Text                          id=lastname         Mayer
    Input Text                          id=address1         Kailua, Hawaii 96734
    Input Text                          id=city             Canada
    Click Element                       id=id_state
    Click Element                       xpath=//option[contains(text(), 'Alabama')]
    Input Text                          id=postcode         10005
    Input Text                          id=phone_mobile     (808) 266-1222
    Input TExt                          id=alias            J.M

Submeter cadastro
    Click Button                        id=submitAccount

Conferir se o cadastro foi efetuado com sucesso
    ${USER}             Get Text        xpath=//div[@class='header_user_info']//span[contains(text(),'John Mayer')]
    Should Be Equal     John Mayer      ${USER}
