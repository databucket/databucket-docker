NAME := databucket
VERSION := $(or $(VERSION),$(VERSION),2.2.5)

build: slim alpine

alpine:
	cd ./databucket-docker-alpine && docker build -t $(NAME)/app:$(VERSION)-alpine .

slim:
	cd ./databucket-docker-slim && docker build -t $(NAME)/app:$(VERSION)-slim .

tag_latest:
	docker tag $(NAME)/app:$(VERSION)-alpine $(NAME)/app:latest

release_latest:
	docker push $(NAME)/app:latest

tag_version:
	docker tag $(NAME)/app:$(VERSION)-alpine $(NAME)/app:$(VERSION)

release_version:
	docker push $(NAME)/app:$(VERSION)

release:
	docker push $(NAME)/app:$(VERSION)-alpine
	docker push $(NAME)/app:$(VERSION)-slim