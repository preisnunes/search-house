from app.models import House

class HouseRepository():
    
    def __init__(self, session):
        self.session = session

    def save(self, house: House):
        self.session.add(house)
        self.session.commit()
    
    def get_by_external_id(self, external_id):
        try:
            return self.session.query(House).filter_by(external_id=external_id).one()
        except Exception as e:
            print(e.__class__)
            return None
        
