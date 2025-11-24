{ inputs, host, ... }:
let
  vars = import ../../hosts/${host}/variables.nix;
in
{
  imports = [
		./system.nix
		./network.nix
		./user.nix
    ./fonts.nix
    ./dankgreet.nix
    ./niri.nix
    ./packages.nix
    ./git.nix
    ./nix-ld.nix
  ];
}
