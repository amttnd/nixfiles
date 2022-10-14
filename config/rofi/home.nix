# Inspired by adi1090x
{ config, lib, pkgs, ... }:

{
  home.file = {
    ".config/rofi/config.rasi".source = ./config.rasi;
    ".config/rofi/background.png".source = ./background.png;
    ".config/rofi/launcher/script.sh".source = ./launcher/script.sh;
    ".config/rofi/launcher/theme.rasi".source = ./launcher/theme.rasi;
    ".config/rofi/powermenu/script.sh".source = ./powermenu/script.sh;
    ".config/rofi/powermenu/theme.rasi".source = ./powermenu/theme.rasi;
  };
}
