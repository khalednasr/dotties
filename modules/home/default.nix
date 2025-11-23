{ host, inputs, ... }:
{
  imports = [
		./fish.nix
		./nvim
    ./browser.nix
    ./kitty.nix
    ./dankMaterialShell.nix
  ];
}
