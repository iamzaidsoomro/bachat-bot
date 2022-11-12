from subprocess import CompletedProcess
import requests
from bs4 import BeautifulSoup
import json
import array as arr

baseurl = 'https://pk.sapphireonline.pk/'

headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36'
}

productLinks = [] 
price = []
img_urls = []

r = requests.get('https://pk.sapphireonline.pk/collections/unstitched-special-sale')

soup = BeautifulSoup(r.content, 'lxml')

productList = soup.find_all('div', class_='t4s-product-wrapper')


for item in productList:
    for link in item.find_all('a', href=True):
        productLinks.append(baseurl + link['href'])

        

    for link in item.find_all('img', src=True):
        img_url = link['src']
        img_urls.append(img_url)



names = []
disc_prices = []
norm_prices = []
descriptions = []

logo_url = "//cdn.shopify.com/s/files/1/1592/0041/files/new-logo_1f3ed6e3-32c6-4685-bfa1-3bbdf6ce9ba1.png?v=1661156941&width=200"

for link in productLinks:
    r = requests.get(link, headers=headers)
    soup = BeautifulSoup(r.content, 'lxml')

    name = soup.find('h1', class_='t4s-product__title').text.strip()

    description = soup.find('section', class_='sample').find('p').text.strip()

    norm_price = soup.find('del').find('span', class_='money').text.strip()

    disc_price = soup.find('ins').find('span', class_='money').text.strip()

    names.append(name)
    disc_prices.append(disc_price)
    norm_prices.append(norm_price)
    descriptions.append(description)






sapphire = {}
sapphire["logo_url"] = logo_url
sapphire["name"] = names
sapphire["norm_prices"] = norm_prices
sapphire['disc_prices'] = disc_prices
sapphire['product_url'] = productLinks
sapphire['image_url'] = img_urls
sapphire['description'] = descriptions


with open(r"E:\Web Scrapping\sapphire.json", 'a') as f:
    json.dump(sapphire, f)

print("completed")


    
    
