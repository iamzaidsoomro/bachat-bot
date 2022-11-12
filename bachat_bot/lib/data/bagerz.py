from subprocess import CompletedProcess
import requests
from bs4 import BeautifulSoup
import json
import array as arr

baseurl = 'https://www.bagerz.com/'

headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36'
}

productLinks = [] 
price = []
product_urls = []
img_urls = []

for x in range(1,7):
    r = requests.get(f'https://www.bagerz.com/collections/sale?page={x}')

    soup = BeautifulSoup(r.content, 'lxml')

    productList = soup.find_all('div', class_='row')

    for item in productList:
        for link in item.find_all('a', href=True):
            productLinks.append(baseurl + link['href'])
            product_urls.append(productLinks)
            

        for link in item.find_all('img', src=True):
            img_url = link['src']
            img_urls.append(img_url)




names = []
prices = []
ratings = []


for link in productLinks:
    r = requests.get(link,headers=headers)
    soup = BeautifulSoup(r.content, 'lxml')

    name = soup.find('h1', class_="product_title entry-title").text.strip()
    print(name)