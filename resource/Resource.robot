*** Settings ***
Library     SeleniumLibrary
Library     String

*** Variables ***
${BROWSER}              firefox
${URL}                  http://automationpractice.com
${PASSWORD}             Generate Random String  4  [NUMBERS]abcdef

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
    Wait Until Element Is Visible     id=submitAccount
    Title Should Be                   Login - My Store
    Page Should Contain Element       xpath=//*[@id="account-creation_form"]/div[1]/h3[contains(text(),'${PAGENAME}')]
    Capture Page Screenshot

Dado que eu estou no Formulário de Informações Pessoais
    Dado que estou na página de Login do Site
    E no campo "Email adress" informar o meu e-mail "${EMAILUSER}"
    Quando eu clicar no botão "Create an account"

E no Titulo eu seleciono "Mrs."
    Select Radio Button    radio    2
