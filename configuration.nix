{ config, pkgs, inputs, user, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./config/hyprland
    ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  time = {
    timeZone = "Asia/Ho_Chi_Minh";
    hardwareClockInLocalTime = true;
  };

  i18n = {
    defaultLocale = "en_US.utf8";
    extraLocaleSettings = {
      LC_TIME = "en_GB.utf8";
    };
  };

  users.users.${user} = {
    isNormalUser = true;
    description = "Tam Nguyen";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  fonts = {
    enableDefaultFonts = true;
    fonts = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "IBMPlexMono"
      ];
    })
    ];
  };

  hardware.pulseaudio.enable = false;
  services = {
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };
  };

  nix = {
    settings ={
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  nixpkgs.config.allowUnfree = true;

  system = {
    autoUpgrade = {
      enable = true;
      flake = "github:tam-nd/nixfiles";
    };
    stateVersion = "22.05";
  };
}
