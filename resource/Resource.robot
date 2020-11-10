*** Settings ***
Library     SeleniumLibrary
Library     String

*** Variables ***
${BROWSER}              firefox
${URL}                  http://automationpractice.com
${LOWER}                qwertyuiopasdfghjklzxcvbnm

*** Keywords ***
### Init ####

Abrir Navegador
    Open Browser          about:blank     ${BROWSER}

Fechar Navegador
    Close Browser

### Setp-by-Setp ###
Dado que estou na página home do Site
    Go To                 ${URL}
    Title Should Be       My Store

Quando eu clicar no botão "Sign in"
    Click Link            class=login

Então serei direcionado para a página "${PAGENAME}"
    Sleep    4s
    Wait Until Element Is Visible     class=icon-lock
    Title Should Be                   Login - My Store
    Page Should Contain Element       xpath=//*[@id="center_column"]/h1[contains(text(),'${PAGENAME}')]
    Capture Page Screenshot

Dado que estou na página de Login do Site
    Dado que estou na página home do Site
    Quando eu clicar no botão "Sign in"

E no campo "Email adress" informar o meu e-mail "${EMAILUSER}"
    Wait Until Element Is Visible    id=email_create
    Input Text    id=email_create    ${EMAILUSER}
    Set Global Variable              ${EMAILUSER}

Quando eu clicar no botão "Create an account"
    Click Button    id=SubmitCreate

Então serei direcionado para o formulario "${PAGENAME}"
    Sleep    4s
    Wait Until Element Is Visible     id=submitAccount
    Title Should Be                   Login - My Store
    Page Should Contain Element       xpath=//*[@id="account-creation_form"]/div[1]/h3[contains(text(),'${PAGENAME}')]
    Capture Page Screenshot

Dado que eu estou no Formulário de Informações Pessoais
    Dado que estou na página de Login do Site
    E no campo "Email adress" informar o meu e-mail "${EMAILUSER}"
    Quando eu clicar no botão "Create an account"

E no Titulo eu seleciono "Mrs."
    Sleep    4s
    Page Should Contain Radio Button    id=id_gender2
    Select Radio Button    id_gender    2

E no campo "First name" informo meu Nome "${FIRSTNAME}"
    Input Text    id=customer_firstname    ${FIRSTNAME}

E no campo "Last name" informo meu sobrenome "${LASTNAME}"
    Input Text    id=customer_lastname    ${LASTNAME}

E no campo "Password" informo uma senha Válida
    ${PASSWORD}=            Generate Random String    8     [NUMBERS]${LOWER}
    Input Text    id=passwd    ${PASSWORD}
    Log    ${PASSWORD}

E no campo "Dia" Selecionar o dia do meu nascimento
    Select From List By Index    name=days      9

E no campo "Mês" Selecionar o dia do meu nascimento
    Select From List By Index    name=months    11

E no campo "Ano" Selecionar o dia do meu nascimento
    Select From List By Index    name=years     29

E seleciono o Checkbox "Receive special offers from our partners!"
    Select Checkbox    id=optin
    Capture Page Screenshot

E no campo "Address" informo a rua "${ADDRESS}"
    Input Text    id=address1    ${ADDRESS}

E no campo "City" informo a cidade "${CITY}"
    Input Text    id=city    ${CITY}

E no campo "State" informo o Estado "Ohio"
    Select From List By Index    name=id_state     37

E no campo "Zip/Postal Code" informo o zip "${ZIP}"
    Input Text    id=postcode    ${ZIP}

E no campo "Country" informo o Estado "United States"
    Select From List By Index    name=id_country     1

E no campo "Mobile phone" informo o numero "${PHONE}"
    Input Text    id=phone_mobile    ${PHONE}

E no campo "My Adress" informo o texto "${MYADRESS}"
    Input Text    id=alias    ${MYADRESS}

Quando eu clicar no botão "Register"
    Click Button    id=submitAccount


Então verei a página "${MYACCOUNT}"
    Sleep    4s
    Wait Until Element Is Visible     class=icon-heart
    Title Should Be                   My account - My Store
    Page Should Contain Element       xpath=//*[@id="center_column"]/ul/li/a/span/i
    Page Should Contain Element       xpath=//*[@id="columns"]/div[1]/span[2][contains(text(),'${MYACCOUNT}')]
    Capture Page Screenshot
