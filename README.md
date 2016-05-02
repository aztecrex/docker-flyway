# Flyway in Docker

## Prequisites

* [Docker](https://www.docker.com) and Docker Compose (get everything with [Docker Toolbox](https://www.docker.com/products/docker-toolbox))
* Codeship [Jet](https://codeship.com/documentation/docker/installation/)

## Build

The project include a Makefile. Run ```make help``` for info.  Targets include:
* ```make``` (alias for ```make build```) -- build the image

Get more Make targets with ```make help```.

## Rum the Flyway Tutorial

Run the Flyway tutorial migrations with ```make tutorial```.

## Use

Mount configuration files in ```/opt/flyway/config/```. Mount SQL scripts
in ```/opt/flyway/sql```.  Run with ```docker run```. Arguments passed to the container are
passed directly to the Flyway command. For example, to run all migrations,
use ```docker run --volumes-from <your setup> flyway migrate```.
