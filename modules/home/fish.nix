{ pkgs , lib , config, ... }:
{
  imports = [
  ];

  programs.fish = {
    enable = true;

		shellInit = ''
			set -x EDITOR nvim
		'';

    shellAliases = {
      nec = "nvim ${config.home.homeDirectory}/dotties/";
      nrb = "sudo nixos-rebuild switch --flake path:${config.home.homeDirectory}/dotties/";
      ncg = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d";
    };
  };
}
