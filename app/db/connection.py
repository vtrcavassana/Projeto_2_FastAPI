from decouple import config
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

# Obtém a URL do banco de dados do arquivo de configuração
DB_URL = config('DB_URL')

# Cria a "engine" SQLAlchemy para se conectar ao banco de dados
engine = create_engine(DB_URL, pool_pre_ping=True)

# Cria uma factory de sessões SQLAlchemy
Session = sessionmaker()