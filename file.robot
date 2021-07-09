* Settings *
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary
Resource    ..keka\file.robot
Library     ..keka\search.xlsx
Libaray     ..keak\search.json
Libaray     ..keak\search.csv


* Variables *
${LOGIN URL}      https://www.imdb.com/
${BROWSER}        Firefox

* Test Cases *
Valid Open
    Open Browser To imdb page
Valid search
    Input search1    ${search1}
valid searchquery
    Submit SearchQuery
    Search
    Navigate
#    [Teardown]    Close Browser

* Keywords *
Open Browser To imdb page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    IMDb: Ratings, Reviews, and Where to Watch the Best Movies & TV Shows

Scroll Down
    Scroll Elements Into View  //footer[@class='imdb-footer VUGIPjGgHtzvbHiU19iTQ']

Input search1
    [Arguments]    ${search1}
    Input Text  //input[@id='suggestion-search']  ${search1}




Submit SearchQuery
    Click Button    //button[@id='suggestion-search-button']
