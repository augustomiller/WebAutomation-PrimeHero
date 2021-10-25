Documentation       Aqui consta todos as elementos e variáveis
...                 da página de busca do site automationpractice.

#---------------------------------#
#       USER AUTHENTICATION       #
#---------------------------------#
*** Variables ***
&{USER_AUTH}
...     EMAIL_ADDRESS=id=email
...     EMAIL_INPUT=id=email
...     EMAIL_REGISTERED=johnmayerContinum2014@fender.com
...     PASS_CLICK=id=passwd
...     PASS_INPUT=id=passwd
...     PASS_STRG=0o9i8u7y
...     SIGN_IN=SubmitLogin
...     HEADER=xpath=//div[@class='header_user_info']
...     DISPLAY=xpath=//div[@class='header_user_info']//span[contains(text(),'John Mayer')]
