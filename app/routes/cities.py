from flask import Blueprint, request
from flask_sqlalchemy import SQLAlchemy
from app.models import City
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