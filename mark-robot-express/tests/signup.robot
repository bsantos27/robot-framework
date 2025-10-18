*** Settings ***
Documentation    Online

Resource    ../resources/base.robot

Test Setup    Start Session
Test Teardown    Take Screenshot


*** Test Cases ***
Deve poder cadastrar um novo usuario

    ${user}    Create Dictionary
    ...    name=Santos
    ...    email=bruno@gmail.com
    ...    password=123456   

    Remove User from Database    ${user}[email]

    Go To    ${BASE_URL}signup  
   
    Wait For Elements State    xpath=//h1    visible    5
    Get Text    xpath=//h1    equal    Faça seu cadastro

    Fill Text    id=name        ${user}[name]
    Fill Text    id=email       ${user}[email]
    Fill Text    id=password    ${user}[password]

    Click        id=buttonSignup 

    Wait For Elements State    css=.notice p    visible    5
    Get Text                   css=.notice p    equal      Boas vindas ao Mark85, o seu gerenciador de tarefas. 

  

Nao deve permitir cadastro com email duplicado
    [Tags]    dup

    ${user}    Create Dictionary
    ...    name=Papito
    ...    email=Papito@gmail.com
    ...    password=123456     

    Remove User from Database    ${user}[email]

    Insert User in Database    ${user}    

    Go To    ${BASE_URL}signup  
   
    Wait For Elements State    xpath=//h1    visible    5
    Get Text    xpath=//h1    equal    Faça seu cadastro

    Fill Text    id=name        ${user}[name]
    Fill Text    id=email       ${user}[email]
    Fill Text    id=password    ${user}[password]

    Click        id=buttonSignup

    Wait For Elements State    css=.notice p    visible    5
    Get Text                   css=.notice p    equal      Oops! Já existe uma conta com o e-mail informado.    