*** Keywords ***
Home validation
    Wait Until Page Contains    Home

Dado que o usuário está na tela de Drag
    Home validation
    Click Element    xpath=//android.view.View[@content-desc="Drag"]
    Wait Until Page Contains    Drag and Drop

Quando o usuário completa o Drag and Drop
    @{POSICOES}=    Create List    l1    c1    r1    l2    c2    r2    l3    c3    r3
    FOR    ${posicao}    IN    @{POSICOES}
        ${drag_xpath}=    Set Variable    //android.view.ViewGroup[@content-desc="drag-${posicao}"]/android.widget.ImageView
        ${drop_xpath}=    Set Variable    //android.view.ViewGroup[@content-desc="drop-${posicao}"]/android.view.ViewGroup
        Drag And Drop    ${drag_xpath}    ${drop_xpath}
    END

Então deve aparecer a mensagem de "Congratulations"
    Wait Until Page Contains    Congratulations

*** Keywords ***
Setup App
    [Documentation]    Abre o aplicativo Android
    Open Application    http://127.0.0.1:4723/wd/hub    platformName=${PLATFORM}    deviceName=${DEVICE_NAME}    app=${APP}

Teardown Suite
    [Documentation]    Fecha o app e ignora erros
   # Run Keyword And Ignore Error    Capture Page Screenshot
    Run Keyword And Ignore Error    Close Application
