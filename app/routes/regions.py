from flask import Blueprint, request
from flask_sqlalchemy import SQLAlchemy
from app.models import Region
regions = Blueprint('regions', __name__)

db = SQLAlchemy()

@regions.route('/region', methods = ['POST'])
def create_region():
    data = request.get_json()
    region = Region(name=data['name'], external_id=data['external_id'])
    db.session.add(region)
    db.session.commit()
    return f"Region {data['name']} added", 201

@regions.route('/regions', methods = ['GET'])
def get_all():
    regions = Region.query.all()
    print(regions)
    return 'All regions', 200