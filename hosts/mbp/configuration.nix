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

  security.pam.services.sudo_local = {
    touchIdAuth = true;   # pam_tid.so: fingerprint for sudo
    reattach = true;      # pam_reattach: makes it work inside Rex/tmux panes
  };

  users.users.daniel = {
    name = "daniel";
    home = "/Users/daniel";
    shell = pkgs.fish;
    uid = 501;
  };

  services.tailscale.enable = true;

  # CLI tools (replaces brew install)
  environment.systemPackages = with pkgs; [
    postgresql
    nodejs
    protobuf
    colima
    docker
    docker-compose
    claude-code
    tailscale
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

# Or the more complete reduce-motion style settings:

  # macOS preferences
  # https://nix-darwin.github.io/nix-darwin/manual/
  system.defaults = {
    dock.autohide = true;
    dock.orientation = "left";
    dock.mru-spaces = false;
    finder.AppleShowAllFiles = false;

    NSGlobalDomain = {
      NSAutomaticWindowAnimationsEnabled = false;
      NSScrollAnimationEnabled = false;
      NSWindowResizeTime = 0.001;
      KeyRepeat = 1;
      InitialKeyRepeat = 20;
    };

    CustomUserPreferences."com.apple.AppleMultitouchMouse" = {
     MouseMomentumScroll = false;

     ".GlobalPreferences" = {
        "com.apple.scrollwheel.scaling" = -1.0;  # or 0 / a small float
      };
     };

    # Rex has no font option in init.lua; it reads the font from its app preferences
    CustomUserPreferences."com.superlogical.rex" = {
      "Workspace.terminalFontName" = "Iosevka NFM";
      "Workspace.terminalFontPointSize" = 18.0;
      # Move Hide off cmd+h (now previous tab in rex/init.lua) to cmd+ctrl+opt+shift+h
      NSUserKeyEquivalents."Hide Rex Beta" = "@^~$h";
    };
  };

  # Determinate installer manages Nix itself
  nix.enable = false;

  system.stateVersion = 5;
  nixpkgs.hostPlatform = "aarch64-darwin";
}
