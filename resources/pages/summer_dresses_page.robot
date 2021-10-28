Documentation       Aqui consta todos as elementos e variáveis
...                 da página SUMMER DRESSES do site automationpractice.

#------------------------------------#
#       SUMMER DRESSES CATEGORY      #
#------------------------------------#
*** Variables ***
&{SUMMER}
...     FRAME_PRODUTO=//*[contains(text(),'Printed Chiffon Dress')]
...     ADD_TO_CART=//*[@id='add_to_cart']//*[@name='Submit']
...     PROCEED_TO_SUMMARY=//*[@class='btn btn-default button button-medium']//*
...     PROCEED_TO_ADDRESS=//*[@class='cart_navigation clearfix']//*
...     PROCEED_TO_SHIPPING=//*[@class='cart_navigation clearfix']//*[@name='processAddress']
...     TERMS_OS_SERVICE=//*[@class='checkbox']//*
...     PROCEED_TO_PAYMENT=//*[@class='cart_navigation clearfix']//*[@type='submit']
...     PAY_BY_BANK=//*[contains(text(),'Pay by bank wire')]
...     CONFIRM_ORDER=//*[@class='button btn btn-default button-medium']//span[contains(text(),'I confirm my order')]
...     ORDER_COMPLETE=//*[@class='cheque-indent']//*[contains(text(),'Your order on My Store is complete.')]
...     GO_TO_ORDERS=//*[@class='button-exclusive btn btn-default']

&{SUMMER_CATEGORY}
...     ID_FORM=account-creation_form
...     TITLE=Summer Dresses - My Store
