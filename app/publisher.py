import pika
import json
from datetime import datetime
from app.repositories.region import RegionRepository
from app.models import Region, Subregion, City
from flask import current_app
from sqlalchemy import create_engine
from sqlalchemy.orm import Session

def build_url(region :Region, subregion :Subregion, city: City):
	base_url = "https://www.imovirtual.com/comprar/moradia"
	region_query_string = 'search=[region_id]=' + str(region.external_id)
	subregion_query_string = 'search=[subregion_id]=' + str(subregion.external_id)
	city_query_string = 'search=[city_id]=' + str(city.external_id)
	return f"{base_url}/{city.name.replace(' ', '-')}-{subregion.name.replace(' ', '-')}/?{region_query_string}&{subregion_query_string}&{city_query_string}"

def publish_sub_region_scrapper_events(region_name, subregion_name):
    file_object = open('cron_scrapper.txt', 'a')
    file_object.write(f"Job runned at {datetime.now()} for region {region_name} and subregion {subregion_name}\n")
    connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
    channel = connection.channel()
    queue_name = f"region-{region_name.lower()}"
    channel.queue_declare(queue=queue_name)
    engine = create_engine(current_app.config['SQLALCHEMY_DATABASE_URI'])
    region = None
    
    with Session(engine) as session:
        region_repository = RegionRepository(session)
        region = region_repository.getRegionByName(region_name)
        for subregion in region.subregions:
            if subregion.name != subregion_name:
                continue
            for city in subregion.cities:
                url = build_url(region, subregion, city)
                file_object.write(f"Job runned at {datetime.now()} will publish event to fetch houses from {url}\n")
                channel.basic_publish(
                    exchange='',
                    routing_key=queue_name,
                    body=json.dumps({
                        'url': url,
                        'city_id': city.id
                    })
                )
    file_object.close()
    connection.close()
