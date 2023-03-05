import urllib.request 
import requests
import bs4
from bs4 import BeautifulSoup
from lxml import html

URL = "https://www.d20pfsrd.com/magic/all-spells/y/youthful-appearance/"

responseDetails = requests.get(URL)
spellSoup = BeautifulSoup(responseDetails.content, 'lxml')
spellContent = spellSoup.find(id='article-content')

###################
### DESCRIPTION
###################
spell_description = spellContent.find('p',string='DESCRIPTION')
print("Desc separator: ", spell_description)

spell_paragraphs = []
spell_description = spell_description.find_next('p')

while spell_description and not spell_description.find_previous('div', {'class': 'section15'}):
    if spell_description.has_attr('class'):
        spell_paragraphs.append(spell_description.text)
    else:
        spell_paragraphs.append(spell_description.text)
    spell_description = spell_description.find_next('p')

print("Spell description:\n", '\n\n'.join(spell_paragraphs))

def getStringSiblings(array, content, stop):
    if content:
        for sibling in content.next_siblings:
            print(sibling)
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

###################
### TARGET
###################
# target = []
# spell_target = spellContent.find('b',string="Target")
# spell_target = getStringSiblings(target, spell_target, 'b')
# print("Target: ", spell_target)

###################
### LEVELS
###################
# p = spellContent.find('b',string="School")
# print(p)
# p = p.find_previous('p')
# print(p)
# text = p.text
# print(text)
# parts = text.split("Level")
# school = parts[0].replace("School","").strip().strip(";")
# level = parts[1].replace("Level","").strip()

# print("---")
# print("School:", school)
# print("Level:", level)

# def getDescription(array, content):
#     if content:
#         content = content.find_next()
#         array.append(content.text)
#         if 

# def getStringSiblings(array, content, stop):
#     if content:
#         for sibling in content.next_siblings:
#             if sibling.name == stop:
#                 break
#             if sibling.name == 'a':
#                 array.append(sibling.text)
#             elif isinstance((sibling), bs4.element.NavigableString):
#                 component_text = sibling.string.strip()
#                 if component_text:
#                     array.append(component_text.rstrip(';'))
#     else:
#         return None
#     return ' '.join(array)

###################
### DURATION
###################

# spell_duration = spellContent.find('b',string='Duration')
# if spell_duration:
#     if spell_duration.next_sibling is not None:
#         spell_duration = spell_duration.next_sibling.text.strip()
#     else :
#         print("fix here ---")
#         print("first: ", spell_duration)
#         spell_duration = spell_duration.find_next('br')
#         print(spell_duration)
# else :
#     spell_duration = None
# print("Duration: ",spell_duration)
# print("Duration: ",spell_duration)