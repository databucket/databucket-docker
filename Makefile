NAME := databucket
VERSION := $(or $(VERSION),$(VERSION),2.2.5)

build: slim alpine #all_alpine all_slim

# all_alpine:
# 	cd ./databucket-docker-all-in-one-alpine && docker build -t $(NAME)/all-in-one:$(VERSION)-alpine .

# all_slim:
# 	cd ./databucket-docker-all-in-one-slim && docker build -t $(NAME)/all-in-one:$(VERSION)-slim .

alpine:
	cd ./databucket-docker-alpine && docker build -t $(NAME)/app:$(VERSION)-alpine .

slim:
	cd ./databucket-docker-slim && docker build -t $(NAME)/app:$(VERSION)-slim .

tag_latest:
	# docker tag $(NAME)/all-in-one:$(VERSION)-alpine $(NAME)/all-in-one:latest
	docker tag $(NAME)/app:$(VERSION)-alpine $(NAME)/app:latest

release_latest:
	# docker push $(NAME)/all-in-one:latest
	docker push $(NAME)/app:latest

tag_version:
	# docker tag $(NAME)/all-in-one:$(VERSION)-alpine $(NAME)/all-in-one:$(VERSION)
	docker tag $(NAME)/app:$(VERSION)-alpine $(NAME)/app:$(VERSION)

release_version:
	# docker push $(NAME)/all-in-one:$(VERSION)
	docker push $(NAME)/app:$(VERSION)

release:
	# docker push $(NAME)/all-in-one-alpine:$(VERSION)
	# docker push $(NAME)/all-in-one-slim:$(VERSION)
	docker push $(NAME)/app:$(VERSION)-alpine
	docker push $(NAME)/app:$(VERSION)-slim