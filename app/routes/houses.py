from flask import current_app
from flask import Blueprint, request
from sqlalchemy.orm import Session
from app.models import House
from app.repositories.house import HouseRepository
from sqlalchemy import create_engine
houses = Blueprint('houses', __name__)

@houses.route("/house", methods=['POST'])
def create_house():
    engine = create_engine(current_app.config['SQLALCHEMY_DATABASE_URI'])
    with Session(engine) as session:
        data = request.get_json()
        repository = HouseRepository(session)
        if repository.get_by_external_id(data['external_id']):
            return f"House with id {data['external_id']} already exists", 409
    
        house = House(
            name = data['name'],
            external_id = data['external_id'],
            price =  data['price'],
            url =  data['url'],
            built_area = data['built_area'],
            total_area = data.get('total_area', None),
            typology = data['typology']
        )
        house.type_id = data['type_id']
        house.city_id = data['city_id']
        repository.save(house)
    return f"House with id {data['external_id']} added", 201