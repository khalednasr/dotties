
{ pkgs, host, ... }:
let
  inherit (import ../../hosts/${host}/variables.nix) gitUsername gitEmail;
in
{
  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "main";
      user.name = "${gitUsername}";
      user.email = "${gitEmail}";
      url = {
        "https://github.com/" = {
          insteadOf = [
            "gh:"
            "github:"
          ];
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    gh
  ];
}
