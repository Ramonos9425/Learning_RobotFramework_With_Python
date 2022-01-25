*** Settings ***
Resource        base.robot

Test Setup      Nova Sessão
Test Teardown   Encerra Sessão

*** Test Cases ***
Verifica o valor ao informar o numero da linha
    Go To                           ${url}/tables
    Table Row Should Contain        id:actors       1       	$ 10.000.000        #1 é o numero da linha
    Table Row Should Contain        id:actors       1       	@robertdowneyjr
    Table Row Should Contain        id:actors       2       	@vindiesel

Descobre a linha pelo texto chave e valida os demais valores
    Go To                           ${url}/tables
    ${target}=                      Get WebElement              xpath:.//tr[contains(., '@chadwickboseman')]
    Log                             ${target.text}      #grava no relatorio
    Log To Console                  ${target.text}      #fazer debug
    Should Contain                  ${target.text}                   $ 700.000          #pega o texto do elemento e compara
    Should Contain                  ${target.text}                   Pantera Negra