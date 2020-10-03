

APP_NAME=capstone.portal
APP_TAG:=latest
APP_IMG=$(APP_NAME):$(APP_TAG)

.PHONY: all start stop clean deploy

all:
	docker build -f docker/Dockerfile -t $(APP_IMG) .

start:
	docker run -d -p 80:80 --rm --name webapp $(APP_IMG)

stop:
	docker stop $(APP_IMG) || true

clean: stop

help: