*** Settings ***
Library     SeleniumLibrary

#After e Before
Test Setup      Nova Sessão
Test Teardown   Encerra Sessão

*** Variables ***
${url}          http://training-wheels-protocol.herokuapp.com/
${check_thor}   id:thor
${check_iron}   css:input[value='iron-man']

*** Test Cases ***
Marcando opção com Id
    #Open Browser                    ${url}              chrome
    Go To                           ${url}/checkboxes
    Select Checkbox                 ${check_thor}
    Checkbox Should Be Selected     ${check_thor}
    Sleep                           5
    #Close Browser
#Executar: robot -d ./log checkbox.robot, Precisa estar dentro da pasta web no caso, executar pelo Terminal

Marcando opção com CSS Selector
    [tags]      ironman
   # Open Browser                    ${url}              chrome
    Go To                           ${url}/checkboxes
    Select Checkbox                 ${check_iron}
    Checkbox Should Be Selected     ${check_iron}
    #Close Browser
#Executar apenas um: robot -d ./log -i ironman checkbox.robot

Marcando opção com Xpath
    [tags]      ironmanXpath
    #Open Browser                    ${url}              chrome
    Go To                           ${url}/checkboxes
    Select Checkbox                 xpath://*[@id='checkboxes']/input[7]
    Checkbox Should Be Selected     xpath://*[@id='checkboxes']/input[7]
   # Close Browser

*** Keywords ***
Nova Sessão
    Open Browser                    ${url}              chrome

Encerra Sessão
    Close Browser