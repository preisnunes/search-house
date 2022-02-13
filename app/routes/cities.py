from flask import Blueprint, request, current_app
from flask_sqlalchemy import SQLAlchemy
from app.models import City
from app.repositories.city import CityRepository
from sqlalchemy import create_engine
from sqlalchemy.orm import Session

cities = Blueprint('cities', __name__)

db = SQLAlchemy()

@cities.route("/city", methods=['POST'])
def create_city():
    data = request.get_json()
    city = City(
        name=data['name'], 
        subregion_id=data['parent_id'], 
        external_id=data['external_id']
    )
    db.session.add(city)
    db.session.commit()
    return f"City {data['name']} added", 201

@cities.route("/city/<city_id>", methods=['PUT'])
def update_city(city_id):
    engine = create_engine(current_app.config['SQLALCHEMY_DATABASE_URI'])
    with Session(engine) as session:
        data = request.get_json()
        repository = CityRepository(session)
        city = repository.getById(city_id) 
        if not city:
            return f"City with id {city_id} does not exist", 404
        city.ready_for_updates = data.get('ready_for_updates', city.ready_for_updates)
        city.name = data.get('name', city.name)
        city.external_id = data.get('external_id', city.external_id)
        city.subregion_id = data.get('subregion_id', city.subregion_id)
        repository.update(city)
    return f"City with {city_id} updated", 200