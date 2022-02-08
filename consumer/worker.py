import pika
import requests
from bs4 import BeautifulSoup

def fetch_city_houses(city_id, url):
	page = requests.get(url)
	soup = BeautifulSoup(page.content, 'html.parser')

	pager = soup.find("ul", {"class" :"pager"})
	nb_pages = 1 if not pager else len(pager.find_all('li')) - 2
	city_houses = []
	
	for page_index in range(1, nb_pages + 1):
		city_houses += fetch_houses_from_page(city_id, url, page_index)

	return city_houses

def fetch_houses_from_page(city_id, url, page_index):
	url += f"&page={page_index}"
	page = requests.get(url)
	soup = BeautifulSoup(page.content, 'html.parser')
	houses = []
	print(url)
	for ad in soup.find_all('article'):
		name = ad.find("span", class_="offer-item-title").text
		price_text = ad.find("li", class_="offer-item-price").text
		price_text = price_text.strip().replace(' ', '')[:-1]
		price = None
		try:
			price = float(price_text)
		except ValueError:
			pass
		
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

def get_inside_area(html):
	return float(html.text.strip().replace(' ', '').replace(',', '.')[:-2])

def get_terraine_area(html):
	return float(html.text.strip().replace(' ', '').replace('terreno', '').replace(',', '.')[:-2])

print(' [*] Connecting to server ...')

connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
channel = connection.channel()
channel.queue_declare(queue='region-leiria', durable=False)

print(' [*] Waiting for messages.')

def fetch_city(ch, method, properties, body):
    print(" [x] Received %s" % body)
    event = body.decode()
    print(event['url'])
    ch.basic_ack(delivery_tag=method.delivery_tag)


channel.basic_qos(prefetch_count=1)
channel.basic_consume(queue='region-leiria', on_message_callback=fetch_city)
channel.start_consuming()