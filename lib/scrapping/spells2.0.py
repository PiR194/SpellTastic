import urllib.request 
import requests
import bs4
from bs4 import BeautifulSoup
from lxml import html

### -------------------------------------
# GET ALL THE SPELLS FROM THE PAGE
### -------------------------------------
###################
### VARIABLES
###################
## GET <li> ELEMENTS NAME + URL TO DETAIL PAGE
# url with all spells
URL = "https://www.d20pfsrd.com/magic/all-spells/"

# get the page content using GET to url
response = requests.get(URL)

# parse html using
soup = BeautifulSoup(response.content, 'lxml')

# i printed the content just to check
# print(soup)

# get all spells
list = soup.find(id='article-content').find_next('div',class_="flexbox")
#print(list)

#uls = list.find_all('ul')
#print(uls)

# this gets all the <li> elements from the article-content div, which contain all of the 
# spells (name and link to detail page)
lis = list.find_all('li')
# print(lis)

# checked by writting names on a file
#with open('spellzz.txt', 'w') as f:
#    for li in lis:
#        text = li.a.text
#        f.write(text + '\n')

###################
### METHODS
###################

def getStringSiblings(array, content, stop):
    if content:
        for sibling in content.next_siblings:
            if sibling.name == stop:
                break
            if sibling.name == 'a':
                array.append(sibling.text)
            elif isinstance((sibling), bs4.element.NavigableString):
                component_text = sibling.string.strip()
                if component_text:
                    array.append(component_text.rstrip(';'))
    else:
        return None
    return ' '.join(array)
    
cpt = 0 
## GET ALL DETAILS FROM EACH SPELL
for li in lis:
    url = li.a['href']
    #print(url)

    ## get html of details page
    responseDetails = requests.get(url)
    spellSoup = BeautifulSoup(responseDetails.content, 'lxml')

    # get article content which contains all info about spells
    spellContent = spellSoup.find(id='article-content')
#    print(spellContent) # check if good

###################
### ATTRIBUTES
###################

    spell_string = []
    ps = []

    allps = spellContent.find_all('p')

    for a in allps :
        spell_string.append(a.text)

    print(spell_string)
    exit(0)

    

   




