{ pkgs, inputs, ... }:
{
  environment.variables.EDITOR = "nvim";
  home-manager.users.nicolaivds = {

    programs.neovim = 
    let 
      toLua =  str: "lua << EOF\n${str}\nEOF\n";
      toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
    in 
    {
      enable = true;
      
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      plugins = with pkgs.vimPlugins; [
        {
          plugin = comment-nvim;
          config = toLua "require(\"Comment\").setup()";
        }

        {
          plugin = onedark-nvim;
          config = toLuaFile ./plugins/onedark.lua;
        }
      ];

      extraLuaConfig = ''
        ${builtins.readFile ./options.lua}
      '';

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