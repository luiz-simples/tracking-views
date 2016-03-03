USER_DEVELOPMENT=rd
IMAGE_DEVELOPMENT=rd-development
CONTAINER_DEVELOPMENT=tkg-pages-run

build-image:
	docker build --rm --force-rm -t ${IMAGE_DEVELOPMENT} .

build-container:
	( ( docker stop ${CONTAINER_DEVELOPMENT} && docker rm ${CONTAINER_DEVELOPMENT} ) || echo "Container not found: ${CONTAINER_DATABASE}" ) && \
	docker run \
		-v ${HOME}/.gitconfig:/${USER_DEVELOPMENT}/.gitconfig \
		-v ${HOME}/.ssh:/${USER_DEVELOPMENT}/.ssh \
		-v ${PWD}:/${USER_DEVELOPMENT}/rails \
		-w /${USER_DEVELOPMENT}/rails \
		-h dev \
		-p 3000:3000 \
		--dns=8.8.8.8 \
		-it \
		--name ${CONTAINER_DEVELOPMENT} \
		${IMAGE_DEVELOPMENT}

attach-container:
	( docker stop ${CONTAINER_DEVELOPMENT} || echo "Container not found: ${CONTAINER_DATABASE}" ) && \
	docker start ${CONTAINER_DEVELOPMENT} && \
	docker attach ${CONTAINER_DEVELOPMENT}
