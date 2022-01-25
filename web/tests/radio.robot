*** Settings ***
Resource        base.robot

Test Setup      Nova Sessão
Test Teardown   Encerra Sessão

*** Test Cases ***
Selecionando por Id
    Go To                           ${url}/radios
    Select Radio Button            movies      cap                      #movies é o mesmo name, cap é o q diferencia
    Radio Button Should Be Set To   movies     cap
#Executar: robot -d ./log web\tests\radio.robot

Selecionando por value
    Go To                           ${url}/radios
    Select Radio Button             movies      guardians                      #mesma coisa
    Radio Button Should Be Set To   movies      guardians