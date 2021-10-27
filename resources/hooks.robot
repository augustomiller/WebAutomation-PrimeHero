*** Settings ***
Documentation       

Resource        package.robot

*** Variables ***
${BROWSER}  chrome
${URL}      http://automationpractice.com/

*** Keywords *** 
#------------------------------------------------------------------------------#
#                                SETUP                                         #
#------------------------------------------------------------------------------#
Abrir navegador
    Open BROWSER        ${URL}      ${BROWSER}
    Maximize BROWSER Window

#------------------------------------------------------------------------------#
#                               TEARDOWN                                       #
#------------------------------------------------------------------------------#
Fechar navegador
    Capture Page Screenshot
    Close BROWSER
