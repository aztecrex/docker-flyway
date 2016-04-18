# run 'make help' for targets

WORK=.tmp

.PHONY: all build clean realclean up down logs help sources

all:            ## build all, currently synonym for 'build'
all: build

build:          ## build the image
build: ${WORK}/.build

clean:          ## remove the official image tag
	rm -f ${WORK}/.build

realclean:      ## clean and remove all controls
realclean: clean
	rm -rf ${WORK}

help:           ## show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/##//' \
    | sed 's/^/make /'

${WORK}/.build: ${WORK}
	jet steps
	touch ${WORK}/.build


${WORK}:
	mkdir -p ${WORK}
