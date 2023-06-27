from sqlalchemy import Column, Integer, String
from app.db.base import Base

# Define o modelo de Categoria
class Categoria(Base):
    # Nome da tabela no banco de dados
    __tablename__ = 'categorias'
    # Coluna ID
    id = Column('id', Integer, primary_key=True, autoincrement=True)
    # Coluna Nome
    name = Column('nome', String, nullable=False)
    # Coluna Slug
    slug = Column('slug', String, nullable=False)