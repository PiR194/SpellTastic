# import urllib.request 
# import requests
# import bs4
# from bs4 import BeautifulSoup
# from lxml import html

# URL = "https://www.d20pfsrd.com/magic/all-spells/b/battering-blast/"

# responseDetails = requests.get(URL)
# spellSoup = BeautifulSoup(responseDetails.content, 'lxml')
# spellContent = spellSoup.find(id='article-content')
# print(spellContent)

# spell_duration = spellContent.find('b',string='Duration')
# if spell_duration:
#     if spell_duration.next_sibling is not None:
#         spell_duration = spell_duration.next_sibling.text.strip()
#     else :
#         print("fix here ---")
#         print("first: ", spell_duration)
#         spell_duration = spell_duration.find_next('br')
#         print("next br: ", spell_duration)
#         spell_duration = spell_duration.find_previous_sibling('')
#         print(spell_duration)
# else :
#     spell_duration = None
# print("Duration: ",spell_duration)
# print("Duration: ",spell_duration)

import requests
from bs4 import BeautifulSoup

url = 'https://www.d20pfsrd.com/magic/all-spells/b/battering-blast'
response = requests.get(url)

soup = BeautifulSoup(response.text, 'html.parser')

duration_tag = soup.find('div', text='Duration')
duration = duration_tag.find_next('div').string.strip()

saving_throw_tag = soup.find('div', text='Saving Throw')
saving_throw = saving_throw_tag.find_next('div').string.strip()