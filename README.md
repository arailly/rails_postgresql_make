# Rails and PostgreSQL on Docker


## Usage

* To start new project => `make new`
* `docker ps -a` => `make ps`
* `docker-compose up -d` => `make up`
* `docker-compose down` => `make down`
* `docker-compose build` => `make build`
* `docker-compose logs` => `make log`
* `docker-compose run --rm <command>` => `make run cmd=<command>`
* `docker-compose run --rm web rails <command>` => `make rails cmd=<command>`
* `docker-compose run --rm web rails c` => `make c`
* `docker-compose run --rm web rails db` => `make db`
* `docker-compose run --rm web rails routes` => `make routes`
* `docker-compose run --rm web rails db:create` => `make dbcreate`
* `docker-compose run --rm web rails db:migrate` => `make dbmigrate`

<br>

## Reference
https://docs.docker.com/compose/rails/

<br>

## License
Code Copyright (c) 2018 Yusuke ARAI
Code released under the MIT license
https://opensource.org/licenses/mit-license.php
