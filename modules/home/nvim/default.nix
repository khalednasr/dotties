{ pkgs , lib , config , ... }:
{
  imports = [
  ];

  programs.neovim = {
    enable = true;
	};

  programs.neovim.extraPackages = [
    pkgs.ripgrep
    pkgs.fzf
    pkgs.gcc
    pkgs.python313
    pkgs.python313Packages.python-lsp-server
  ];

	home.file = {
		".config/nvim" = {
			source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotties/modules/home/nvim/config";
		};
	};
}
