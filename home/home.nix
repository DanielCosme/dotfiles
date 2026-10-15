{ config, pkgs, lib, ... }:

{
  programs.fish = {
   enable = true;
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "Daniel Cosme";
      user.email = "danicosme@pm.me";
      push.autoSetupRemote = true;
    };
  };

  programs.starship.enable = true;

  home.stateVersion = "24.11";
}
