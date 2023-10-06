{
  home-manager.users.nicolaivds = {
    programs.foot = {
      enable = true;
      settings = {
        main = {
          term = "xterm-256color";

          font = "FiraCode Nerd Font:size=9";
          dpi-aware = "yes";
        };

        mouse = {
          hide-when-typing = "yes";
        };
      };
    };
  };
}