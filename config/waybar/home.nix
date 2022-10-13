{ config, lib, pkgs, ... }:

{
  home.file = {
    ".config/waybar/config".source = ./config.jsonc;
    ".config/waybar/style.css".source = ./style.css;
    ".config/waybar/scripts/gamma.sh".source = ./scripts/gamma.sh;
  };
}
