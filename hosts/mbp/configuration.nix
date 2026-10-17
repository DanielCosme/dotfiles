{ pkgs, ... }:

{
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
    git fish neovim tree btop
  ];

  # GUI apps (declarative Homebrew)
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    casks = [ "ghostty" "bitwarden" "brave-browser" "zed" ];
  };

  # macOS preferences
  # https://nix-darwin.github.io/nix-darwin/manual/
  system.defaults = {
    dock.autohide = true;
    dock.orientation = "left";
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
