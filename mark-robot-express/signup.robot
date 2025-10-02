*** Settings ***
Documentation    Online

Library    Browser

*** Test Cases ***
Deve poder cadastrar um novo usuario

    New Browser    browser=chromium    headless=False
    New Page    http://localhost:3000/signup
   
    Wait For Elements State    xpath=//h1    visible    5
    Get Text    xpath=//h1    equal    Faça seu cadastro

    Fill Text    id=name    Ester
    Fill Text    id=email    ester@hotmail.com
    Fill Text    id=password    123456

    Sleep    5 