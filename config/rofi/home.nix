# Inspired by adi1090x
{ config, lib, pkgs, ... }:

{
  home.file = {
    ".config/rofi/config.rasi".source = ./config.rasi;
    ".config/rofi/dracula.rasi".source = ./dracula.rasi;
    ".config/rofi/background.png".source = ./background.png;
  };
}
