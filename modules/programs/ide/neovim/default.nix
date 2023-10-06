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
          plugin = dashboard-nvim;
          config = toLuaFile ./plugins/dashboard.lua;
        }

        {
          plugin = nvim-web-devicons;
          config = toLuaFile ./plugins/nvim-web-devicons.lua;
        }

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

      extraPackages = with pkgs; [
        luajitPackages.lua-lsp
        rnix-lsp
      ];

      defaultEditor = true;
    };
    
    home.sessionVariables = {
      EDITOR = "nvim";
    };
  };
}