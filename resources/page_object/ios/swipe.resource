*** Settings ***
Library    AppiumLibrary
Resource    ./home.resource   # Ajuste caminho se necessário

*** Keywords ***
Dado que o usuário está na tela de swipe
    Click Element    xpath=//android.view.View[@content-desc="Swipe"]
    Wait Until Element Is Visible    xpath=(//android.view.ViewGroup[@content-desc="card"])[1]

Quando o usuário clica para fazer swipe para a esquerda na tela
    ${element}=    Get Webelement    xpath=(//android.view.ViewGroup[@content-desc="card"])[1]
    ${location}=   Get Element Location    ${element}
    ${size}=       Get Element Size        ${element}

    ${start_x}=    Evaluate    ${location['x']} + ${size['width']} * 0.8
    ${start_y}=    Evaluate    ${location['y']} + ${size['height']} / 2
    ${end_x}=      Evaluate    ${location['x']} + ${size['width']} * 0.2
    ${end_y}=      ${start_y}

    Swipe    start_x=${start_x}    start_y=${start_y}    end_x=${end_x}    end_y=${end_y}    duration=500

Então a tela deve realizar swipe e deve aparecer o próximo item "Great Community"
    Wait Until Page Contains    GREAT COMMUNITY
