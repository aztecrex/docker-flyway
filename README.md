# Flyway in Docker

## Prequisites

* [Docker](https://www.docker.com) and Docker Compose (get everything with [Docker Toolbox](https://www.docker.com/products/docker-toolbox))
* Codeship [Jet](https://codeship.com/documentation/docker/installation/)

## Build

The project include a Makefile. Run ```make help``` for info.  Targets include:
* ```make``` (alias for ```make build```) -- build the image

Get more Make targets with ```make help```.

## Run the Flyway Tutorial

Run the Flyway tutorial migrations with ```make tutorial```.

## Use

Mount configuration files in ```/opt/flyway/config/```. Mount SQL scripts
in ```/opt/flyway/sql```.  Run with ```docker run```. Arguments passed to the container are
passed directly to the Flyway command. For example, to run all migrations,
use ```docker run --volumes-from <your setup> flyway migrate```.

## Settling

Before running a Flyway command, the container entry point waits up to 40s for
dependencies to settle. The entry point waits for:
* the configuration file ```/opt/flyway/conf/flyway.conf``` to exist
* the SQL script ready signal file ```/opt/flyway/sql/.ready``` to exist
* database connection to be ready
  * PostgreSQL - run ```nmap``` against the host and port from the JDBC connection URI
