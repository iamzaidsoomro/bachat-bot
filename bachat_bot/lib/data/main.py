import requests
from bs4 import BeautifulSoup
url = "https://www.czone.com.pk/laptops-pakistan-ppt.74.aspx"

req = requests.get(url)

htmlContent = req.content

soup = BeautifulSoup(htmlContent, 'html.parser')

#print(soup.prettify)

#title = soup.title

#print(type(title))

#paras = soup.find_all('p')

#print(paras)




#print(anchors)

#print(soup.find('p')['class'])

#print(soup.find_all("p", class_="mt-2', 'text-sm', 'text-gray-500', 'md:text-base', 'dark:text-gray-400"))

all_links = set()

anchors = soup.find_all('a')

#for link in anchors:
 #   if(link.get('href') != '#'):
       # linktext = "https://www.czone.com.pk/" + link.get('href')
        #all_links.add(link)
        #print(linktext)



#print(soup.find_all("p", class_="product"))

products = soup.find( class_ = "product")


names = soup.find_all('a')
#print(names)

#a_href=soup.find('a',{"class":" product"}).get("href")

#cls
#print(a_href)

for a in soup.find_all('a', href=True):
    print("Found the URL:", a['href'])




