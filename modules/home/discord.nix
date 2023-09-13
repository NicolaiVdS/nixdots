{pkgs, ...}: let
  catppuccin-mocha = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "discord";
    rev = "a2670f4f192a0eaface871e22d4467e30436880d";
    hash = "sha256-Hp1Th8BDEr+vEJr9SauQltKAHUZO4wmvp2vxV1nd9KY=";
  };

in {
  home.packages = with pkgs; [
    webcord-vencord
  ];

  xdg.configFile = {
    "WebCord/Themes/Mocha" = {
      source = "${catppuccin-mocha}/themes/mocha.theme.css";
    };
  };
}