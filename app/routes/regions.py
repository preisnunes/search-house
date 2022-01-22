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
    return f"Region {data['name']} with id {region.id} added", 201

@regions.route('/regions', methods = ['GET'])
def get_all():
    regions = db.session.query(Region).all()
    print(regions)
    return 'All regions', 200

@regions.route('/region/<id>', methods = ['DELETE'])
def delete_region(id):
    region = db.session.query(Region).filter_by(id=id).one()
    db.session.delete(region)
    db.session.commit()
    return 'Region {region.name} deleted', 204