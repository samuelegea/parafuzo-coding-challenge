

bundle:
	docker compose run --rm app bundle install
up:
	docker compose up;
console:
	docker compose run --rm app bundle exec rails c;
routes:
	docker compose run --rm app bundle exec rails routes;
up_build:
	docker compose up --build
down:
	docker compose down;
build:
	docker compose build --no-cache;
migrate:
	docker compose run --rm app bundle exec rake db:migrate;
rollback:
	docker compose run --rm app bundle exec rake db:rollback;
seed: 
	docker compose run --rm app bundle exec rake db:seed;
db_create:
	docker compose run --rm app bundle exec rake db:create;
db_reset:
	docker compose run --rm app bundle exec rake db:drop db:create db:migrate db:seed;
test:
	docker compose run --rm app bundle exec rspec
rubo:
	docker compose run --rm app bundle exec rubocop
rubofix:
	docker compose run --rm app bundle exec rubocop -x
rubofixall:
	docker compose run --rm app bundle exec rubocop -A
cmd:
	docker compose run --rm app $(CMD)
bash: 
	docker compose run --rm app bash

# aliases

c: console
r: routes
t: test
rb: rubo
rbf: rubofix
rbfa: rubofixall
m: migrate
rm: rollback
s: seed
db: db_create
db_r: db_reset
b: build
ub: up_build
u: up
d: down
