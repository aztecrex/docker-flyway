# run 'make help' for targets

WORK=.tmp

.PHONY: all build clean realclean tutorial help

all:            ## build all, currently synonym for 'build'
all: build

build:          ## build the image
build: ${WORK}/.build

clean:          ## remove the official image tag
	rm -f ${WORK}/.build

realclean:      ## clean and remove all controls
realclean: clean
	rm -rf ${WORK}

tutorial:       ## run tutorial from the Flyway website
	docker-compose run flyway migrate

help:           ## show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/##//' \
    | sed 's/^/make /'

${WORK}/.build: ${WORK} Dockerfile scripts/* sample/sql/* sample/conf/* \
		codeship-services.yml codeship-steps.yml
	jet steps
	touch ${WORK}/.build


${WORK}:
	mkdir -p ${WORK}
