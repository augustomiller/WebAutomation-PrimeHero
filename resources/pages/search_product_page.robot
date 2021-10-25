Documentation       Aqui consta todos as elementos e variáveis
...                 da página de busca do site automationpractice.

#-----------------------------#
#       SEARCH PRODUCT        #
#-----------------------------#
*** Variables ***
&{SEARCH}
...     CONTAIN_IMAGE=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']
...     TITLE_NAME=Search - My Store  
...     ID_COLUMN=id=center_column
...     ALERT_WARNING=//*[@id='center_column']//*[@class='alert alert-warning']