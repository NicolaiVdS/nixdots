{
  pkgs,
  inputs,
  username,
  ...
}: {
  home-manager.users.${username} = {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
    };
  };
}