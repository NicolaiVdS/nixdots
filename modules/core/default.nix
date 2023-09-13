{
  inputs,
  nixpkgs,
  self,
  username,
  git_username,
  git_email,
  ...
}: {
  nixos = nixpkgs.lib.nixosSystem {
    specialArgs = {inherit self inputs username;};
    system = "x86_64-linux";
    modules = [
      ./../../hosts/nixos/hardware-configuration.nix
      ./bootloader.nix
      ./hardware.nix
      ./home-manager.nix
      ./network.nix
      ./pipewire.nix
      ./programs.nix
      ./security.nix
      ./services.nix
      ./system.nix
      ./user.nix
      ./../desktops/hyprland

      # Wayland based programs for hyprland
      ./../programs/wayland/waybar
      ./../programs/wayland/wlogout
      ./../programs/wayland/swaylock
      ./../programs/wayland/foot

      # IDE
      ./../programs/ide/vscodium
      ./../programs/ide/neovim

      # utility based programs
      ./../programs/utilities/git
      ./../programs/utilities/bat
      ./../programs/utilities/gpg
      ./../programs/utilities/mangohud

      # theme based programs
      #./../programs/theme/gtk
    ];
  };
}
