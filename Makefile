.PHONY: all rebuild new

all: rebuild

rebuild:
	@sudo nixos-rebuild switch --flake .

new:
	@echo "new called"
