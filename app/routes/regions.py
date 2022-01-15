from flask import Blueprint, request
from app import db
from app.models import Region
regions = Blueprint('regions', __name__)

@regions.route("/region", methods=['POST'])
def create_region():
    data = request.get_json()
    region = Region(name=data['name'], external_id=data['external_id'])
    db.session.add(region)
    db.session.commit()
    return f"Region {data['name']} added", 201