*** Settings ***
Documentation       

Resource        package.robot

*** Variables ***
${BROWSER}  chrome
${URL}      http://automationpractice.com/

*** Keywords ***
#SETUP E TEARDOWN
Abrir navegador
    Open BROWSER        ${URL}      ${BROWSER}
    Maximize BROWSER Window

Fechar navegador
    Capture Page Screenshot
    Close BROWSER
