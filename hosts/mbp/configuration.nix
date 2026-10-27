{ pkgs, lib, ... }:

{
  # Allow only the unfree packages listed here
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "claude-code" ];

  system.primaryUser = "daniel";

  programs.fish.enable = true;

  users.knownUsers = [ "daniel" ];

  # Enable experimental features declaratively
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.daniel = {
    name = "daniel";
    home = "/Users/daniel";
    shell = pkgs.fish;
    uid = 501;
  };

  # CLI tools (replaces brew install)
  environment.systemPackages = with pkgs; [
    postgresql
    nodejs
    protobuf
    colima
    docker-compose
    claude-code
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
  ];

  # GUI apps (declarative Homebrew)
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    casks = [ "ghostty" "bitwarden" "brave-browser" "zed" "amethyst"];
  };

  # macOS preferences
  # https://nix-darwin.github.io/nix-darwin/manual/
  system.defaults = {
    dock.autohide = true;
    dock.orientation = "left";
    dock.mru-spaces = false;
    finder.AppleShowAllFiles = false;
    NSGlobalDomain.KeyRepeat = 1;
    NSGlobalDomain.InitialKeyRepeat = 20;

    CustomUserPreferences."com.apple.AppleMultitouchMouse" = {
     MouseMomentumScroll = false;

     ".GlobalPreferences" = {
        "com.apple.scrollwheel.scaling" = -1.0;  # or 0 / a small float
      };
     };
  };

  # Determinate installer manages Nix itself
  nix.enable = false;

  system.stateVersion = 5;
  nixpkgs.hostPlatform = "aarch64-darwin";
}
