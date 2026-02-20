*** Settings ***
Library    AppiumLibrary

*** Keywords ***
Home validation
    [Documentation]    Verifica se a tela inicial do app está visível
    Wait Until Page Contains    Support    timeout=10s
