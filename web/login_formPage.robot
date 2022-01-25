*** Settings ***
Resource        base.robot

Test Setup      Nova Sessão
Test Teardown   Encerra Sessão

*** Test Cases ***
Login com sucesso
    Go To                           ${url}/login
    Login With                      stark  jarvis!

    Page Should Contain             Tony Stark

Senha inválida
    [tags]                          login_error
    Go To                           ${url}/login
    Login With                      stark  1234

    Should Contain Login Alert      Senha é invalida!

Usuário não existe
    [tags]                          usuario_error
    Go To                           ${url}/login
    Login With                      ra  jarvis!

   Should Contain Login Alert       O usuário informado não está cadastrado!

*** Keywords ***
Login With
    [Arguments]                     ${uname}                        ${pass}

    Go To                           ${url}/login
    Input Text                      css:input[name=username]        stark
    Input Text                      css:input[name=password]        jarvis!
    Click Element                   class:btn-login

#se mudar a massa ou o elemento, vc so muda em um lugar, encapsulamento, encapsulando tudo criando novas KeyWords

Should Contain Login Alert
    [Arguments]                     ${expect_message}

    ${message}=                     Get WebElement                  id:flash
    Should Contain                  ${message.text}                 ${expect_message}

Should See Logged User 
    [Arguments]                     ${fullname}

    Page Should Contain             Olá, ${fullname}. Você acessou a área logada!