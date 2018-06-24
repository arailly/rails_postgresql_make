railsnew:
	echo "source 'https://rubygems.org'" > Gemfile
	echo "gem 'rails', '5.2.0'" >> Gemfile
	touch Gemfile.lock
	docker-compose run --rm web rails new -f . --database=postgresql
	sudo chown -R ${USER} .
	echo "default: &default" > config/database.yml
	echo "  adapter: postgresql" >> config/database.yml
	echo "  encoding: unicode" >> config/database.yml
	echo "  host: db" >> config/database.yml
	echo "  username: postgres" >> config/database.yml
	echo "  password:" >> config/database.yml
	echo "  pool: 5" >> config/database.yml
	echo "development:" >> config/database.yml
	echo "  <<: *default" >> config/database.yml
	echo "  database: myapp_development" >> config/database.yml
	echo "test:" >> config/database.yml
	echo "  <<: *default" >> config/database.yml
	echo "  database: myapp_test" >> config/database.yml
	docker-compose build
	docker-compose up -d
	docker-compose run --rm web rails db:create

ps:
	docker ps -a

up:
	docker-compose up -d

down:
	docker-compose down

build:
	docker-compose build

.PHONY: log
log:
	docker-compose logs

run:
	docker-compose run --rm ${cmd}

rails:
	docker-compose run --rm web rails ${cmd}

c:
	docker-compose run --rm web rails c
	
.PHONY: db
db:
	docker-compose run --rm web rails db

.PHONY: routes
routes:
	docker-compose run --rm web rails routes

dbcreate:
	docker-compose run --rm web rails db:create

dbmigrate:
	docker-compose run --rm web rails db:migrate