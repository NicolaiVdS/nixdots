{ username, ... }:
{
  home-manager.users.${username} = {
    programs.mangohud = {
      enable = true;      
    };
  };
}