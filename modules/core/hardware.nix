{ config, pkgs, ... }: {
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    nvidia = {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.dc_520;
    };
  };
  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performance";
  };
}