{ pkgs , lib , inputs , ... }: 
{
  imports = [
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
  ];

  programs.dankMaterialShell = {
    enable = true;
    systemd = {
      enable = true;
      restartIfChanged = true;
    };
  };

  home.packages = [ pkgs.adw-gtk3 pkgs.papirus-icon-theme ];

  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "gtk3";
    QT_QPA_PLATFORMTHEME_QT6 = "gtk3";
  };

  services.udiskie = {
      enable = true;
  };
}
