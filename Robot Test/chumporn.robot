*** Settings ***
Library    Selenium2Library

*** Variables ***
${HOMEPAGE}    http://www.pcc.kmitl.ac.th/index.php
${BROWSER}    chrome
${FIVESECOND}    5.0
${TENSECOND}    10.0
${USERNAME}    admin
${PASSWORD}    13245

*** Keywords ***
Go to index
    Open Browser    ${HOMEPAGE}    ${BROWSER}

Go to online service page
    Click Link    css=#nav > ul > li.item-135 > a
    Page Should Contain    บริการออนไลน์

Go to club menu tab
    Mouse Over    dom=document.links[20]
    Wait Until Element Is Visible    css=.item-128 > a
    Click Link    css=.item-128 > a

*** Test Cases ***
Login invalid test
    Go to index
    Click Link    dom=document.links[54]
    Input Text    name=username    ${USERNAME}
    Input Password    name=password    ${PASSWORD}
    Click Button    css=#comp-i > div.login > form > fieldset > button
    Select Window    url=http://www.pcc.kmitl.ac.th/index.php/login?task=user.login
    Click Element    css=#error > div
    Wait Until Page Contains    invalid username    timeout=${FIVESECOND}
    Page Should Contain    ผิด
    [Teardown]    Close Browser

Login empty input test
    Go to index
    Click Link    dom=document.links[54]
    Input Text    name=username    ${USERNAME}
    Click Button    css=#comp-i > div.login > form > fieldset > button
    Location Should Be    http://www.pcc.kmitl.ac.th/index.php/login

Online service test one
    Go to online service page
    Click Link    dom=document.links[39]
    Select Window    url=http://regchumphon.kmitl.ac.th/registrar/index/index.php
    Wait Until Page Contains    ทะเบียน    timeout=${FIVESECOND}
    Page Should Contain    ประกาศ
    [Teardown]    Close Browser

Online service test two
    Go to index
    Go to online service page
    Click Link    dom=document.links[40]
    Select Window    url=https://webmail.kmitl.ac.th/mail/
    Wait Until Page Contains    เมล์    timeout=${FIVESECOND}
    Page Should Contain    mail
    [Teardown]    Close Browser

Online service test three
    Go to index
    Go to online service page
    Click Link    dom=document.links[41]
    Select Window    title=Central Library Homepage
    Wait Until Page Contains    สารนิเทศ    timeout=${FIVESECOND}
    Page Should Contain    สืบค้น
    Page Should Contain    ยืม
    Page Should Contain    คืน
    [Teardown]    Close Browser

Online service test four
    Go to index
    Go to online service page
    Click Link    dom=document.links[42]
    Select Window    url=http://161.246.199.31/forum/
    Wait Until Page Contains    web board    timeout=${FIVESECOND}
    Page Should Contain    เว็บบอร์ด
    Page Should Contain    ฟอรั่ม
    Page Should Contain    กระทู้
    [Teardown]    Close Browser

Go to robot club Facebook page
    Go to index
    Go to club menu tab
    Click Link    dom=document.links[39]
    Select Window    url=http://www.pcc.kmitl.ac.th/Robot%20Club%20Kmitl%20ChumphonCampus
    Page Should Not Contain    Not Found
    Wait Until Page Contains    facebook
    [Teardown]    Close Browser
    