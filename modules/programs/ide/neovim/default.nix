{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  environment.variables.EDITOR = "nvim";
  home-manager.users.nicolaivds = {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };
    home.packages = with pkgs; [
      rnix-lsp
    ];
    home.sessionVariables = {
      EDITOR = "nvim";
    };
  };
}