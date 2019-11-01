*** Settings ***
Suite Setup
Library  JSONLibrary
Library  XML
Library  os
Library  Collections
Library  RequestsLibrary
Library  XML
Library SeleniumLibrary

*** Variables ***
${base_url}      http://thomas-bayer.com

*** Test Cases ***
TC_1
    create session      mysession   ${base_url}
   ${response}=   get request     mysession       /sqlrest/CUSTOMER/15
   ${xml_string}=  convert to string     ${response.content}
   ${str_vrbl}=  parse xml   ${xml_string}
  ${ele_text}=   element text should be   ${str_vrbl}   15  .//ID
   log to console   ${ele_text}
