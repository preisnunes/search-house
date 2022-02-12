import os
import app.config as config
from datetime import datetime
from flask import Flask
from flask_migrate import Migrate
from flask_sqlalchemy import SQLAlchemy
from flask_crontab import Crontab
from app.publisher import publish_sub_region_scrapper_events

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
    from app.routes.houses import houses
    
    app.register_blueprint(regions, url_prefix='/')
    app.register_blueprint(subregions, url_prefix='/')
    app.register_blueprint(cities, url_prefix='/')
    app.register_blueprint(houses, url_prefix='/')
    
    return app

@crontab.job(minute=20, args=('Leiria', 'Pombal'))
def scrapper_job(region, subregion):
    publish_sub_region_scrapper_events(region, subregion)

@crontab.job(minute=10, args=('Leiria', 'Leiria'))
def scrapper_job(region, subregion):
    publish_sub_region_scrapper_events(region, subregion)
