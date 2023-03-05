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


    # get name
    if spellContent :
        spell_name = spellContent.find('h1').text
    else :
        spell_name = None
        continue
    print("name: ",spell_name)

    # get school and level
    school_levels = spellContent.find('b',string="School").find_previous('p')
    text = school_levels.text
    if ";" in text:
        parts = text.split(";")
    else:
        parts = text.split(":")
    spell_school = parts[0].replace("School","").strip()
    spell_level = parts[1].replace("Level","").strip()

    print("School: ",spell_school)
    print("Level:",spell_level)

    # get casting time
    castTime = []
    spell_castTime = spellContent.find('b',string="Casting Time")
    spell_castTime = getStringSiblings(castTime, spell_castTime, 'b')
    print("Cast time: ", spell_castTime)

    # get components 
    components = []
    spell_components = spellContent.find('b', string='Components')#.next_sibling.strip()
    spell_components = getStringSiblings(components, spell_components, 'p')
    print ("Components: ", spell_components)

    # get range
    rangesp = []
    spell_range = spellContent.find('b',string="Range")
    spell_range = getStringSiblings(rangesp, spell_range, 'b')
    print("Range: ", spell_range)

    # get target
    target = []
    spell_target = spellContent.find('b',string="Target")
    spell_target = getStringSiblings(target, spell_target, 'b')
    print("Target: ", spell_target)

    #get duration
    duration = []
    spell_duration = spellContent.find('b',string="Duration")
    spell_duration = getStringSiblings(duration, spell_duration, 'b')
    print("Duration: ",spell_duration)

    
    # get saving throw
    svthrow = []
    spell_saving_throw = spellContent.find('b',string='Saving Throw')
    spell_saving_throw = getStringSiblings(svthrow, spell_saving_throw, 'b')
    print("Saving throw: ", spell_saving_throw)

    # get resistance
    resistance = []
    spell_resistance = spellContent.find('b',string='Spell Resistance')
    spell_resistance = getStringSiblings(resistance, spell_resistance, 'b')
    print("Spell Resistance: ", spell_resistance)

    # get area
    area = []
    spell_area = spellContent.find('b',string='Area')
    spell_area = getStringSiblings(area, spell_area, 'b')
    print("Area:", spell_area )

    # get effect
    effect = []
    spell_effect = spellContent.find('b',string='Effect')
    spell_effect = getStringSiblings(effect, spell_effect, 'b')
    print('Effect: ',spell_effect)

    # get description 
    description = []
    
    print(" ----- ")
    print(" ")
    cpt += 1
    print("no: ",cpt)

    

   




