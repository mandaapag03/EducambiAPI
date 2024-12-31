PACKAGES_PATH = $(shell go list -f '{{ .Dir }}' ./...)

default: run

run:
	docker-compose up -d

down:
	docker-compose down