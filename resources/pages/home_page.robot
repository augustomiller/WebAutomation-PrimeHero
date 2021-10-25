Documentation       Aqui consta todos as elementos e variáveis
...                 da página de busca do site automationpractice.

#-------------------#
#       HOME        #
#-------------------#

*** Variables ***
&{HOME}     
...     TITLE_PAGE_HOME=My Store
...     CATEGORY_MENU_OPTIONS=xpath=//*[@id="block_top_menu"]/ul
...     SEARCH_INPUT_ID=id=search_query_top       
...     SUBMIT_SEARCH_NAME=name=submit_search
...     WOMAN_CATEGORY=xpath=//*[@id='block_top_menu']//*[@href="http://automationpractice.com/index.php?id_category=3&controller=category"]
...     SUMMER_DRESSES_CATEGORY=xpath=//*[@id='block_top_menu']//*[@href="http://automationpractice.com/index.php?id_category=11&controller=category"]
