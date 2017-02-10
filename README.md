# App

## Setup
- Install [Docker](https://www.docker.com/products/docker).
- Install [GitHub Desktop](https://desktop.github.com/).
- Download this repo.
- Run `docker-compose up --build`.
- Run `./login` to ssh into virtual machine.
- Run `./manage.py migrate` to update database schema.
- Run `./manage.py loaddata fixtures/dev_data.json` to load default user data.
- Run `./manage.py runserver 0.0.0.0:8000` and navigate to [http://localhost:3000](http://localhost:3000).
