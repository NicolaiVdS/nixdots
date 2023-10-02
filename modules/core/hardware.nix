{ config, pkgs, ... }: {
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    nvidia = {
      modesetting.enable = true;
      open = true;
      nvidiaSettings = true;
      #package = config.boot.kernelPackages.nvidiaPackages.vulkan_beta;
    };
  };
  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performance";
  };
}
