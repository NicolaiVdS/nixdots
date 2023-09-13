{ pkgs, inputs, ... }: {
  imports = [ inputs.orcaslicer.packages.${pkgs.system}.default];
  home.packages = with pkgs; [
    pavucontrol

    # utilities
    unzip
    btop
    playerctl
    gparted
    pamixer
    neofetch
    zathura
    vim
    dunst
    libnotify
    wget
    
    google-chrome
    firefox
    libreoffice
    hplipWithPlugin

    # Multimedia
    vlc

    # Nixos
    nix-prefetch-github   

    ttyper
    rofi-wayland
    kitty
    obs-studio
    obs-studio-plugins.wlrobs
    obs-studio-plugins.obs-vkcapture
    obs-studio-plugins.obs-pipewire-audio-capture

    betterbird
  ];
}
