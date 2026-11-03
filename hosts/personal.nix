{ pkgs, lib, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "grok-build" ];

  environment.systemPackages = [ pkgs.grok-build ];

  # This machine only. The syncthing cask is the menu-bar app and runs the daemon.
  # logseq-og is the file-based Markdown app. The logseq cask is the database app.
  homebrew.casks = [ "logseq-og" "syncthing-app" "grok-bot" ];
}
