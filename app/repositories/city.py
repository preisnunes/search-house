from app.models import City
from sqlalchemy import update

class CityRepository():
    def __init__(self, session):
        self.session = session

    def getById(self, id :int):
        try:
            return self.session.query(City).filter_by(id=id).one()
        except Exception as e:
            return None
    
    def update(self, city :City):
        stmt = update(City).where(City.id == city.id).values(
            ready_for_updates=city.ready_for_updates, 
            name=city.name,
            external_id=city.external_id,
            subregion_id=city.subregion_id).execution_options()
        self.session.execute(stmt)
        self.session.commit()
        

    def save(self, city: City):
        self.session.add(city)
        self.session.commit()