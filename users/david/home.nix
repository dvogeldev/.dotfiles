{ config, pkgs, ... }:

{

 # Emacs overlay
 nixpkgs.overlays = [
   (import (builtins.fetchTarball {
     url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
   }))
 ];


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "david";
  home.homeDirectory = "/home/david";

  home.packages = with pkgs; [
    git-crypt

    # Archiving
    unrar
    unzip
    xz
    zip

    # System Utils
    cpu-x
    direnv
    fd
    file
    flameshot
    fzf
    ripgrep
    rsync
    sshfs
    wget
    xclip
    xdg_utils

    # Emacs related tooling
    proselint
    sqlite
    graphviz

    # Apps
    tdesktop
    bitwarden

    # Emacs
    coreutils
    clang
    emacs-all-the-icons-fonts
  ];

  # Fonts
  fonts.fontconfig.enable = true;

  programs.exa.enable = true;
  programs.bat.enable = true;

 # Emacs
 programs.emacs = {
   enable = true;
   package = pkgs.emacsGit;
 };

  programs.alacritty.enable = true;

  programs.gpg.enable = true;

  programs.git = {
    enable = true;
    signing.key = "AA433486035A7493944145BE286070A95F700555";
    userEmail = "dvogel@fastmail.com";
    userName = "David Vogel";
  };

  programs.man.enable = true;
  programs.zsh.enable = true;

  # services.emacs.enable = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}
