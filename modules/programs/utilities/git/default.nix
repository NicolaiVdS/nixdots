{pkgs, username, git_username, git_email, ...}: let
  push = pkgs.writeShellScriptBin "push" ''
    git_directory = $PWD/.git
    if [[ -d $git_directory ]]; then
      git add .
      read -p "Enter commit name: " commit_name
      git commit -m "$commit_name"
      git push
    else
      echo "Git wasn't initialized here."
    fi 
  '';
in  {
  home-manager.users.${username} = {
    programs.git = {
      enable = true;
      userName = "NicolaiVdS";
      userEmail = "nicolai@nvds.be";
    };

    home.packages = with pkgs; [ push ];
  };
}