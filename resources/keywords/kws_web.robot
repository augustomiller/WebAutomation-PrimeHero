Resource        ../package.robot

*** Variables ***
&{USER}
...     FIRST_NAME=John
...     LAST_NAME=Mayer
...     PASSWORD=0o9i8u7y
...     COMPANY=Prime Control
...     ADDRESS_1=100 Congress Ave, Austin, TX 78701
...     ADDRESS_2=12396 Grant St, Thornton, CO 80241, Estados Unidos
...     CITY=Estados Unidos
...     POSTCODE=80241
...     OTHER=born October 16, 1977, Bridgeport, Connecticut, U.S.
...     PHONE=+12125650000
...     PHONE_MOBILE=(808) 266-1222
...     ID_ALIAS=Nova Iorque, Nova York, EUA
...     EMAIL=johnmayerContinum2021@fender.com

*** Keywords ***

#-------------------------------------#
# CN-01 - Pesquisar produto existente #
#-------------------------------------#
Acessar a página home do site Automation Practice
    Go To                               ${URL}
    Title Should Be                     ${HOME.TITLE_PAGE_HOME}
    Wait Until Element Is Visible       ${HOME.CATEGORY_MENU_OPTIONS}

Digitar o nome do produto "${PRODUCT}" no campo de pesquisa
    ${check_element}=  Run Keyword and Return Status     Wait Until Page Contains Element      ${HOME.SEARCH_INPUT_ID}        10s
    Run Keyword If      '${check_element}' == 'True'     Input Text                            ${HOME.SEARCH_INPUT_ID}        ${PRODUCT}

Clicar no botão pesquisar
    Click Element                       ${HOME.SUBMIT_SEARCH_NAME}

Conferir se o produto "${PRODUCT}" foi listado no site
    Page Should Contain Image           ${HOME.CONTAIN_IMAGE}
    Title Should Be                     ${HOME.TITLE_NAME}

#---------------------------------------#
# CN-02 - Pesquisar produto inexistente #
#---------------------------------------#
Conferir se a mensagem "No results were found for your search "itemNãoExistente""
    ${check_element}=  Run Keyword and Return Status   Wait Until Page Contains Element     id=center_column    10s
    Run Keyword If      '${check_element}' == 'True'   Wait Until Element Is Visible        xpath=//*[@id='center_column']//*[@class='alert alert-warning']

#---------------------------------------#
# CN-03 - Listar Produtos               #
#---------------------------------------#
Passar o mouse por cima da categoria "Woman" no menu principal superior de categorias
    Mouse Over          xpath=//*[@id='block_top_menu']//*[@href="http://automationpractice.com/index.php?id_category=3&controller=category"]

Clicar na sub categoria "Summer Dresses"
    Click Element       xpath=//*[@id='block_top_menu']//*[@href="http://automationpractice.com/index.php?id_category=11&controller=category"]

Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página
    ${check_element}=  Run Keyword and Return Status     Wait Until Page Contains Element    id=account-creation_form    10s
    Run Keyword If      '${check_element}' == 'True'     Title Should Be     Summer Dresses - My Store

#---------------------------------------#
# CN-04 - Adicionar Cliente             #
#---------------------------------------#
Clicar em "Sign in"
    Click Element       xpath=//*[@class='nav']//*[@class='login']

informar um e-mail válido
    Wait until Element is Visible       id=create-account_form
    Input Text                          id=email_create         ${USER.EMAIL}

Clicar em "Create an account"
    Click Button                        id=SubmitCreate
Preencher os dados obrigatórios

    ${check_element}=  Run Keyword and Return Status   Wait Until Page Contains Element    id=account-creation_form    10s
    Run Keyword If      '${check_element}' == 'True'     Click Element  id=id_gender1

    Input Text          xpath=//*[@id='customer_firstname']     ${USER.FIRST_NAME}
    Input Text          xpath=//*[@id='customer_lastname']      ${USER.LAST_NAME}
    Input Text          xpath=//*[@id='passwd']                 ${USER.PASSWORD}
    Click Element       id=days
    Click Element       xpath=//option[contains(text(), '16')]
    Click Element       id=months
    Click Element       xpath=//option[contains(text(), 'October')]
    Click Element       id=years
    Click Element       xpath=//option[contains(text(), '1977')]
    Click Element       id=newsletter
    Click Element       id=optin
    Input Text          id=company          ${USER.COMPANY}
    Input Text          id=address1         ${USER.ADDRESS_1}
    Input Text          id=address2         ${USER.ADDRESS_2}
    Input Text          id=city             ${USER.CITY}
    Click Element       id=id_state
    Click Element       xpath=//option[contains(text(), 'Washington')]
    Input Text          id=postcode         ${USER.POSTCODE}
    Input Text          id=other            ${USER.OTHER}
    Input Text          id=phone            ${USER.PHONE}
    Input Text          id=phone_mobile     ${USER.PHONE_MOBILE}
    Input TExt          id=alias            ${USER.ID_ALIAS}

Submeter cadastro
    Click Button                        id=submitAccount

Conferir se o cadastro foi efetuado com sucesso
    ${check_element}=  Run Keyword and Return Status     Wait Until Page Contains Element        xpath=//div[@class='header_user_info']  10s
    Run Keyword If      '${check_element}' == 'True'     Wait Until Element Is Visible           xpath=//div[@class='header_user_info']

    ${USER}             Get Text        xpath=//div[@class='header_user_info']//span[contains(text(),'John Mayer')]

    ${check_element}=  Run Keyword and Return Status     Wait Until Page Contains Element    xpath=//div[@class='header_user_info']    10s
    Run Keyword If      '${check_element}' == 'True'     Should Be Equal                     John Mayer                                ${USER}
