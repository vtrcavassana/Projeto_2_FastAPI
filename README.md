## Executando o projeto localmente (app)

Para rodar o projeto localmente, siga os seguintes passos:

1. Certifique-se de estar na pasta raiz do projeto.
2. Execute o seguinte comando:

```bash
uvicorn app.main:app --reload
```

## Executando os serviços Postgresql e pgAdmin localmente

Para rodar ambos os serviços, siga os seguintes passos:

1. Certifique-se de configurar o Dockerfile e docker-compose à suas necessidades.
2. Execute os seguintes comandos:

```bash
docker-compose up -d postgresql
```
```bash
docker-compose up -d pgadmin
```

>Nota: postgresql e pgadmin são os nomes dos respectivos serviços, localizados no arquivo docker-compose

## Executando Alembic

- Migrations

    Para rodar Alembic, siga os seguintes passos:

    1. Certifique-se que está no mesmo local do `ENV PYTHONPATH`
    2. Execute o seguinte comando:

    ```sh
    docker-compose run --user 1000 app sh -c 'alembic init migrations'
    ```

- Criando Alembic Script para criar qualquer tabela

    1. Para rodar esse comando, siga o passo 1 anterior.
    2. Execute o seguinte comando:

    ```sh
    docker-compose run --user 1000 app sh -c 'alembic revision --autogenerate -m "sua_mensagem_aqui"
    ```

- Executando o Alembic Script

    Para executar o script, siga os seguintes passos:

    1. Reze pra que o comando anterior tenha dado certo.
    2. Execute o seguinte comando:

    ```sh
    docker-compose run --user 1000 app sh -c 'alembic upgrade head'
    ```