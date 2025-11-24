{ config, lib, pkgs, host, ... }:
let
  inherit (import  ../../../hosts/${host}/variables.nix) amdgpuID nvidiaID;
in
{
  # Enforce kernel 6.12 when this hybrid config is selected
  # boot.kernelPackages = lib.mkForce pkgs.linuxPackages_6_12;

  services.xserver.videoDrivers = [ "modesetting" "amdgpu" "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    open = true; # RTX 50xx requires the open kernel module
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.production;

    # Helpful on laptops to power down the dGPU when idle
    powerManagement.enable = true;
    powerManagement.finegrained = true;

    # AMD primary, NVIDIA offload
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      # Wire from options
      amdgpuBusId = amdgpuID;
      nvidiaBusId = nvidiaID;
    };
  };
  hardware.nvidia-container-toolkit.enable = true;

  environment.systemPackages = with pkgs; [
    cudaPackages.cudatoolkit
  ];
}
