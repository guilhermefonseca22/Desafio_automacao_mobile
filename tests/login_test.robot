*** Settings ***
Library     AppiumLibrary
Library     String
Library     OperatingSystem
Resource    ../resources/session/session.resource
Resource    ../resources/page_object/android/login.resource

Test Setup       Start Session
Test Teardown    End Session

*** Variables ***
${safe_test_name}    NONE

*** Test Cases ***
Cenario_05_Usuario_realiza_cadastro_com_sucesso
    [Documentation]    Teste de cadastro completo com sucesso
    Set Suite Variable    ${safe_test_name}    ${TEST NAME}
    Dado que o aplicativo está aberto na tela de cadastro
    Quando o usuário preenche o email como "joao@example.com"
    E o usuário preenche a senha como "senhaSegura123"
    E o usuário preenche o campo confirmando a senha
    E o usuário clica no botão "SIGN"
    Então a mensagem "You successfully signed up!" deve ser exibida

Cenario_06_Usuario_tenta_cadastrar_sem_preencher_os_campos
    [Documentation]    Validação de erros ao tentar cadastrar sem preencher campos
    Set Suite Variable    ${safe_test_name}    ${TEST NAME}
    Dado que o aplicativo está aberto na tela de cadastro
    Quando o usuário clica no botão "SIGN"
    Então a mensagem de erro no email "Please enter a valid email address" deve ser exibida
    E a mensagem de erro no password "Please enter at least 8 characters" deve ser exibida
    E a mensagem de erro no confirm password "Please enter the same password" deve ser exibida

Cenario_07_Usuario_faz_login
    [Documentation]    Teste de login com sucesso
    Set Suite Variable    ${safe_test_name}    ${TEST NAME}
    Dado que o aplicativo está aberto na tela de login
    Quando o usuário preenche o email como "teste@teste.com"
    E o usuário preenche a senha como "senhaSenha123"
    E o usuário clica no botão "LOGI"
    Então a tela inicial deve ser exibida com a mensagem "You are logged in!"

Cenario_08_Usuario_tenta_login_com_senha_errada
    [Documentation]    Validação de erro ao usar senha incorreta
    Set Suite Variable    ${safe_test_name}    ${TEST NAME}
    Dado que o aplicativo está aberto na tela de login
    Quando o usuário preenche o email como "teste@example.com"
    E o usuário preenche a senha com menos de 8 digitos
    E o usuário clica no botão "LOGI"
    Então a mensagem de erro "Please enter at least 8 characters" deve ser exibida

Cenario_09_Navegar_da_telalogin_tela_de_cadastro
    [Documentation]    Navegar do login para a tela de forms
    Set Suite Variable    ${safe_test_name}    ${TEST NAME}
    Dado que o aplicativo está aberto na tela de login
    Quando o usuário clica no botão "Forms"
    Então a tela de Form components deve ser exibida
