from app.models import House

class HouseRepository():
    
    def __init__(self, session):
        self.session = session

    def save(self, house: House):
        self.session.add(house)
        self.session.commit()
