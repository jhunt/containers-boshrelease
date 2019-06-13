default:
	@echo "please choose a make target..."

release:
	@echo "Checking that VERSION was defined in the calling environment"
	@test -n "$(VERSION)"
	@echo "OK.  VERSION=$(VERSION)"
	git stash
	bosh create-release --final --tarball=releases/containers-$(VERSION).tgz --name containers --version $(VERSION)
	git add releases/containers .final_builds
	git commit -m "Release v$(VERSION)"
	git tag v$(VERSION)
	git stash pop
