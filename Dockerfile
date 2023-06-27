FROM python:3.10-slim-buster

# Define uma variável de ambiente que desativa o buffer de saída do Python, para que os logs sejam exibidos imediatamente
ENV PYTHONUNBUFFERED 1
# Adiciona o diretório .local/bin do usuário root ao PATH
ENV PATH="/root/.local/bin:$PATH"
# Define a raiz do sistema de arquivos como o caminho de pesquisa para módulos Python
ENV PYTHONPATH='/'

# Copia o arquivo de lock do Poetry para a raiz do sistema de arquivos do container
COPY ./poetry.lock /
# Copia o arquivo de configuração do Poetry para a raiz do sistema de arquivos do container
COPY ./pyproject.toml /

# Atualiza os pacotes e instala o curl
RUN apt-get update -y && apt-get install curl -y \
# Baixa e instala o Poetry
&& curl -sSL https://install.python-poetry.org | python3 - \
# Configura o Poetry para não criar ambientes virtuais
&& poetry config virtualenvs.create false \
# Instala as dependências do projeto
&& poetry install \
# Remove o curl para economizar espaço
&& apt-get remove curl -y

# Copia o diretório do aplicativo para o container
COPY ./app /app
# Define o diretório de trabalho para o diretório do aplicativo
WORKDIR /app