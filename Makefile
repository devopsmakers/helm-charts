.PHONY: lint
lint:
	helm lint charts/*/

.PHONY: package
package:
	rm -f releases/*
	helm package charts/* --destination releases

.PHONY: updateindex
updateindex:
	rm -f index.yaml
	helm repo index --url https://devopsmakers.github.io/helm-charts/ . --merge index.yaml

.PHONY: build
build: lint package updateindex
	@echo "Ready to commit and push!"
