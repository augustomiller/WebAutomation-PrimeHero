Documentation       Aqui consta todos as elementos e variáveis
...                 da página de autenticação do site automationpractice.

#------------------------------------#
#       SUMMER DRESSES CATEGORY      #
#------------------------------------#
*** Variables ***
&{USER}
...     FIRST_NAME=John
...     LAST_NAME=Mayer
...     PASSWORD=0o9i8u7y
...     COMPANY=Prime Control
...     ADDRESS_1=100 Congress Ave, Austin, TX 78701
...     ADDRESS_2=12396 Grant St, Thornton, CO 80241, Estados Unidos
...     CITY=Estados Unidos
...     POSTCODE=80241
...     OTHER=born October 16, 1977, Bridgeport, Connecticut, U.S.
...     PHONE=+12125650000
...     PHONE_MOBILE=(808) 266-1222
...     ID_ALIAS=Nova Iorque, Nova York, EUA
...     EMAIL=johnmayerContinum1993@fender.com
...     SIGN_ELEMENT=xpath=//*[@class='nav']//*[@class='login']
...     FORM_ACCOUNT=id=create-account_form
...     ID_INPUT_EMAIL=id=email_create
...     SUBMIT_EMAIL=id=SubmitCreate
...     CHECK_FORM=id=account-creation_form
...     PATH_FIRST_NAME=xpath=//*[@id='customer_firstname']
...     PATH_LAST_NAME=xpath=//*[@id='customer_lastname']
...     PATH_PASS=xpath=//*[@id='passwd']
...     CLICK_DATE=id=days
...     BIRTH_DAY=xpath=//option[contains(text(), '16')]
...     BIRTH_MONTHS_CLICK=id=months
...     BIRTH_MONTHS=xpath=//option[contains(text(), 'October')]
...     BIRTH_YEARS_CLICK=id=years
...     BIRTH_YEARS=xpath=//option[contains(text(), '1977')]
...     NEWSLETTER=id=newsletter
...     OFFERS=id=optin
...     COMPANY_ID=id=company
...     ADDRESS1_ID=id=address1
...     ADDRESS2_ID=id=address2
...     CITY_ID=id=city
...     STATE_CLICK=id=id_state
...     STATE=xpath=//option[contains(text(), 'Washington')]
...     POSTCODE_ID=id=postcode
...     ADDITIONAL_INFORMATION=id=other
...     PHONE_ID=id=phone
...     PHONE_MOBILE_ID=id=phone_mobile
...     ALIAS_ID=id=alias
...     SUBMMIT_ID=id=submitAccount
...     HEADER=xpath=//div[@class='header_user_info']
...     DISPLAY=xpath=//div[@class='header_user_info']//span[contains(text(),'John Mayer')]
