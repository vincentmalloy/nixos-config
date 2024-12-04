.DEFAULT_GOAL := rebuild
.SHELL := /usr/bin/env zsh

nix-config-location = /etc/nixos

.PHONY: rebuild update install

rebuild:
	@if [[ !( -h $(nix-config-location) ) ]] || [[ !($$(readlink -f $(nix-config-location)) = $$(readlink -f .)) ]];\
	then\
		sudo nixos-rebuild switch --flake .;\
	else\
		sudo nixos-rebuild switch;\
	fi;

update:
	@nix fmt;\
	sudo nix flake update;\
	if [[ !( -h $(nix-config-location) ) ]] || [[ !($$(readlink -f $(nix-config-location)) = $$(readlink -f .)) ]];\
	then\
		sudo nixos-rebuild switch --flake .;\
	else\
		sudo nixos-rebuild switch;\
	fi;

install:
	@if [[ !( -h $(nix-config-location) ) ]] || [[ !($$(readlink -f $(nix-config-location)) = $$(readlink -f .)) ]];\
	then\
		echo "need to install";\
	fi;
