
## prod branch

* Cleared unnecesary things
* Repository at nemeek

## Setting up a new server



This is what was done on `itw.altlab.dev`:

    sudo groupadd --gid 60005 korp
    sudo useradd --uid 60005 --gid 60005 \
        --create-home --home /data_local/home/korp \
        --shell=/bin/bash --groups=docker korp

Then, in `~korp` = `/data_local/home/korp`,

    git clone https://github.com/UAlbertaALTLab/korp docker-compose

    # so that `docker ps` says `korp_frontend` instead of
    # `docker-compose_frontend`
    echo COMPOSE_PROJECT_NAME=korp > ~korp/docker-compose/.env

Add the corpus file, using your own user account:

    # get this file from altlab repo
    sudo cp wolfart_ahenakew-from-korp-container.vrt \
        ~korp/docker-compose/korp-backend/wolfart_ahenakew.vrt
    sudo chown korp ~korp/docker-compose/korp-backend/wolfart_ahenakew.vrt

Then, in `~korp/docker-compose`, do

    docker-compose up --build -d

And finally add the `deploy@altlab.dev` SSH key to `~korp/.ssh/authorized_keys`

    mkdir -m 0700 .ssh
    vim .ssh/authorized_keys
