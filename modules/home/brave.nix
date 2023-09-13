{ pkgs, username, ... }:
{
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
      { id = "gebbhagfogifgggkldgodflihgfeippi"; } # Return Youtube Dislike 
      { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } # SponsorBlock
      { id = "bcjindcccaagfpapjjmafapmmgkkhgoa"; } # JSON Formatter
      { 
        id = "aaaaaaaaaabbbbbbbbbbcccccccccccc";
        version = "1.7.9";
        updateUrl = "https://raw.githubusercontent.com/iamadamdev/bypass-paywalls-chrome/master/src/updates/updates.xml";
      } # Bypass Paywalls
    ];
  };
}