from datetime import datetime
from dataclasses import dataclass, field
from typing import List

@dataclass
class House:
    id: int = field(init=False)
    name: str = None
    type_id: int = field(init=False)
    city_id: int = field(init=False)
    external_id: str = None
    price: int = None
    built_area: float = None
    total_area: float = None
    url: str = None
    typology: str = None
    created_on: datetime = None
    updated_on: datetime = None

@dataclass
class Type:
    id: int = field(init=False)
    name: str = None
    houses: List[House] = field(default_factory=list)

    def __repr__(self):
        return '<name {}>'.format(self.name)

@dataclass
class City:
    id: int = field(init=False)
    name: str = None
    external_id: int = None
    subregion_id: int = None
    houses: List[House] = field(default_factory=list)


@dataclass
class Subregion:
    id: int = field(init=False)
    name: str = None
    external_id: int = None
    region_id: int = None
    cities: List[City] = field(default_factory=list)

@dataclass
class Region:
    id: int = field(init=False)
    name: str = None
    external_id: int = None
    subregions: List[Subregion] = field(default_factory=list)

    def __repr__(self):
        return '<id {} name {} external_id {}>'.format(
            self.id, 
            self.name, 
            self.external_id
        )