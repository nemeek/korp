# use with running services
debug-frontend:
	sudo docker-compose exec frontend bash

# use with running services
debug-backend:
	sudo docker-compose exec backend bash

decompress-toy-corpus:
	./volume-utils.py decompress


.PHONY: debug-frontend debug-backend decompress-toy-corpus