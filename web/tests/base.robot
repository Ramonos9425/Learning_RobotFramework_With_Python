*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}          http://training-wheels-protocol.herokuapp.com/

*** Keywords ***
Nova Sessão
    Open Browser                    ${url}              chrome

Encerra Sessão
    Capture Page Screenshot
    Close Browser