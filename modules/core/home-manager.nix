{ inputs, username, ... }: {
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {inherit inputs;};
    # TODO: Change this
    users.${username} = {
      imports = [(import ./../home)];
      home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = "23.05";
      };
      programs.home-manager.enable = false;
    };
  };
}