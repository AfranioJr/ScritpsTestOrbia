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

# BuyingProductBdd.robot
E informo meu email "${LOGINEMAIL}" e minha senha "${LOGINPASS}" para logar
    Wait Until Element Is Visible    id=email
    Input Text    id=email    ${LOGINEMAIL}
    Input Text    id=passwd   ${LOGINPASS}

Quando eu clicar em "Sign in"
    Click Button    id=SubmitLogin


# Process BuyingProductBdd
E clico na Categoria "${CATEGORY}" e logo em seguida na subcategoria "${SubCATEGORY}"
    Wait Until Element Is Visible    xpath=//*[@id="center_column"]/ul/li/a
    Mouse Up      xpath=//*[@id="block_top_menu"]/ul/li/a[contains(text(),'${CATEGORY}')]
    Wait Until Page Contains Element  xpath=//*[@id="block_top_menu"]/ul/li[2]/ul/li/a[contains(text(),'${SubCATEGORY}')]
    Sleep   2s
    Mouse Over    xpath=//*[@id="block_top_menu"]/ul/li[2]/ul/li/a[contains(text(),'${SubCATEGORY}')]
    Click Link    xpath=//*[@id="block_top_menu"]/ul/li[2]/ul/li/a[contains(text(),'${SubCATEGORY}')]

E clico no vestido "${PRODUTO}"
    Wait Until Page Contains Element    xpath=//*[@id="center_column"]/ul/li/div/div/h5/a[contains(text(),'${PRODUTO}')]
    Sleep   2s
    Scroll Page To Location    0    400
    Mouse Over    xpath=//*[@id="center_column"]/ul/li/div/div/h5/a[contains(text(),'${PRODUTO}')]
    Click Link    xpath=//*[@id="center_column"]/ul/li/div/div/h5/a[contains(text(),'${PRODUTO}')]

E clico na cor "Rosa" e escolho o tamanho "M"
    Wait Until Page Contains Element    id=color_24
    Click Link    id=color_24
    Select From List By Index    id=group_1     1

E clico no botão "Add to Cart" e Continuar Comprando
    Click Button    name=Submit
    Sleep    4s
    Click Element    xpath=//*[@id="layer_cart"]/div[1]/div[2]/div[4]/span

E clico na cor "Bege" e escolho o tamanho "P"
    Wait Until Page Contains Element    id=color_24
    Click Link    id=color_7
    Select From List By Index    id=group_1     0

E clico no botão "Add to Cart" e "Proceed to checkout"
    Click Button    name=Submit
    Sleep    4s
    Click Element    xpath=//*[@id="layer_cart"]/div[1]/div[2]/div[4]/a

Quando estiver no carrinho clico no botão "Proceed to checkout"
    Wait Until Page Contains Element    xpath=//*[@id="center_column"]/p[2]/a[1]
    Click Element    xpath=//*[@id="center_column"]/p[2]/a[1]

E na tela de Endereço clico no botão "Proceed to checkout"
    Wait Until Page Contains Element    name=processAddress
    Click Button    name=processAddress

E na tela de Entrega Leio e Confirmo os termos
    Wait Until Page Contains Element    xpath=//*[@id="form"]/div/p[2]/a
    Click Link    xpath=//*[@id="form"]/div/p[2]/a
    Sleep    4s
    Capture Page Screenshot
    Click Element    xpath=//*[@id="order"]/div[2]/div/div/a
    Sleep    3s
    Click Element    id=cgv

E clico no botão "Proceed to checkout"
    Click Button    name=processCarrier

E Seleciono a opção Pagar com Cheque
    Wait Until Page Contains Element    xpath=//*[@id="HOOK_PAYMENT"]/div[2]/div/p
    Scroll Page To Location    0    400
    Click Element    xpath=//*[@id="HOOK_PAYMENT"]/div[2]/div/p

E clico no botão "I confirm my order"
    Wait Until Page Contains Element    xpath=//*[@id="cart_navigation"]/button
    Click Element    xpath=//*[@id="cart_navigation"]/button

E clico para acessar a Central do Cliente
    Wait Until Page Contains Element    xpath=//*[@id="header"]/div[2]/div/div/nav/div[1]/a
    Click Link    xpath=//*[@id="header"]/div[2]/div/div/nav/div[1]/a

E logo em seguida clico no botão "Order history and details"
    Wait Until Page Contains Element    xpath=//*[@id="center_column"]/div/div[1]/ul/li[1]/a
    Click Element    xpath=//*[@id="center_column"]/div/div[1]/ul/li[1]/a

Então veria os pedidos na página "${PAGENAME}"
    Wait Until Page Contains Element    xpath=//*[@id="columns"]/div[1]/span[3]
    Title Should Be                   Order history - My Store
    Page Should Contain Element    //*[@id="columns"]/div[1]/span[contains(text(),'${PAGENAME}')]
    Capture Page Screenshot

Scroll Page To Location
    [Arguments]    ${x_location}    ${y_location}
    Execute JavaScript    window.scrollTo(${x_location},${y_location})


#EvaluatingProducts
Quando estiver na página de detalhes do produto Clico em "Write a review"
    Wait Until Page Contains Element    xpath=//*[@id="product_comments_block_extra"]
    Click Link    xpath=//*[@id="product_comments_block_extra"]/ul/li/a

E avalio o produto com 5 estrelas
    Wait Until Page Contains Element    xpath=//*[@id="criterions_list"]/li/div[1]/div[6]/a
    Click Element    xpath=//*[@id="criterions_list"]/li/div[1]/div[6]/a

E dou um Titulo para meu comentario "${TITULOCOMENTARIO}"
    Input Text    name=title    ${TITULOCOMENTARIO}

E informo uma mensagem "${CONTEUDO}"
    Input Text    name=content    ${CONTEUDO}

E clico no botão "Send"
    Click Button    id=submitNewMessage

E eu vejo a Mensagem de confirmação "${NCOMMENT}"
    Wait Until Page Contains Element    xpath=//*[@id="product"]/div[2]/div/div/div/h2
    Page Should Contain Element    xpath=//*[@id="product"]/div[2]/div/div/div/h2[contains(text(),'${NCOMMENT}')]
    Capture Page Screenshot

Então Clico no botão "OK"
    Click Element    xpath=//*[@id="product"]/div[2]/div/div/div/p[2]/button
