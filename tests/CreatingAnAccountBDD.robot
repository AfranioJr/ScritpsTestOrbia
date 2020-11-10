*** Settings ***
Resource        ../resource/Resource.robot
Test Setup      Abrir Navegador
Test Teardown   Fechar Navegador

*** Test Case ***
Cenario 01: Acessar a Tela de Login
    Dado que estou na página home do Site
    Quando eu clicar no botão "Sign in"
    Então serei direcionado para a página "Authentication"
#
Cenário 02: Acessar a tela de Cadastro
    Dado que estou na página de Login do Site
    E no campo "Email adress" informar o meu e-mail "afraniojlr@orbia.ag"
    Quando eu clicar no botão "Create an account"
    Então serei direcionado para o formulario "Your personal information"
#
Cenário 03: Preenchendo o formulário
    Dado que eu estou no Formulário de Informações Pessoais
    E no Titulo eu seleciono "Mrs."
    E no campo "First name" informo meu Nome "Afranio"
    E no campo "Last name" informo meu sobrenome "Junior"
    E no campo "Password" informo uma senha Válida
    E no campo "Dia" Selecionar o dia do meu nascimento
    E no campo "Mês" Selecionar o dia do meu nascimento
    E no campo "Ano" Selecionar o dia do meu nascimento
    E seleciono o Checkbox "Receive special offers from our partners!"
    E no campo "Address" informo a rua "1765 W 3rd Ave"
    E no campo "City" informo a cidade "Columbus"
    E no campo "State" informo o Estado "Ohio"
    E no campo "Zip/Postal Code" informo o zip "43212"
    E no campo "Country" informo o Estado "United States"
    E no campo "Mobile phone" informo o numero "+16148171515"
    E no campo "My Adress" informo o texto "My Adress"
    Quando eu clicar no botão "Register"
    Então verei a página "My account"
