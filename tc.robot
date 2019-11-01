*** Settings ***
Library   Collections
Library   RequestsLibrary


*** Variables ***
${base_url}  http://localhost:8080

*** Test Cases ***
tc1_get request
    create session  mysession  ${base_url}
    ${result}=  get request  mysession  /app/videogames
    log to console     ${result.status_code}
    log to console  ${result.content}
    #${scode}=  convert to string   ${result.status_code}
    #should be equal  ${scode}  200

tc2_Post request
    create session  mysession   ${base_url}
    ${body}=  create dictionary     id=124  name=pradeep33  releaseDate=2019-10-23T02:20:12.818Z  reviewScore=0  category=games1  rating=string
    ${header}=  create dictionary  Content-Type=application/json
    ${resp}=  post request  mysession  /app/videogames  data=${body}  headers=${header}
    log to console  ${resp.status_code}
    log to console  ${resp.content}
    #Validations
    ${code}=  convert to string  ${resp.status_code}
    should be equal  ${code}  200
    ${contents}=  convert to string  ${resp.content}
    should contain  ${contents}  Record Added Successfully

tc3_getting single video game
     create session  mysession   ${base_url}
    ${resp}=  get request  mysession  /app/videogames/124
    log to console  ${resp.status_code}
    log to console  ${resp.content}
    #Validations
    ${code}=  convert to string  ${resp.status_code}
    should be equal  ${code}  200
    ${contents}=  convert to string  ${resp.content}
    should contain  ${contents}  pradeep33

tc4_Put test case
     create session  mysession  ${base_url}
     ${modi}=  create dictionary  id=124  name=pradeep33  releaseDate=2019-10-23T02:20:12.818Z  reviewScore=0  category=games1  rating=string
     ${changename}=  create dictionary  Content-Type=application/json
     ${resp}=  put request  mysession  /app/videogames/124  data=${modi}  headers=${changename}
     log to console  ${resp.content}
     ${conn}=  convert to string  ${resp.content}
