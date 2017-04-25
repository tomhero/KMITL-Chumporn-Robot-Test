*** Settings ***
Library    Selenium2Library

*** Variables ***
${HOMEPAGE}    http://www.pcc.kmitl.ac.th/index.php
${BROWSER}    chrome
${FIVESECOND}    5.0
${TENSECOND}    10.0

*** Keywords ***
Go to index
    Open Browser    ${HOMEPAGE}    ${BROWSER}

Go to online service page
    Click Link    dom=document.links[32]
    Page Should Contain    บริการออนไลน์

*** Test Cases ***
Online service test one
    Go to index
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
    Wait Until Page Contains    สารนิเทศ    timeout=${TENSECOND}
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
