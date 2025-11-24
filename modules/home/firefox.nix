{ pkgs , lib , config , ... }:
{
  programs.firefox.enable = true;

  home.packages = [
    pkgs.pkgs.pywalfox-native
  ];

  home.activation = {
    pywalfox_setup = lib.hm.dag.entryAfter ["writeBoundary" "installPackages" "pywalfox-native"] ''
      export PATH="${lib.makeBinPath (with pkgs; [ pywalfox-native ])}:$PATH"
      pywalfox install
      run ln -sf $HOME/.cache/wal/dank-pywalfox.json $HOME/.cache/wal/colors.json
    '';
  };
}
