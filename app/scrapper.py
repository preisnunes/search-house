import requests;
from bs4 import BeautifulSoup
from app.models import Region, Subregion, City, House

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


def build_url(region :Region, subregion :Subregion, city: City):
	base_url = "https://www.imovirtual.com/comprar/moradia"
	region_query_string = 'search=[region_id]=' + str(region.external_id)
	subregion_query_string = 'search=[subregion_id]=' + str(subregion.external_id)
	city_query_string = 'search=[city_id]=' + str(city.external_id)
	return f"{base_url}/{city.name}-{subregion.name}/?{region_query_string}&{subregion_query_string}&{city_query_string}"
	
def get_inside_area(html):
	return float(html.text.strip().replace(' ', '').replace(',', '.')[:-2])

def get_terraine_area(html):
	return float(html.text.strip().replace(' ', '').replace('terreno', '').replace(',', '.')[:-2])

def fetch_house_from(city_id, url):

	page = requests.get(url)
	soup = BeautifulSoup(page.content, 'html.parser')
	houses = []
	for ad in soup.find_all('article'):
		name = ad.find("span", class_="offer-item-title").text
		price = ad.find("li", class_="offer-item-price").text
		price = int(price.strip().replace(' ', '')[:-1])
		house = House(name=name, price=price)
		house.city_id = city_id
		areas_html = ad.find_all("li", class_="offer-item-area")
		inside_area = get_inside_area(areas_html[0])
		house.built_area = inside_area
		house.external_id = ad['data-item-id']
		house.type_id = 2
		if len(areas_html) == 2:
			house.total_area = get_terraine_area(areas_html[1])
		houses.append(house)
	return houses
