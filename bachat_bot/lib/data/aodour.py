from subprocess import CompletedProcess
import requests
from bs4 import BeautifulSoup
import json
import array as arr

baseurl = 'https://www.aodour.pk/'

headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36'
}

productLinks = [] 
price = []
img_urls = []

r = requests.get('https://www.aodour.pk/collection/skin-care-tools')

soup = BeautifulSoup(r.content, 'lxml')

productList = soup.find_all('div', class_='like-border')


for item in productList:
  for link in productList.find_all('a', href=True):
    productLinks.append(baseurl + item['href'])

    print(productLinks)


