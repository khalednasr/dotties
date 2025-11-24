{ inputs, pkgs, ... }:
{
  # nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  # programs.niri.package = pkgs.niri;
  programs.niri.enable = true;
  # imports = [
  #   inputs.niri.nixosModules.niri
  # ];
  environment.variables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs; [
    wl-clipboard
    wayland-utils
    xwayland-satellite
  ];
}
