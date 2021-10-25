*** Settings ***
Documentation       Aqui consta todos os cenários de testes web.

Test Setup          Abrir navegador
Test Teardown       Fechar navegador
Resource            ../resources/package.robot

*** Test Cases ***
Caso de Teste 01: Pesquisar produto existente
    [Tags]      EXISTING_PRODUCT
    Acessar a página home do site Automation Practice
    Digitar o nome do produto "Blouse" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se o produto "Blouse" foi listado no site

Caso de Teste 02: Pesquisar produto não existente
    [Tags]      NONEXISTENT_PRODUCT
    Acessar a página home do site Automation Practice
    Digitar o nome do produto "itemNãoExistente" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se a mensagem "No results were found for your search "itemNãoExistente""

Caso de teste 03: Listar Produtos
    [Tags]      LIST_PRODUCTS
    Acessar a página home do site Automation Practice
    Passar o mouse por cima da categoria "Woman" no menu principal superior de categorias
    Clicar na sub categoria "Summer Dresses"
    Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página

Caso de teste 04: Adicionar Cliente
    [Tags]      ADICIONAR_CLIENTE
    Acessar a página home do site Automation Practice
    Clicar em "Sign in"
    informar um e-mail válido
    Clicar em "Create an account"
    Preencher os dados obrigatórios
    Submeter cadastro
    Conferir se o cadastro foi efetuado com sucesso
