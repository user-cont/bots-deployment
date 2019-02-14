.PHONY: image deploy cleanup

IMAGE_NAME := usercont/bots-deployment

image:
	docker build --tag=${IMAGE_NAME} .

deploy: image
	./run-deployment-in-container.sh

cleanup: image
	./run-cleanup-in-container.sh
