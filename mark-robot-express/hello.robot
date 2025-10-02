*** Settings ***
Documentation     A simple hello world example

Library         mylib.py

*** Test Cases ***
Say Hello
    Log    Hello, World!
    
    My Log    Test form library
    