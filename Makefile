CC := gcc
BIN_DIR := ./bin/

lab-0 := $(BIN_DIR)/Lab\ 0/hello
.PHONY: lab-0
lab-0: $(lab-0)
.PHONY: run-lab-0
run-lab-0: lab-0
	@echo '>>>> start Lab 0 >>>>'
	@$(lab-0)
	@echo '<<<<  end  Lab 0 <<<<'

lab-1 := $(BIN_DIR)/Lab\ 1/Task\ 1 $(BIN_DIR)/Lab\ 1/Task\ 2 $(BIN_DIR)/Lab\ 1/Task\ 3 $(BIN_DIR)/Lab\ 1/Task\ 4 $(BIN_DIR)/Lab\ 1/Task\ 5 $(BIN_DIR)/Lab\ 1/Task\ 6 $(BIN_DIR)/Lab\ 1/Task\ 7 $(BIN_DIR)/Lab\ 1/Task\ 8 $(BIN_DIR)/Lab\ 1/Task\ 9 $(BIN_DIR)/Lab\ 1/Task\ 10
.PHONY: lab-1
lab-1: $(lab-1)
.PHONY: run-lab-1
run-lab-1: lab-1
	@echo '>>>> start Lab 1 >>>>'
	@for file in $(lab-1); do \
		echo ">>>>>>>> start $$(basename "$${file}") >>>>>>>>"; \
		"$${file}"; \
		echo "<<<<<<<<  end  $$(basename "$${file}") <<<<<<<<"; \
	done
	@echo '<<<<  end  Lab 1 <<<<'

lab-2 := $(BIN_DIR)/Lab\ 2/Task\ 1 $(BIN_DIR)/Lab\ 2/Task\ 2 $(BIN_DIR)/Lab\ 2/Task\ 3 $(BIN_DIR)/Lab\ 2/Task\ 4 $(BIN_DIR)/Lab\ 2/Task\ 5 $(BIN_DIR)/Lab\ 2/Task\ 6 $(BIN_DIR)/Lab\ 2/Task\ 7 $(BIN_DIR)/Lab\ 2/Task\ 8 $(BIN_DIR)/Lab\ 2/Task\ 9 $(BIN_DIR)/Lab\ 2/Task\ 10
.PHONY: lab-2
lab-2: $(lab-2)
.PHONY: run-lab-2
run-lab-2: lab-2
	@echo '>>>> start Lab 2 >>>>'
	@for file in $(lab-2); do \
		echo ">>>>>>>> start $$(basename "$${file}") >>>>>>>>"; \
		"$${file}"; \
		echo "<<<<<<<<  end  $$(basename "$${file}") <<<<<<<<"; \
	done
	@echo '<<<<  end  Lab 2 <<<<'

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
	@if ! [ -d "$$(dirname '$@')" ]; then \
		mkdir -p "$$(dirname '$@')"; \
	fi
	$(CC) -o '$@' '$<'

%:
	@echo $@ not found
	@false
