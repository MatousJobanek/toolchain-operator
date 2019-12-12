.PHONY: lint
## Runs linters on Go code files and YAML files
lint: lint-go-code lint-yaml

.PHONY: lint-yaml
## runs yamllint on all yaml files
lint-yaml: ${YAML_FILES}
	$(Q)yamllint -c .yamllint .

.PHONY: lint-go-code
## Checks the code with golangci-lint
lint-go-code:
	$(Q)go get github.com/golangci/golangci-lint/cmd/golangci-lint
	$(Q)${GOPATH}/bin/golangci-lint ${V_FLAG} run --deadline=10m