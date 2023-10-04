{ config, pkgs, ... }: {
  hardware = {
    opengl = {
      enable = true;

      # Vulkan
      driSupport = true;
      driSupport32Bit = true;

      # VA-API
      extraPackages = with pkgs; [
        vaapiVdpau
        libvdpau-va-gl

        nvidia-vaapi-driver
      ];
    };

    nvidia = {
      modesetting.enable = true;
      open = true;
      nvidiaSettings = true;
      #package = config.boot.kernelPackages.nvidiaPackages.vulkan_beta;
    };
  };

  # Test
  environment.systemPackages = with pkgs; [
    nvidia-vaapi-driver
    egl-wayland
  ];
  
  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performance";
  };
}
