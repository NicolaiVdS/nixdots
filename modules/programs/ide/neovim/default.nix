{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    #vimdiffAlias = true;

    defaultEditor = true;

    extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
    '';
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