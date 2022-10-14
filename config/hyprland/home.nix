{ config, lib, pkgs, ... }:

{
  home.file = {
    ".config/hypr/hyprland.conf".text = ''
      monitor=DP-1,1920x1080@144,0x0,1

      general {
        main_mod=SUPER
        border_size=2
        gaps_in=4
        gaps_out=4
        col.active_border=0xffbd93f9
        col.inactive_border=0xff1e1f29
        damage_tracking=full
        layout=master
      }

      decoration {
        rounding=4
        multisample_edges=true
        active_opacity=1
        inactive_opacity=1
        fullscreen_opacity=1
        blur=false
        drop_shadow=false
      }

      animations {
        enabled=true
      }

      input {
        kb_layout=us
        follow_mouse=1
        repeat_delay=250
        numlock_by_default=1
        force_no_accel=1
        sensitivity=1
      }

      master {
        special_scale_factor=0.5
        new_is_master=false
      }

      dwindle {
        pseudotile=0
      }

      bind=SUPER,Return,exec,${pkgs.alacritty}/bin/alacritty

      bind=SUPER,Space,exec,~/.config/rofi/launcher/script.sh
      bind=SUPERSHIFT,Q,exec,~/.config/rofi/powermenu/script.sh

      bind=SUPER,F,togglefloating,
      bind=SUPER,Q,killactive,
      bind=SUPER,Escape,exit,

      bind=SUPER,1,workspace,1
      bind=SUPER,2,workspace,2
      bind=SUPER,3,workspace,3
      bind=SUPER,4,workspace,4
      bind=SUPER,5,workspace,5
      bind=SUPER,6,workspace,6
      bind=SUPER,7,workspace,7
      bind=SUPER,8,workspace,8
      bind=SUPER,9,workspace,9
      bind=SUPER,0,workspace,10
      bind=SUPER,right,workspace,+1
      bind=SUPER,left,workspace,-1

      bind=SUPERSHIFT,1,movetoworkspace,1
      bind=SUPERSHIFT,2,movetoworkspace,2
      bind=SUPERSHIFT,3,movetoworkspace,3
      bind=SUPERSHIFT,4,movetoworkspace,4
      bind=SUPERSHIFT,5,movetoworkspace,5
      bind=SUPERSHIFT,6,movetoworkspace,6
      bind=SUPERSHIFT,7,movetoworkspace,7
      bind=SUPERSHIFT,8,movetoworkspace,8
      bind=SUPERSHIFT,9,movetoworkspace,9
      bind=SUPERSHIFT,0,movetoworkspace,10
      bind=SUPERSHIFT,right,movetoworkspace,+1
      bind=SUPERSHIFT,left,movetoworkspace,-1

      bindm=SUPER,mouse:272,movewindow
      bindm=SUPER,mouse:273,resizewindow

      bind=ALT,left,movefocus,l
      bind=ALT,right,movefocus,r
      bind=ALT,up,movefocus,u
      bind=ALT,down,movefocus,d

      bind=CTRL,right,resizeactive,20 0
      bind=CTRL,left,resizeactive,-20 0
      bind=CTRL,up,resizeactive,0 -20
      bind=CTRL,down,resizeactive,0 20

      exec-once=${pkgs.waybar}/bin/waybar
      exec-once=${pkgs.hyprpaper}/bin/hyprpaper
    '';
    ".config/hypr/hyprpaper.conf".text = ''
      preload = ~/.config/hypr/background.jpg
      wallpaper = DP-1,~/.config/hypr/background.jpg
    '';
    ".config/hypr/background.jpg".source = ./background.jpg;
  };
}
