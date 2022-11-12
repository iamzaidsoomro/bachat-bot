from subprocess import CompletedProcess
import requests
from bs4 import BeautifulSoup
import json
import array as arr

baseurl = 'https://outfitters.com.pk/'

headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36'
}

productLinks = [] 
price = []
img_urls = []




r = requests.get('https://outfitters.com.pk/collections/men-special-prices')

soup = BeautifulSoup(r.content, 'lxml')

productList = soup.find_all('a', class_='product-link-main')

for item in productList:
    for link in item.find_all('a', href=True):
        productLinks.append(baseurl + link['href'])


    for link in item.find_all('img', src=True):
        img_url = link['src']
        img_urls.append(img_url)





names = []
disc_prices = []
norm_prices = []


for link in productLinks:
        r = requests.get(link, headers=headers)
        soup = BeautifulSoup(r.content, 'lxml')

        name = soup.find('h2', class_='h1').text.strip()

        norm_price = (soup.find('s', class_="price-item price-item--regular").find('span', class_="money")).text.strip()
        
        disc_price = (soup.find('span', class_="price-item price-item--sale price-item--last")).find('span', class_="money").text.strip()

        names.append(name)
        disc_prices.append(disc_price)
        norm_prices.append(disc_price)



outfitters = {}
outfitters["name"] = names
outfitters["norm_price"] = norm_prices
outfitters["disc_price"] = disc_prices
outfitters["product_url"] = productLinks
outfitters["img_url"] = img_urls



# with open(r"E:\Web Scrapping\outfitters.json", 'a') as f:
#     json.dump(outfitters, f)

print("completed")



        


