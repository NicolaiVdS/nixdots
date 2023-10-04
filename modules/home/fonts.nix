{ pkgs, ... }:
{
  fonts.fontconfig.enableProfileFonts = true;

  home.package = with pkgs; [
    fira-code
  ]
}