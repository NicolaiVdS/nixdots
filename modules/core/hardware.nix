{ pkgs, ... }: {
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
    };
  };
  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performance";
  };
}