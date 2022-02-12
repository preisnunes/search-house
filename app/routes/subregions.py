from flask import Blueprint, request
from flask_sqlalchemy import SQLAlchemy
from app.models import Subregion

subregions = Blueprint('subregions', __name__)

db = SQLAlchemy()

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