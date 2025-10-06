*** Settings ***
Documentation    Online

Library    FakerLibrary
Resource    ../resources/base.robot

*** Test Cases ***
Deve poder cadastrar um novo usuario

    ${name}            FakerLibrary.Name
    ${email}           FakerLibrary.Email
    ${password}        Set Variable    123456

    Start Session

    Go To    http://localhost:3000/signup   
   
    Wait For Elements State    xpath=//h1    visible    5
    Get Text    xpath=//h1    equal    Faça seu cadastro

    Fill Text    id=name        ${name}
    Fill Text    id=email       ${email}
    Fill Text    id=password    ${password}

    Click        id=buttonSignup

    #Element Should Contain    id=message    Oops! Já existe uma conta com o e-mail informado. 
    # Boas vindas ao Mark85, o seu gerenciador de tarefas.    

    Wait For Elements State    css=.notice p    visible    5
    Get Text                   css=.notice p    equal      Boas vindas ao Mark85, o seu gerenciador de tarefas. 

    #Sleep    5 