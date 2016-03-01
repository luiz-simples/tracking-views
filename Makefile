USER_DEVELOPMENT=rd
IMAGE_DEVELOPMENT=rd-development

build-image:
	docker build --force-rm --rm -t $(IMAGE_DEVELOPMENT) .

run-development:
	docker run \
		-v ${HOME}/.gitconfig:/${USER_DEVELOPMENT}/.gitconfig \
		-v ${HOME}/.ssh:/${USER_DEVELOPMENT}/.ssh \
		-v ${PWD}:/${USER_DEVELOPMENT}/rails \
		-w /${USER_DEVELOPMENT}/rails \
		-h dev \
		--dns=8.8.8.8 \
		-it \
		--rm \
		${IMAGE_DEVELOPMENT}
