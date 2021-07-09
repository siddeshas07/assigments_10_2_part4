# assigments_10_2_part4


4. Understand and implement Test data maintenance.
<br></br>

    External file collaboration for test data or other aspects
    .config
    .xlsx
    .txt
    other files
    
 
 
exporting to differnt files

filename as.py


    import time
from selenium import webdriver
import json
from xlwt import Workbook

driver = webdriver.Chrome(r'C:\Users\ASSiddesh\Downloads\chromedriver_win32 (1)\chromedriver')
try:
    driver.get("https://www.imdb.com/?ref_=nv_home")
    links = driver.find_elements_by_tag_name('a')
    links_arr = []
    for link in links:
        links_arr.append(link.get_attribute('href'))

    link_dict = {}
    l = len(links_arr)
    for i in range(l):
        if (links_arr[i] == None):
            continue
        link_dict[i] = links_arr[i]

    # json file handling
    with open("link_json.json", "w") as write_file:
        json.dump(link_dict, write_file, indent=4)
    print(link_dict)
    time.sleep(3)

    # excel file handling
    wb = Workbook()
    sheet1 = wb.add_sheet('Sheet 1')
    for i in range(l):
        if (links_arr == None):
            continue
        sheet1.write(i, 0, links_arr[i])
    wb.save('xlwt example.xls')

    # txt file handling
    file = open('Text.txt', 'w')
    file.write(str(links_arr))
    file.close()

    driver.close()
except Exception as e:
    print(e)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    importing differnt file to robot 
    
    
   filename file.robot 
    
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



