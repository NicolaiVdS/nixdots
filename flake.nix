{
  # sudo nixos-rebuild switch --flake .
  description = "NicolaiVdS NixOS Configuration.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    home-manager.url = "github:nix-community/home-manager";
    alejandra.url = "github:kamadorueda/alejandra/3.0.0"; # The Uncompromising Nix Code Formatter.
    hyprland-contrib.url = "github:hyprwm/contrib";
    nur.url = "github:nix-community/NUR";
    orcaslicer.url = "github:ovlach/nix-orca-slicer";
  };

  outputs = {
    nixpkgs,
    self, 
    ...
  } @ inputs: let
    username = "nicolaivds";
    git_username = "NicolaiVdS";
    git_email = "nicolai@nvds.be";
    selfPkgs = import ./pkgs;
  in {
    overlays.default = selfPkgs.overlay;
    formatter.x86_64-linux = inputs.alejandra.defaultPackage.x86_64-linux;
    nixosConfigurations = import ./modules/core/default.nix {
      inherit self nixpkgs inputs username git_username git_email;
    };
  };
}
