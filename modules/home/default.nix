{ host, inputs, ... }:
{
  imports = [
		./fish.nix
    ./niri
		./nvim
    ./firefox.nix
    ./kitty.nix
    ./dankMaterialShell.nix
    ./udiskie.nix
  ];
}
