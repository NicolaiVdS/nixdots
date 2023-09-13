{pkgs, ... }:
{
  services = {
    printing = {
      enable = true;
      drivers = [
        pkgs.gutenprint
        pkgs.hplip
      ];
    };
    xserver = {
      layout = "be";
      xkbVariant = "nodeadkeys";
      videoDrivers = ["nvidia"];
      exportConfiguration = true;
    };
    gvfs.enable = true;
    tumbler.enable = true;
  };
}
