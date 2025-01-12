CC := gcc
BIN_DIR := ./bin/

.PHONY: setup
setup:
	@command -v apk 2>&1 > /dev/null && apk update && apk add gcc libc-dev || true
	@command -v apt 2>&1 > /dev/null && apt update && apt install -y build-essential || true
	@command -v dnf 2>&1 > /dev/null && dnf update && dnf install -y gcc || true
	@command -v pacman 2>&1 > /dev/null && pacman -Sy --noconfirm gcc || true
	@gcc --version

.PHONY: clean
clean:
	@rm -rf $(BIN_DIR)

.SECONDARY:

$(BIN_DIR)/%: %.c
	@while true; do \
		$(CC) -o '$@' '$<' && break \
			|| mkdir -p "$$(dirname '$@')"; \
	done

%:
	@echo $@ not found
	@false
