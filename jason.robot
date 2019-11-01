*** Settings ***
Library  Collections
Library  JSONLibrary
Library  os

*** Test Cases ***
tc_1: JSON test case
    ${sample1}=   load json from file  E:\sample.json
    ${first_name}=  get value from json   ${sample1}  $.firstName
    log to console  ${first_name[0]}
    should be equal  ${first_name[0]}  John

     ${saddress}=  get value from json   ${sample1}  $.address.streetAddress
    log to console  ${saddress}
    #should be equal  ${saddress}  John
    ${phn_num}=  get value from json   ${sample1}  $.phoneNumbers[1].type
    should be equal    ${phn_num[0]}   home

    ${numb}=  get value from json  ${sample1}  $.phoneNumbers[1].number
    should be equal    ${numb[0]}  0123-4567-8910
