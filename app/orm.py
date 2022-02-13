from sqlalchemy import Table, Column, Integer, String, DateTime, ForeignKey, Float, Boolean
from sqlalchemy.orm import registry, relationship
from datetime import datetime
import app.models as models
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()
metadata = Base.metadata

mapper_registry = registry(metadata=metadata)

regions_table = Table(
    "regions",
    metadata,
    Column('id', Integer, primary_key=True, autoincrement=True),
    Column("name", String(255), nullable=False),
    Column('external_id', Integer, nullable=False),
)

subregions_table = Table(
    "subregions",
    metadata,
    Column('id', Integer, primary_key=True, autoincrement=True),
    Column("name", String(255), nullable=False),
    Column('external_id', Integer, nullable=False),
    Column("region_id", ForeignKey("regions.id")),
)

cities_table = Table(
    "cities",
    metadata,
    Column('id', Integer, primary_key=True, autoincrement=True),
    Column("name", String(255), nullable=False),
    Column('external_id', Integer, nullable=False),
    Column("subregion_id", ForeignKey("subregions.id")),
    Column("ready_for_updates", Boolean, default=False)
)

types_table = Table(
    "types",
    metadata,
    Column('id', Integer, primary_key=True, autoincrement=True),
    Column("name", String(255), nullable=False)
)

houses_table = Table(
    "houses",
    metadata,
    Column('id', Integer, primary_key=True, autoincrement=True),
    Column("name", String(255), nullable=False),
    Column('external_id', String(255), nullable=False),
    Column('price', Float, nullable=True),
    Column('built_area', Float, nullable=False),
    Column('total_area', Float),
    Column("typology", String(255)),
    Column("url", String(255)),
    Column("type_id", ForeignKey("types.id")),
    Column("city_id", ForeignKey("cities.id")),
    Column("created_on", DateTime, default=datetime.utcnow),
    Column("updated_on", DateTime, default=datetime.utcnow)
)

def start_mappers():
    mapper_registry.map_imperatively(models.House, houses_table)
    mapper_registry.map_imperatively(models.Type, types_table, properties = {
        'houses': relationship(models.House, backref='types', order_by=houses_table.c.id),
    })

    mapper_registry.map_imperatively(models.Region, regions_table, properties = {
        'subregions': relationship(models.Subregion, backref='regions', order_by=subregions_table.c.id),
    })

    mapper_registry.map_imperatively(models.Subregion, subregions_table, properties = {
        'cities': relationship(models.City, backref='subregions', order_by=cities_table.c.id),
    })

    mapper_registry.map_imperatively(models.City, cities_table, properties = {
        'houses': relationship(models.House, backref='cities', order_by=houses_table.c.id),
    })
