.PHONY: all
all: audit test build

.PHONY: audit
audit:
	dis-vulncheck

.PHONY: build
build:
	go build ./...

.PHONY: convey
convey:
	goconvey ./...

.PHONY: fmt
fmt:
	go fmt ./...

.PHONY: lint
lint:
	golangci-lint run ./...

.PHONY: test
test:
	go test -race -cover ./...