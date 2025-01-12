# COMP 2510

This repository contains files that can be used in Visual Studio Code to work on labs for COMP 2510.

## How To

### Setup

1. Install [Docker Desktop](https://www.docker.com/products/docker-desktop/) or [Podman Desktop](https://podman-desktop.io/).
2. Install [Dev Containers](vscode:extension/ms-vscode-remote.remote-containers), [backup link](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers).
3. Select `Dev Containers: Reopen in Container` Command
![Dev Containers: Reopen in Container](https://code.visualstudio.com/assets/docs/devcontainers/create-dev-container/dev-containers-reopen.png)
   or click `Reopen in Container` popup.
![Reopen in Container](https://code.visualstudio.com/assets/docs/devcontainers/create-dev-container/dev-container-reopen-prompt.png)
4. Run `sudo make setup` in Visual Studio Code terminal.
5. Start coding!

### Run Labs

1. Run `make run-lab-xx` where `xx` is the lab number.

### Clean Up

1. Run `make clean`.
