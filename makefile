ANSIBLE_INVENTORY ?= inventory/public.yml

export

DEFAULT_GOAL: help

##@ Ansible targets

update-ssh-authorized-keys: ## Update SSH authorized keys for all nodes
	ansible-playbook playbook/update-ssh-authorized-keys.yml

upgrade-nodes: ## Upgrade system packages for all nodes
	ansible-playbook playbook/upgrade-nodes.yml

##@ Tooling targets

help: ## Show this help
	@awk 'BEGIN {FS = ":.*##"; printf "Usage: make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-28s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
