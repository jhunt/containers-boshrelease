default:
	@echo "please choose a make target..."

release:
	@echo "Checking that VERSION was defined in the calling environment"
	@test -n "$(VERSION)"
	@echo "OK.  VERSION=$(VERSION)"
	bosh create-release --final --tarball=releases/containers-$(VERSION).tgz --name containers --version $(VERSION)
	git add releases/containers .final_builds
	git commit -m "Release v$(VERSION)"
	git tag v$(VERSION)

yaml-snippet:
	@echo >&2 "Checking that VERSION was defined in the calling environment"
	@test -n "$(VERSION)"
	@echo >&2 "OK.  VERSION=$(VERSION)"
	@echo "releases:"
	@echo "  - name:    containers"
	@echo "    version: $(VERSION)"
	@echo "    url:     https://github.com/jhunt/containers-boshrelease/releases/download/v$(VERSION)/containers-$(VERSION).tgz"
	@echo "    sha1:    $(shell sha1sum releases/containers-$(VERSION).tgz | awk '{print $$1}')"
	@echo
