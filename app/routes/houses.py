from flask import Blueprint, request
from flask_sqlalchemy import SQLAlchemy
from app.models import House
houses = Blueprint('houses', __name__)

db = SQLAlchemy()

@houses.route("/house", methods=['POST'])
def create_house():
    data = request.get_json()
    house = House(
        name = data['name'],
        external_id = data['external_id'],
        price =  data['price'],
        built_area = data['built_area'],
        total_area = data['total_area'],
        typology = data['typology']
    )
    house.type_id = data['type_id']
    house.city_id = data['city_id']
    db.session.add(house)
    db.session.commit()
    return f"House with id {data['external_id']} added", 201