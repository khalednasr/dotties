{ pkgs
, lib
, ...
}: {
  imports = [
  ];

  programs.fish = {
    enable = true;

		shellInit = ''
			set -x EDITOR nvim
		'';

    # shellAliases = {
    #   sv = "sudo nvim";
    # };
  };
}
