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
      nec = "cd ${config.home.homeDirectory}/dotties && nvim .";
      nrb = "sudo nixos-rebuild switch --flake path:${config.home.homeDirectory}/dotties/";
      ncg = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d";
    };
  };
}
