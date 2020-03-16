NAME := databucket
VERSION := $(or $(VERSION),$(VERSION),2.2.5)

build: slim alpine #all_alpine all_slim

# all_alpine:
# 	cd ./databucket-docker-all-in-one-alpine && docker build -t $(NAME)/all-in-one-alpine:$(VERSION) .

# all_slim:
# 	cd ./databucket-docker-all-in-one-slim && docker build -t $(NAME)/all-in-one-slim:$(VERSION) .

alpine:
	cd ./databucket-docker-alpine && docker build -t $(NAME)/alpine:$(VERSION) .

slim:
	cd ./databucket-docker-slim && docker build -t $(NAME)/slim:$(VERSION) .

tag_latest:
	# docker tag $(NAME)/all-in-one-alpine:$(VERSION) $(NAME)/all-in-one-alpine:latest
	# docker tag $(NAME)/all-in-one-slim:$(VERSION) $(NAME)/all-in-one-slim:latest
	docker tag $(NAME)/alpine:$(VERSION) $(NAME)/alpine:latest
	docker tag $(NAME)/slim:$(VERSION) $(NAME)/slim:latet

release_latest:
	# docker push $(NAME)/all-in-one-alpine:latest
	# docker push $(NAME)/all-in-one-slim:latest
	docker push $(NAME)/alpine:latest
	docker push $(NAME)/slim:latest

release:
	# docker push $(NAME)/all-in-one-alpine:$(VERSION)
	# docker push $(NAME)/all-in-one-slim:$(VERSION)
	docker push $(NAME)/alpine:$(VERSION)
	docker push $(NAME)/slim:$(VERSION)