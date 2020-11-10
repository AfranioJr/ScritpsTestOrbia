*** Settings ***
Resource        ../resource/Resource.robot
Test Setup      Abrir Navegador
Test Teardown   Fechar Navegador

*** Test Case ***
Cenario 01: Buscar e Avaliar o Vestido
    Dado que eu estou Logado
    E clico na Categoria "Dresses" e logo em seguida na subcategoria "Evening Dresses"
    E clico no vestido "Printed Dress"
    Quando estiver na página de detalhes do produto Clico em "Write a review"
    E avalio o produto com 5 estrelas
    E dou um Titulo para meu comentario "Titulo Comentario"
    E informo uma mensagem "Conteúdo da Mensagem"
    E clico no botão "Send"
    E eu vejo a Mensagem de confirmação "New comment"
    Então Clico no botão "OK"


*** Keywords ***
Dado que eu estou Logado
      Dado que estou na página home do Site
      Quando eu clicar no botão "Sign in"
      E informo meu email "afraniojrcomprador@orbia.ag" e minha senha "afranio123" para logar
      Quando eu clicar em "Sign in"
      Então verei a página "My account"
