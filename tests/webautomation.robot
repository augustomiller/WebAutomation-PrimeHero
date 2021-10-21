*** Settings ***
Documentation       

Resource            ../resources/keywords/kws_webautomation.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Test Cases ***
Caso de Teste 01: Pesquisar produto existente
    [Tags]      PRODUTO_EXISTENTE
    Acessar a página home do site Automation Practice
    Digitar o nome do produto "Blouse" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se o produto "Blouse" foi listado no site

Caso de Teste 02: Pesquisar produto não existente
    [Tags]      PRODUTO_INEXISTENTE
    Acessar a página home do site Automation Practice
    Digitar o nome do produto "itemNãoExistente" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se a mensagem "No results were found for your search "itemNãoExistente""

Caso de teste 03: Listar Produtos
    [Tags]      LISTAR_PRODUTOS
    Acessar a página home do site Automation Practice
    Passar o mouse por cima da categoria "Woman" no menu principal superior de categorias
    Clicar na sub categoria "Summer Dresses"
    Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página

Caso de teste 04: Adicionar Cliente
    [Tags]      ADICIONAR_CLIENTE
    Acessar a página home do site Automation Practice
    Clicar em "Sign in"
    informar um e-mail válido "johnmayercontinuum@uol.com"
    Clicar em "Create an account"
    Preencher os dados obrigatórios
    Submeter cadastro
    Conferir se o cadastro foi efetuado com sucesso
