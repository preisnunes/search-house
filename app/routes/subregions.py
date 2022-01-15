from flask import Blueprint, request
from app import db
from app.models import Subregion
subregions = Blueprint('subregions', __name__)

@subregions.route("/subregion", methods=['POST'])
def create_subregion():
    data = request.get_json()
    subregion = Subregion(
        name=data['name'], 
        region_id=data['parent_id'], 
        external_id=data['external_id']
    )
    db.session.add(subregion)
    db.session.commit()
    return f"Subregion {data['name']} added", 201