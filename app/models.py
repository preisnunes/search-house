from datetime import datetime
from . import db

class Region(db.Model):
    __tablename__ = 'regions'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(), nullable=False)
    external_id = db.Column(db.Integer, nullable=False)
    subregions = db.relationship('Subregion')

class Subregion(db.Model):
    __tablename__ = 'subregions'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(), nullable=False)
    external_id = db.Column(db.Integer, nullable=False)
    region_id = db.Column(db.Integer(), db.ForeignKey('regions.id'))
    cities = db.relationship('City')

class City(db.Model):
    __tablename__ = 'cities'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(), nullable=False)
    external_id = db.Column(db.Integer, nullable=False)
    subregion_id = db.Column(db.Integer(), db.ForeignKey('subregions.id'))
    houses = db.relationship('House')
    
class Type(db.Model):
    __tablename__ = 'types'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(), nullable=False)
    houses = db.relationship('House', backref='type')

    def __init__(self, name):
        self.name = name
       

    def __repr__(self):
        return '<name {}>'.format(self.name)


class House(db.Model):
    __tablename__ = 'houses'

    id = db.Column(db.Integer, primary_key=True)
    external_id = db.Column(db.String(), nullable=False)
    name = db.Column(db.String(), nullable=False)
    price = db.Column(db.Integer, nullable=False)
    built_area = db.Column(db.Float, nullable=False)
    total_area = db.Column(db.Float)
    typology = db.Column(db.String())
    url = db.Column(db.String())
    type_id = db.Column(db.Integer(), db.ForeignKey('types.id'))
    city_id = db.Column(db.Integer(), db.ForeignKey('cities.id'))
    created_on = db.Column(db.DateTime(), default=datetime.utcnow)
    updated_on = db.Column(db.DateTime(), default=datetime.utcnow, onupdate=datetime.utcnow)

    def __init__(self, name, price):
        self.name = name
        self.price = price
       

    def __repr__(self):
        return '<id {} name {}>'.format(self.id, self.name)