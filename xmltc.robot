*** Settings ***
Library  XML
Library  os
Library  Collections

*** Test Cases ***
tc1:
    ${xml_obj}=  parse xml    e:\books.xml
    element text should be   ${xml_obj}  Gambardella, Matthew     .//book[1]/author

    #Validation points
    ${counts_book}=  get element count   ${xml_obj}  .//book
    log to console  ${counts_book}
    should be equal as Integers   ${counts_book}   12

    ${get_ele}=    get element text
