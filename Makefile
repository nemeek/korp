# use with running services
debug-frontend:
	docker-compose exec frontend bash

# use with running services
debug-backend:
	docker-compose exec backend bash

# use when for e.g. configs in our own frontend repo are changed
# GITCACHE= trick makes git clone step run without cache. See: https://stackoverflow.com/a/49772666
# if no cache is want for every step. Use `--no-cache` flag instead of `--build-arg gitcache`
rebuild-frontend:
	sudo docker-compose build --build-arg GITCACHE=$$(date +%s) frontend
rebuild-backend:
	sudo docker-compose build --build-arg GITCACHE=$$(date +%s) backend


# use these after rebuild
update-frontend-container:
	sudo docker-compose up -d frontend
update-backend-container:
	sudo docker-compose up -d backend

decompress-toy-corpus:
	./volume-utils.py decompress

.PHONY: debug-frontend debug-backend decompress-toy-corpus rebuild-frontend rebuild-backend update-frontend-container update-backend-container
