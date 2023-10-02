{
  self,
  pkgs,
  lib,
  inputs,
  ...
}: {
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  i18n.defaultLocale = "en_GB.UTF-8";

  time = {
    timeZone = "Europe/Brussels";
    hardwareClockInLocalTime = false;
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = false;
  };
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    LIBSEAT_BACKEND = "logind";
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "$HOME/.steam/root/compatibilitytools.d";
  };

  system.stateVersion = "23.05";
}
