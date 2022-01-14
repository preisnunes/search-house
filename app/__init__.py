import os
import app.config as config
from flask import Flask, request
from flask_migrate import Migrate
from flask_sqlalchemy import SQLAlchemy
from flask_crontab import Crontab


db = SQLAlchemy()
crontab = Crontab()

def create_app():
    app = Flask(__name__)
    app.config.from_object(config.get_config(os.environ['FLASK_ENV']))
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    db.init_app(app)
    crontab.init_app(app)    
    Migrate(app, db)
    from app.models import House, Type, Region, Subregion
    
    from app.routes.regions import regions
    from app.routes.subregions import subregions
    app.register_blueprint(regions, url_prefix='/')
    app.register_blueprint(subregions, url_prefix='/')

    return app


@crontab.job(minute='0', hour="6")
def scrapper_job():
    pass
