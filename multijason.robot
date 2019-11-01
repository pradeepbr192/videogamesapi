*** Settings ***
Library  JSONLibrary
Library  os
Library  Collections
Library  RequestsLibrary

*** Variables ***
${base_url}=  https://restcountries.eu

*** Test Cases ***
tc_1: Single connectivity
  create session   mysession  ${base_url}
  ${body_res}=  get request  mysession  rest/v2/alpha/IN
  ${content_r}=  to json  ${body_res.content}
  ${res}=  get value from json  ${content_r}  $.name
  log to console   ${res}
tc_2:
    create session  mysession1  ${base_url}
    ${resp2}=  get request  mysession1  rest/v2/alpha/IN
    ${resp2_cont}=  to json  ${resp2.content}
    ${stores}=  get value from json  ${resp2_cont}  $.languages[0].name
    log to console  ${stores[0]}


