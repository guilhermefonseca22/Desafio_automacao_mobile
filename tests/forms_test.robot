*** Settings ***
Library     AppiumLibrary
Library     String
Library     OperatingSystem
Resource    ../resources/session/session.resource
Resource    ../resources/page_object/android/login.resource
Resource    ../resources/page_object/android/forms.resource

Test Setup       Start Session
Test Teardown    End Session

*** Variables ***
${safe_test_name}    NONE

*** Test Cases ***
Cenario_02_Validação_de_Form_Appium_is_awesome
    [Documentation]    Validação completa da tela de forms
    Set Suite Variable    ${safe_test_name}    ${TEST NAME}

    Dado que o usuário está na tela de forms
    Quando o usuário escreve "Ótimo app, parabéns!" no campo Input field:
    E o usuário clica no botão de switch
    E Seleciona a opção no Dropdown    Appium is awesome
    Então a mensagem deve ser exibida no campo "You have typed"
    E o switch deve ter mudado
    O Dropdown deve exibir a opção    Appium is awesome


Cenario_03_Validação_de_Form_AppAwesome
    [Documentation]    Validação completa da tela de forms
    Set Suite Variable    ${safe_test_name}    ${TEST NAME}

    Dado que o usuário está na tela de forms
    Quando o usuário escreve "Ótimo app, parabéns!" no campo Input field:
    E o usuário clica no botão de switch
    E Seleciona a opção no Dropdown    This app is awesome
    Então a mensagem deve ser exibida no campo "You have typed"
    E o switch deve ter mudado
    O Dropdown deve exibir a opção    This app is awesome


Cenario_04_Validação_de_Form_webdriver
    [Documentation]    Validação completa da tela de forms
    Set Suite Variable    ${safe_test_name}    ${TEST NAME}

    Dado que o usuário está na tela de forms
    Quando o usuário escreve "Ótimo app, parabéns!" no campo Input field:
    E o usuário clica no botão de switch
    E Seleciona a opção no Dropdown    webdriver.io is awesome
    Então a mensagem deve ser exibida no campo "You have typed"
    E o switch deve ter mudado
    O Dropdown deve exibir a opção    webdriver.io is awesome
