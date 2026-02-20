*** Settings ***
Library     AppiumLibrary
Library     String
Library     OperatingSystem
Resource    ../resources/session/session.resource
Resource    ../resources/page_object/android/swipe.resource

Test Setup       Start Session
Test Teardown    End Session

*** Variables ***
${safe_test_name}    NONE

*** Test Cases ***
Cenario_10_Usuario_faz_swipe
    [Documentation]    Validação do swipe na tela
    # Define a variável safe_test_name para uso em logs ou teardown
    Set Suite Variable    ${safe_test_name}    ${TEST NAME}
    Dado que o usuário está na tela de swipe
    Quando o usuário clica para fazer swipe para a esquerda na tela
    Então a tela deve realizar swipe e deve aparecer o próximo item "Great Community"
