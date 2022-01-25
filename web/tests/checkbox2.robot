*** Settings ***
Resource        base.robot

Test Setup      Nova Sessão
Test Teardown   Encerra Sessão

*** Variables ***
${check_thor}       id:thor
${check_iron}       css:input[value='iron-man']
${check_panther}    xpath://*[@id='checkboxes']/input[7]

*** Test Cases ***
Marcando opção com Id
    Go To                           ${url}/checkboxes
    Select Checkbox                 ${check_thor}
    Checkbox Should Be Selected     ${check_thor}
    Sleep                           5
#Executar: robot -d ./log checkbox2.robot, Precisa estar dentro da pasta web no caso, executar pelo Terminal
#ou: robot -d ./log web\tests\checkbox2.robot, aqui fora da pasta

Marcando opção com CSS Selector
    [tags]      ironman
    Go To                           ${url}/checkboxes
    Select Checkbox                 ${check_iron}
    Checkbox Should Be Selected     ${check_iron}
#Executar apenas um: robot -d ./log -i ironman checkbox.robot

Marcando opção com Xpath
    [tags]      ironmanXpath
    Go To                           ${url}/checkboxes
    Select Checkbox                 ${check_panther}
    Checkbox Should Be Selected     ${check_panther}