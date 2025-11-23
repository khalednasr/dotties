{ inputs, username, ... }:
{
  imports = [
    inputs.dankMaterialShell.nixosModules.greeter
  ];

  programs.dankMaterialShell.greeter = {
    enable = true;
    compositor.name = "niri";

    configHome = "/home/${username}/";

    logs = {
      save = true; 
      path = "/tmp/dms-greeter.log";
    };
  };
}
