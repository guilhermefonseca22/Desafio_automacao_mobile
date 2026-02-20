*** Settings ***
Library    AppiumLibrary
Resource    ./home.resource

*** Keywords ***
Dado que o usuário está na tela de forms
    Home validation
    Click Element    //android.view.View[@content-desc="Forms"]
    Wait Until Page Contains    Form components
Quando o usuário escreve "Ótimo app, parabéns!" no campo Input field:
    Input Text    xpath=//android.widget.EditText[@content-desc="text-input"]    text=Ótimo app, parabéns!
E o usuário clica no botão de switch
    ${switch_state}    Get Element Attribute    //android.widget.Switch[@content-desc="switch"]    checked
    Should Be Equal    ${switch_state}    false
    Click Element    //android.widget.Switch[@content-desc="switch"]
E Seleciona a opção no Dropdown
    [Arguments]    ${opcao}
    Click Element    xpath=//android.widget.EditText[@resource-id="text_input"]
    Wait Until Element Is Visible    xpath=//android.widget.CheckedTextView[@resource-id="android:id/text1" and @text="${opcao}"]
    Click Element    xpath=//android.widget.CheckedTextView[@resource-id="android:id/text1" and @text="${opcao}"]

Então a mensagem deve ser exibida no campo "You have typed"
    Element Text Should Be    xpath=//android.widget.TextView[@content-desc="input-text-result"]    Ótimo app, parabéns!
E o switch deve ter mudado
    ${switch_state}    Get Element Attribute    //android.widget.Switch[@content-desc="switch"]    checked
    Should Be Equal    ${switch_state}    true
O Dropdown deve exibir a opção
    [Arguments]    ${opcao}
    Element Text Should Be    xpath=//android.widget.EditText[@resource-id="text_input"]    ${opcao}