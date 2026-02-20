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
${SAFE_TEST_NAME}    NONE

*** Test Cases ***
Cenario_02_Validacao_de_Form_Appium_is_awesome
    [Documentation]    Validacao completa da tela de forms
    Set Suite Variable    ${SAFE_TEST_NAME}    ${TEST NAME}
    Dado_que_usuario_esta_na_tela_de_forms
    Quando_usuario_escreve_no_campo_Input_field    Otimo app, parabens!
    E_usuario_clica_no_botao_switch
    E_seleciona_a_opcao_no_Dropdown    Appium is awesome
    Entao_a_mensagem_deve_ser_exibida_no_campo    You have typed
    E_o_switch_deve_ter_mudado
    O_Dropdown_deve_exibir_a_opcao    Appium is awesome


Cenario_03_Validacao_de_Form_AppAwesome
    [Documentation]    Validacao completa da tela de forms
    Set Suite Variable    ${SAFE_TEST_NAME}    ${TEST NAME}
    Dado_que_usuario_esta_na_tela_de_forms
    Quando_usuario_escreve_no_campo_Input_field    Otimo app, parabens!
    E_usuario_clica_no_botao_switch
    E_seleciona_a_opcao_no_Dropdown    This app is awesome
    Entao_a_mensagem_deve_ser_exibida_no_campo    You have typed
    E_o_switch_deve_ter_mudado
    O_Dropdown_deve_exibir_a_opcao    This app is awesome


Cenario_04_Validacao_de_Form_webdriver
    [Documentation]    Validacao completa da tela de forms
    Set Suite Variable    ${SAFE_TEST_NAME}    ${TEST NAME}
    Dado_que_usuario_esta_na_tela_de_forms
    Quando_usuario_escreve_no_campo_Input_field    Otimo app, parabens!
    E_usuario_clica_no_botao_switch
    E_seleciona_a_opcao_no_Dropdown    webdriver.io is awesome
    Entao_a_mensagem_deve_ser_exibida_no_campo    You have typed
    E_o_switch_deve_ter_mudado
    O_Dropdown_deve_exibir_a_opcao    webdriver.io is awesome
