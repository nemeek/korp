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

# cwb version change might require re-encoding of .vrt files in docker volume
# This command clears corpora and registry files inside the docker volume and create new ones from the
# .vrt files (also inside volume)
encode-wolfart-ahenakew:
	./crk_WolfartAhenakew_encode.sh wolfart_ahenakew "Plains Cree: Wolfart-Ahenakew Texts" $(date +"%Y-%m-%d")

.PHONY: debug-frontend debug-backend decompress-toy-corpus encode-wolfart-ahenakew
