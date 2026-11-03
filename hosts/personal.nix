{ pkgs, lib, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "grok-build" ];

  environment.systemPackages = [ pkgs.grok-build ];

  # This machine only. The syncthing cask is the menu-bar app and runs the daemon.
  homebrew.casks = [ "logseq" "syncthing" "grok-bot" ];
}
