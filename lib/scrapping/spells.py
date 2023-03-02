import urllib.request 
import requests
import bs4
from bs4 import BeautifulSoup
from lxml import html

### -------------------------------------
# GET ALL THE SPELLS FROM THE PAGE
### -------------------------------------

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

    # get name
    spell_name = spellContent.find('h1').text
    print("name: ",spell_name)

    # get school
    spell_school = spellContent.find('b', string='School').find_next_sibling('a').text.strip()
    print("school: ", spell_school)

    # get level
    levels = spellContent.find('b', string='Level').find_next_siblings('a')
    #print("level: ", spell_level)

    spell_level = []
    for i in levels : 
        if i.name == 'a':
            spell_level.append(i.text.strip())

    # print(spell_level) # check if gutten

    # get casting time
    spell_castTime = spellContent.find('b', string='Casting Time').next_sibling.strip() # nao ta em balisa entao next_sibling sem parenthesis como um attributo
    print("cast time: ", spell_castTime)

    # get components 
    components = []
    spell_components = spellContent.find('b', string='Components')#.next_sibling.strip()
    if spell_components:
        for sibling in spell_components.next_siblings:
            if sibling.name == 'p': # if end of p tag
                break
            if sibling.name == 'a': # if href we want to just get text
                spell_components.append(sibling.text)
            elif isinstance(sibling, bs4.element.NavigableString): # if its just random a** text in no specific <tag>
                component_text = sibling.string.strip()
                if component_text:
                    spell_components.append(component_text)
    spell_components = ', '.join(spell_components) # final touch :chef's_kiss:
    print(spell_components)

    # get range
    range_tag = spellContent.find('b', text='Range')
    if range_tag:
        try:
            spell_range = range_tag.find_next_sibling('a').text.strip()
        except AttributeError: # In case there isn't a RANGE section at all ------------- ! 
            spell_range = range_tag.next_sibling.strip()
    else:
        spell_range = None
    print("Range: ", spell_range)

    # get target
    target = []
    spell_target = spellContent.find('b', string='Target')#.next_sibling.strip()
    if spell_target:
        for sibling in spell_target.next_siblings:
            if sibling.name == 'p' or sibling.name == 'br': # if end of p tag
                break
            if sibling.name == 'a': # if href we want to just get text
                target.append(sibling.text)
            elif isinstance(sibling, bs4.element.NavigableString): # if its just random a** text in no specific <tag>
                component_text = sibling.string.strip()
                if component_text:
                    target.append(component_text)
        spell_target = ' '.join(target) # final touch :chef's_kiss:
    else :
        spell_target = None
    print("Target: ", spell_target)

    #get duration
    spell_duration = spellContent.find('b',string='Duration').next_sibling.text.strip()
    print("Duration: ",spell_duration)

    
    # get saving throw
    svthrow = []
    spell_saving_throw = spellContent.find('b',string='Saving Throw')
    if spell_saving_throw :
        for sibling in spell_saving_throw.next_siblings:
            if sibling.name == 'b':
                break
            if sibling.name == 'a':
                svthrow.append(sibling.text)
            elif isinstance((sibling), bs4.element.NavigableString):
                component_text = sibling.string.strip()
                if component_text:
                    target.append(svthrow)
        print(svthrow)

    print(spell_saving_throw)

    exit(0)

   





