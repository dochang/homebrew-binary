all:

ci-deps:
	brew bundle install --no-upgrade
	bundle install

lint:
	bundle exec rufo --check .

test:
	brew test-bot --tap="${HOMEBREW_TAP_NAME}" --skip-homebrew --ci-auto --no-pull --verbose

.PHONY: all ci-deps lint test