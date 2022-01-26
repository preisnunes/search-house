import imp
import os
import app.config as config
from flask import Flask
from flask_migrate import Migrate
from flask_sqlalchemy import SQLAlchemy
from flask_crontab import Crontab
from datetime import datetime
from app.repositories.region import RegionRepository
from app.repositories.house import HouseRepository
from app.scrapper import build_url, fetch_house_from

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


@crontab.job(minute=9)
def scrapper_job():
    region_repository = RegionRepository(db.session)
    house_repository = HouseRepository(db.session)
    region = region_repository.getRegionByName('Leiria')
    file_object = open('cron_scrapper.txt', 'a')
    for subregion in region.subregions:
        for city in subregion.cities:
            url = build_url(region, subregion, city)
            houses = fetch_house_from(city.id, url)
            for house in houses:
                house_repository.save(house)
            file_object.write(f"Job runned at {datetime.now()} found region and it will fetch houses from {url}\n")
    file_object.close()
