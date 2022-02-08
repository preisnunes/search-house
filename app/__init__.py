import os
import app.config as config
import pika
import json
from flask import Flask
from flask_migrate import Migrate
from flask_sqlalchemy import SQLAlchemy
from flask_crontab import Crontab
from app.repositories.region import RegionRepository
from app.models import Region, Subregion, City

db = SQLAlchemy()
crontab = Crontab()

def create_app():
    app = Flask(__name__)
    app.config.from_object(config.get_config(os.environ['FLASK_ENV']))
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    db.init_app(app)
    crontab.init_app(app)    
    Migrate(app, db)
    from app.orm import houses_table, regions_table, subregions_table, cities_table, types_table
    from app.orm import start_mappers


    start_mappers()
    
    from app.routes.regions import regions
    from app.routes.subregions import subregions
    from app.routes.cities import cities
    
    app.register_blueprint(regions, url_prefix='/')
    app.register_blueprint(subregions, url_prefix='/')
    app.register_blueprint(cities, url_prefix='/')
    
    return app

def build_url(region :Region, subregion :Subregion, city: City):
	base_url = "https://www.imovirtual.com/comprar/moradia"
	region_query_string = 'search=[region_id]=' + str(region.external_id)
	subregion_query_string = 'search=[subregion_id]=' + str(subregion.external_id)
	city_query_string = 'search=[city_id]=' + str(city.external_id)
	return f"{base_url}/{city.name.replace(' ', '-')}-{subregion.name.replace(' ', '-')}/?{region_query_string}&{subregion_query_string}&{city_query_string}"


@crontab.job(minute=9)
def scrapper_job():
    connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
    channel = connection.channel()
    channel.queue_declare(queue='region-leiria')
    
    region_repository = RegionRepository(db.session)
    region = region_repository.getRegionByName('Leiria')
    
    for subregion in region.subregions:
        for city in subregion.cities:
            url = build_url(region, subregion, city)
            channel.basic_publish(
                exchange='',
                routing_key='region-leiria',
                body=json.dumps({
                    'url': url,
                    'city_id': city.id
                })
            )
    connection.close()
