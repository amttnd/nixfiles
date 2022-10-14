{ config, lib, pkgs, user, ... }:

{
  imports = [
    ./config/hyprland/home.nix
    ./config/waybar/home.nix
    ./config/rofi/home.nix
    ./config/git/home.nix
    ./config/zsh/home.nix
    ./config/alacritty/home.nix
  ];

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
      # cli tools
      btop
      neofetch

      # source control
      git

      # browser
      google-chrome
      brave

      # editor
      neovim
      vscode

      # terminal
      alacritty

      # video/audio
      pavucontrol
      pamixer

      # window manager stuff
      rofi-wayland
      waybar
      gammastep
      hyprpaper

      # programming language management tool
      fnm

      # shell
      zsh

      # build essential
      gcc
    ];

    pointerCursor = {
      name = "Dracula-cursors";
      package = pkgs.dracula-theme;
      size = 16;
    };

    stateVersion = "22.05";
  };

  programs = {
    home-manager.enable = true;
  };

  gtk = {
    enable = true;
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    font = {
      name = "BlexMono Nerd Font Mono";
    };
  };
}
