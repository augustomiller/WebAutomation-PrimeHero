Resource        ../package.robotS

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
    Page Should Contain Image           ${SEARCH.CONTAIN_IMAGE}
    Title Should Be                     ${SEARCH.TITLE_NAME}

#---------------------------------------#
# CN-02 - Pesquisar produto inexistente #
#---------------------------------------#
Conferir se a mensagem "No results were found for your search "itemNãoExistente""
    ${check_element}=  Run Keyword and Return Status   Wait Until Page Contains Element     ${SEARCH.ID_COLUMN}    10s
    Run Keyword If      '${check_element}' == 'True'   Wait Until Element Is Visible        ${SEARCH.ALERT_WARNING}

#---------------------------------------#
# CN-03 - Listar Produtos               #
#---------------------------------------#
Passar o mouse por cima da categoria "Woman" no menu principal superior de categorias
    Mouse Over          ${HOME.WOMAN_CATEGORY}

Clicar na sub categoria "Summer Dresses"
    Click Element       ${HOME.SUMMER_DRESSES_CATEGORY}

Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página
    ${check_element}=  Run Keyword and Return Status     Wait Until Page Contains Element    ${SUMMER_CATEGORY.ID_FORM}    10s
    Run Keyword If      '${check_element}' == 'True'     Title Should Be     ${SUMMER_CATEGORY.TITLE}

#---------------------------------------#
# CN-04 - Adicionar Cliente             #
#---------------------------------------#
Clicar em "Sign in"
    Click Element       ${USER.SIGN_ELEMENT}

informar um e-mail válido
    Wait until Element is Visible       ${USER.FORM_ACCOUNT}
    Input Text                          ${USER.ID_INPUT_EMAIL}         ${USER.EMAIL}

Clicar em "Create an account"
    Click Button                        ${USER.SUBMIT_EMAIL}
Preencher os dados obrigatórios

    ${check_element}=  Run Keyword and Return Status   Wait Until Page Contains Element    ${USER.CHECK_FORM}    10s
    Run Keyword If      '${check_element}' == 'True'     Click Element  id=id_gender1

    Input Text          ${USER.PATH_FIRST_NAME}                 ${USER.FIRST_NAME}
    Input Text          ${USER.PATH_LAST_NAME}                  ${USER.LAST_NAME}
    Input Text          ${USER.PATH_PASS}                       ${USER.PASSWORD}
    Click Element       ${USER.CLICK_DATE}
    Click Element       ${USER.BIRTH_DAY}
    Click Element       ${USER.BIRTH_MONTHS_CLICK}
    Click Element       ${USER.BIRTH_MONTHS}
    Click Element       ${USER.BIRTH_YEARS_CLICK}
    Click Element       ${USER.BIRTH_YEARS}
    Click Element       ${USER.NEWSLETTER}
    Click Element       ${USER.OFFERS}
    Input Text          ${USER.COMPANY_ID}          ${USER.COMPANY}
    Input Text          ${USER.ADDRESS1_ID}         ${USER.ADDRESS_1}
    Input Text          ${USER.ADDRESS2_ID}         ${USER.ADDRESS_2}
    Input Text          ${USER.CITY_ID}             ${USER.CITY}
    Click Element       ${USER.STATE_CLICK}
    Click Element       ${USER.STATE}
    Input Text          ${USER.POSTCODE_ID}                 ${USER.POSTCODE}
    Input Text          ${USER.ADDITIONAL_INFORMATION}      ${USER.OTHER}
    Input Text          ${USER.PHONE_ID}                    ${USER.PHONE}
    Input Text          ${USER.PHONE_MOBILE_ID}             ${USER.PHONE_MOBILE}
    Input TExt          ${USER.ALIAS_ID}                    ${USER.ID_ALIAS}

Submeter cadastro
    Click Button                        ${USER.SUBMMIT_ID}

Conferir se o cadastro foi efetuado com sucesso
    ${check_element}=  Run Keyword and Return Status     Wait Until Page Contains Element        ${USER.HEADER}  10s
    Run Keyword If      '${check_element}' == 'True'     Wait Until Element Is Visible           ${USER.HEADER}

    ${USER}             Get Text        ${USER.DISPLAY}

    ${check_element}=  Run Keyword and Return Status     Wait Until Page Contains Element    ${USER.HEADER}    10s
    Run Keyword If      '${check_element}' == 'True'     Should Be Equal                     John Mayer                                ${USER}
