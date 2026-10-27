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

  # Zed writes to its config from the UI, so link to the repo instead of the read-only store
  xdg.configFile."zed/settings.json".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/code/dotfiles/home/zed/settings.json";
  xdg.configFile."zed/keymap.json".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/code/dotfiles/home/zed/keymap.json";
  xdg.configFile."zed/snippets".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/code/dotfiles/home/zed/snippets";

  home.stateVersion = "24.11";

  home.packages = with pkgs; [
   bitwarden-cli
   git
   fish
   neovim
   tree
   btop
   cloc
   go
   gopls
   gotools
  ];
}
