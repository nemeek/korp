# use with running services
debug-frontend:
	docker-compose exec frontend bash

# use with running services
debug-backend:
	docker-compose exec backend bash

# use when for e.g. configs in our own frontend repo are changed
rebuild-frontend:
	sudo docker-compose build --no-cache frontend

rebuild-backend:
	sudo docker-compose build --no-cache backend

decompress-toy-corpus:
	./volume-utils.py decompress

.PHONY: debug-frontend debug-backend decompress-toy-corpus
