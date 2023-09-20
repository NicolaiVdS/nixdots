{ pkgs, system, inputs, ... }: {
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

    #inputs.orcaslicer.packages.x86_64-linux
    protontricks
    protonup-qt
    qbittorrent
    lutris
    wine-wayland
    winetricks
    gamescope
    gamemode
    sublime

    bottles

    peazip
  ];
}
