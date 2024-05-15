*** Settings ***
Library    SeleniumLibrary 
Resource    ../main.robot   

*** Keywords ***
Dado que eu acesse a NFL
    ${HEADERS}=    Set Variable    
    Open Browser    https://www.nfl.com/      Chrome    options=add_argument("--user-agent=${HEADERS}")
    Maximize Browser Window
    Click Element    id=onetrust-accept-btn-handler
    Sleep    5s

    

Fechar o navegador 
    Close Browser