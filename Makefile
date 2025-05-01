.PHONY: update
update:
	home-manager switch --flake .#shooter

.PHONY: clean
clean:
	nix-collect-garbage -d
