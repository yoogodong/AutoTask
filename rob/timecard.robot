*** Settings ***
Documentation	Suite description
Library         Selenium2Library
Library         BuiltIn
Library         Dialogs
Suite Setup     Open Browser	http://our.thoughtworks.com     chrome
Suite Teardown  Close Browser

*** Test Cases ***
Test title
  ${title}=  Get Title
  Run Keyword If  '登录' in '${title}'  Login  ygdong
  ${location}=  Get Location
  Run Keyword If  'token' in '${location}'  Token
  Timecard



*** Keywords ***
Login
  [Arguments]     ${id}
  Input Text  okta-signin-username  ${id}
  ${pwd}=  Get Value From User  the password for ${id}  hidden=yes
  Input Password  okta-signin-password  ${pwd}
  Click Button  okta-signin-submit
  Wait Until Element Is Not Visible  okta-signin-submit

Token
  ${token}=  Get Value From User  input token
  Input Text  input70  ${token}
  Submit Form  form63

Timecard
#  ${timecardLink}=  Get Element
  Wait Until Page Contains Element  link=Timecards
  Click Link  link=Timecards
  Wait Until Page Contains Element  name=pse__time_entry
  Click Button  name=pse__time_entry

