{ ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "maple-mono";

    };
    keybindings = {
      "super+shift+t" = "launch --cwd=current --type=os-window";
    };
    extraConfig = ''
      include dank-tabs.conf
      include dank-theme.conf
    '';
  };
}
