{ config, lib, pkgs, ... }:

{
  home.file = {
    ".config/hypr/hyprland.conf".text = ''
      monitor=DP-1,1920x1080@144,0x0,1

      workspace=DP-1,1

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
        rounding=0
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
        no_gaps_when_only=true
      }

      dwindle {
        pseudotile=0
      }

      bind=SUPER,Return,exec,${pkgs.alacritty}/bin/alacritty
      bind=SUPER,Space,exec,${pkgs.rofi-wayland}/bin/rofi -show drun
      bind=SUPER,Q,killactive,
      bind=SUPER,Escape,exit,

      bind=SUPER,left,movefocus,l
      bind=SUPER,right,movefocus,r
      bind=SUPER,up,movefocus,u
      bind=SUPER,down,movefocus,d

      bind=ALT,1,workspace,1
      bind=ALT,2,workspace,2
      bind=ALT,3,workspace,3
      bind=ALT,4,workspace,4
      bind=ALT,5,workspace,5
      bind=ALT,6,workspace,6
      bind=ALT,7,workspace,7
      bind=ALT,8,workspace,8
      bind=ALT,9,workspace,9
      bind=ALT,0,workspace,10
      bind=ALT,right,workspace,+1
      bind=ALT,left,workspace,-1

      bind=ALTSHIFT,1,movetoworkspace,1
      bind=ALTSHIFT,2,movetoworkspace,2
      bind=ALTSHIFT,3,movetoworkspace,3
      bind=ALTSHIFT,4,movetoworkspace,4
      bind=ALTSHIFT,5,movetoworkspace,5
      bind=ALTSHIFT,6,movetoworkspace,6
      bind=ALTSHIFT,7,movetoworkspace,7
      bind=ALTSHIFT,8,movetoworkspace,8
      bind=ALTSHIFT,9,movetoworkspace,9
      bind=ALTSHIFT,0,movetoworkspace,10
      bind=ALTSHIFT,right,movetoworkspace,+1
      bind=ALTSHIFT,left,movetoworkspace,-1

      bind=CTRL,right,resizeactive,20 0
      bind=CTRL,left,resizeactive,-20 0
      bind=CTRL,up,resizeactive,0 -20
      bind=CTRL,down,resizeactive,0 20

      bindm=SUPER,mouse:272,movewindow
      bindm=SUPER,mouse:273,resizewindow

      exec-once=${pkgs.waybar}/bin/waybar
    '';
  };
}
