import requests;
from bs4 import BeautifulSoup
from models import House
from app import db

regions = [{
	"id": 5,
	"name": "leiria",
	"subregions": [{
		"id": 140,
		"name":"leiria",
		"cities": [
			{
				"name": "bajouca",
				"id": 10495001
			}
		]
	}]	
}]

base_url = "https://www.imovirtual.com/comprar/moradia/"
def build_urls():
	urls = []
	for region in regions:
		for subregion in region['subregions']:
			for city in subregion['cities']:
				region_query_string = 'search=[region_id]=' + str(region['id'])
				subregion_query_string = 'search=[subregion_id]=' + str(subregion['id'])
				city_query_string = 'search=[city_id]=' + str(city['id'])
				urls.append(base_url + city['name']+ '-' + subregion['name'] + '/?' + region_query_string + '&' + subregion_query_string + '&' + city_query_string)
	return urls

urls = build_urls()

def get_inside_area(html):
	return float(html.text.strip().replace(' ', '').replace(',', '.')[:-2])

def get_terraine_area(html):
	return float(html.text.strip().replace(' ', '').replace('terreno', '').replace(',', '.')[:-2])

for url in urls:
	page = requests.get(url)
	soup = BeautifulSoup(page.content, 'html.parser')

	for ad in soup.find_all('article'):
		name = ad.find("span", class_="offer-item-title").text
		price = ad.find("li", class_="offer-item-price").text
		price = int(price.strip().replace(' ', '')[:-1])
		house = House(name=name, price=price)
		areas_html = ad.find_all("li", class_="offer-item-area")
		inside_area = get_inside_area(areas_html[0])
		house.built_area = inside_area
		house.external_id = ad['data-item-id']
		house.url = url
		house.type_id = 2
		if len(areas_html) == 2:
			house.total_area = get_terraine_area(areas_html[1])
		
		db.session.add(house)
		db.session.commit()

