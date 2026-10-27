{ config, pkgs, lib, ... }:

{
  programs.fish = {
    enable = true;

    shellInit = ''
      if type -q ruby
        set -gx GEM_HOME (ruby -e 'puts Gem.user_dir')
        fish_add_path $GEM_HOME/bin
      end
    '';

    interactiveShellInit = ''
      set fish_greeting
      set -g fish_key_bindings fish_vi_key_bindings

      # Theme (from fish_frozen_theme.fish)
      set -g fish_color_autosuggestion 808080
      set -g fish_color_cancel -r
      set -g fish_color_command 5f8700
      set -g fish_color_comment 990000
      set -g fish_color_cwd green
      set -g fish_color_cwd_root red
      set -g fish_color_end 0000ff
      set -g fish_color_error ff0000
      set -g fish_color_escape 00a6b2
      set -g fish_color_history_current --bold
      set -g fish_color_host normal
      set -g fish_color_host_remote yellow
      set -g fish_color_match --background=brblue
      set -g fish_color_normal normal
      set -g fish_color_operator 00a6b2
      set -g fish_color_param afd700
      set -g fish_color_quote ffaf00
      set -g fish_color_redirection 8700af
      set -g fish_color_search_match bryellow --background=brblack
      set -g fish_color_selection white --bold --background=brblack
      set -g fish_color_status red
      set -g fish_color_user brgreen
      set -g fish_color_valid_path --underline
      set -g fish_pager_color_completion normal
      set -g fish_pager_color_description B3A06D yellow
      set -g fish_pager_color_prefix white --bold --underline
      set -g fish_pager_color_progress brwhite --background=cyan
      set -g fish_pager_color_selected_background -r
    '';

    shellAbbrs = {
      nv = "neovide --fork";
      mm = "mage";
      vi = "nvim";
      untar = "tar -xzvf";
      kk = "kubectl";
      kks = "sudo kubectl";
    };

    functions = {
      fish_user_key_bindings = ''
        for mode in insert default visual
          bind -M $mode \cf forward-char
        end
      '';
      history = "builtin history --show-time='%F %T ' $argv";
      t = "task $argv";
    };
  };

  xdg.enable = true;

  home.sessionVariables = {
    XDG_USER_CONFIG_DIR = config.xdg.configHome;
    AGE_KEY = "${config.xdg.dataHome}/.age.txt";
    DOCKER_BUILDKIT = "1";
    GOPATH = "${config.home.homeDirectory}/go";
    GOBIN = "${config.home.homeDirectory}/go/bin";
    GO111MODULE = "on";
    CARGO_BIN = "${config.home.homeDirectory}/.cargo/bin";
    NPM_PACKAGES = "${config.home.homeDirectory}/.npm_packages";
    PNPM_HOME = "${config.xdg.dataHome}/pnpm";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
    "$GOBIN"
    "$CARGO_BIN"
    "$NPM_PACKAGES/bin"
    "$PNPM_HOME"
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "Daniel Cosme";
      user.email = "cosmedaniel8@gmail.com";
      push.autoSetupRemote = true;
      init.defaultBranch = "main";
    };
  };

  # Sets itself as the credential helper for github.com
  programs.gh.enable = true;

  programs.starship.enable = true;

  # Zed writes to its config from the UI, so link to the repo instead of the read-only store
  xdg.configFile."zed/settings.json".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/code/dotfiles/home/zed/settings.json";
  xdg.configFile."zed/keymap.json".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/code/dotfiles/home/zed/keymap.json";
  xdg.configFile."zed/snippets".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/code/dotfiles/home/zed/snippets";

  home.stateVersion = "24.11";

  programs.neovim = {
  	enable = true;
   	defaultEditor = true;
  };

  home.packages = with pkgs; [
   bitwarden-cli
   tree
   btop
   cloc
   go
   gopls
   gotools
   nixd
  ];
}
