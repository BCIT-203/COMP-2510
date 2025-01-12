CC := gcc
BIN_DIR := ./bin/

lab-0 := $(BIN_DIR)/lab\ 0/hello
.PHONY: lab-0
lab-0: $(lab-0)
.PHONY: run-lab-0
run-lab-0: lab-0
	@clear
	@echo '>>>> start Lab 0 >>>>'
	@$(lab-0)
	@echo '<<<<  end  Lab 0 <<<<'

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
