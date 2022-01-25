from app.models import Region

class RegionRepository():
    def __init__(self, session):
        self.session = session

    def getRegionByName(self, name):
        return self.session.query(Region).filter_by(name=name).one()
