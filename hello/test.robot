
*** Settings ***
Library     app.py

*** Test Cases ***
Deve retornar mensagem de boas vindas
   ${result}=       Welcome     Rara
   Log To Console   ${result}
   Should Be Equal  ${result}   Olá Rara, Bem vindo ao Curso Básico de Robot Framework!