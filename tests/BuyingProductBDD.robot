*** Settings ***
Resource        ../resource/Resource.robot
Test Setup      Abrir Navegador
Test Teardown   Fechar Navegador

*** Test Case ***
Cenario 01: Efetuar Login
    Dado que estou na página home do Site
    E clico no botão "Sign in"
    E informo meu email "clientecomprador@comprador.com" e minha senha "pr19o0bv" para logar
    Quando eu clicar em "Sign in"
    Então verei a página "My account"

Cenario 02: Comprando Vestidos
    Dado que eu estou Logado
    E clico na Categoria "Dresses" e logo em seguida na subcategoria "Evening Dresses"
    E clico no vestido "Printed Dress"
    E clico na cor "Rosa" e escolho o tamanho "M"
    E clico no botão "Add to Cart" e Continuar Comprando
    E clico na cor "Bege" e escolho o tamanho "P"
    E clico no botão "Add to Cart" e "Proceed to checkout"
    Quando estiver no carrinho clico no botão "Proceed to checkout"
    E na tela de Endereço clico no botão "Proceed to checkout"
    E na tela de Entrega Leio e Confirmo os termos
    E clico no botão "Proceed to checkout"
    E Seleciono a opção Pagar com Cheque
    E clico no botão "I confirm my order"
    E clico para acessar a Central do Cliente
    E logo em seguida clico no botão "Order history and details"
    Então veria os pedidos na página "Order history"

*** Keywords ***
E clico no botão "Sign in"
      Quando eu clicar no botão "Sign in"

Dado que eu estou Logado
      Dado que estou na página home do Site
      Quando eu clicar no botão "Sign in"
      E informo meu email "clientecomprador@comprador.com" e minha senha "pr19o0bv" para logar
      Quando eu clicar em "Sign in"
      Então verei a página "My account"
