*** Settings ***
Documentation       Aqui consta todos os recursos do projeto.

#------------------------#
#       Libraries        #
#------------------------#
Library     SeleniumLibrary
Library     String

#-----------------------#
#       Keywords        #
#-----------------------#
Resource        keywords/kws_web.robot   

#--------------------#
#       Pages        #
#--------------------#
Resource        pages/home_page.robot
Resource        pages/search_product_page.robot
Resource        pages/summer_dresses_page.robot.robot

#--------------------#
#       Hooks        #
#--------------------#
Resource        hooks.robot
