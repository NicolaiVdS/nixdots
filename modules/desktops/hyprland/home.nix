{
  pkgs,
  inputs,
  ...
}: {
  home-manager.users.nicolaivds = {
    home.packages = with pkgs; [
      xdg-utils

      # Wallpaper deamon
      swww

      # Clipboard manager
      cliphist
      wl-clipboard
    ];

    wayland.windowManager.hyprland = {
      enable = true;
      enableNvidiaPatches = true;
      xwayland.enable = true;
      systemdIntegration = true;
      settings = {
        "$mainMod" = "SUPER";
        monitor = [
          "DP-2, 2560x1440@144, 0x0, 1"
        ];
        input = {
          kb_layout = "be";
          numlock_by_default = true;
          follow_mouse = 1;
          sensitivity = 0;
        };
        misc = {
          vfr = true;
          vrr = 0;
          layers_hog_keyboard_focus = true;
          disable_autoreload = false;
          disable_hyprland_logo = true;
          always_follow_on_dnd = true;
          animate_manual_resizes = true;
          enable_swallow = true;
          focus_on_activate = true;
        };
        general = {
          gaps_in = 5;
          gaps_out = 20;
          border_size = 2;
          "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
          "col.inactive_border" = "rgba(595959aa)";
          layout = "dwindle";
        };
        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };
        decoration = {
          rounding = 10;
          blur = {
            enabled = true;
            size = 3;
            passes = 1;
            new_optimizations = true;
          };
          drop_shadow = true;
          shadow_range = 4;
          shadow_render_power	= 3;
          "col.shadow" = "rgba(1a1a1aee)";
        };
        animations = {
          enabled = true;
          bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
          animation = [
            "windows, 1, 7, myBezier"
            "windowsOut, 1, 7, default, popin 80%"
            "border, 1, 10, default"
            "borderangle, 1, 8, default"
            "fade, 1, 7, default"
            "workspaces, 1, 6, default"
          ];
        };
        bind = [
          # basic bindings
          "$mainMod, Q, killactive,"
          "$mainMod, F, fullscreen,"
          "$mainMod, Space, togglefloating,"
          "$mainMod, P, pseudo,"
          "$mainMod, Y, pin,"
          "$mainMod, S, togglesplit,"
          "$mainMod, C, exec, hyprctl dispatch centerwindow none"
          "SUPER, M, movetoworkspace, special"
          "$mainMod SHIFT, M, togglespecialworkspace"
          "$mainMod, mouse_down, workspace, e-1"
          "$mainMod, mouse_up, workspace, e+1"

          # shortcuts bindings
          "$mainMod, RETURN, exec, foot"
          "$mainMod, D, exec, rofi -show drun -show-icons"
          # TODO: Set this up
          "SUPER, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-paste"
          "$mainMod, X, exec, pkill wlogout || wlogout -b 4"
          # "$mainMod, B, exec, pkill -SIGUSR1 .waybar-wrapped"
          # "$mainMod SHIFT, c ,exec, hyprpicker -a"

          # screenshots bindings
          # '',Print, exec, grimblast --notify --cursor save area ~/Pictures/screenshots/screenshot_$(date +"%b_%-d_%Y_%H:%M:%S").png''
          # "$mainMod, Print, exec, grimblast --notify --cursor  copy area"

          # switch workspaces bindings
          "$mainMod, AMPERSAND, workspace, 1"
          "$mainMod, EACUTE, workspace, 2"
          "$mainMod, QUOTEDBL, workspace, 3"
          "$mainMod, APOSTROPHE, workspace, 4"
          "$mainMod, PARENLEFT, workspace, 5"
          "$mainMod, SECTION, workspace, 6"
          "$mainMod, EGRAVE, workspace, 7"
          "$mainMod, EXCLAM, workspace, 8"
          "$mainMod, CCEDILLA, workspace, 9"
          "$mainMod, AGRAVE, workspace, 10"

          # move windows to workspace bindings
          "$mainMod SHIFT, AMPERSAND, movetoworkspace, 1"
          "$mainMod SHIFT, EACUTE, movetoworkspace, 2"
          "$mainMod SHIFT, QUOTEDBL, movetoworkspace, 3"
          "$mainMod SHIFT, APOSTROPHE, movetoworkspace, 4"
          "$mainMod SHIFT, PARENLEFT, movetoworkspace, 5"
          "$mainMod SHIFT, SECTION, movetoworkspace, 6"
          "$mainMod SHIFT, EGRAVE, movetoworkspace, 7"
          "$mainMod SHIFT, EXCLAM, movetoworkspace, 8"
          "$mainMod SHIFT, CCEDILLA, movetoworkspace, 9"
          "$mainMod SHIFT, AGRAVE, movetoworkspace, 10"

          # switch focus bindings
          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"

          # window move bindings
          "SUPER SHIFT, left, movewindow, l"
          "SUPER SHIFT, right, movewindow, r"
          "SUPER SHIFT, up, movewindow, u"
          "SUPER SHIFT, down, movewindow, d"

          # window reposition bindings
          "SUPER SHIFT, left, moveactive,  -80 0"
          "SUPER SHIFT, right, moveactive, 80 0"
          "SUPER SHIFT, up, moveactive, 0 -80"
          "SUPER SHIFT, down, moveactive, 0 80"

          # window resize bindings
          "SUPER CTRL, left, resizeactive, -80 0"
          "SUPER CTRL, right, resizeactive, 80 0"
          "SUPER CTRL, up, resizeactive, 0 -80"
          "SUPER CTRL, down, resizeactive, 0 80"

          # TODO: add the needed software to make this work
          # volume control bindings
          # ",XF86AudioRaiseVolume,exec, pamixer -i 5"
          # ",XF86AudioLowerVolume,exec, pamixer -d 5"
          # ",XF86AudioMute,exec, pamixer -t"

          # music control bindings
          # ",XF86AudioPlay,exec, playerctl play-pause"
          # ",XF86AudioNext,exec, playerctl next"
          # ",XF86AudioPrev,exec, playerctl previous"
          # ",XF86AudioStop, exec, playerctl stop"
        ];
        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];
        # TODO: This is a good example USE it
        # windowrule = [
        #   "size 700 450, pavucontrol"
        #   "move 40 55%, pavucontrol"
        #   "float,title:^(Transmission)$"
        #   "float,title:^(Volume Control)$"
        #   "float, Nautilus"
        #   "float, wlogout"
        #   "noanim, wlogout"
        #   "float,mpv"
        #   "move 510 290,mpv"
        #   "size 900 500,mpv"
        #   "idleinhibit focus,mpv"
        #   "float,imv"
        #   "move 510 290,imv"
        #   "size 900 500,imv"
        #   "float,title:^(Firefox — Sharing Indicator)$"
        #   "move 0 0,title:^(Firefox — Sharing Indicator)$"
        # ];
        # windowrulev2 = [
        #   "float, title:^(Picture-in-Picture)$"
        #   "opacity 1.0 override 1.0 override, title:^(Picture-in-Picture)$"
        #   "pin, title:^(Picture-in-Picture)$"
        #   "idleinhibit fullscreen, class:^(firefox)$"
        #   "idleinhibit focus, class:^(mpv)$"
        # ];
        exec-once = [
          # "hyprctl setcursor Catppuccin-Latte-Dark 16 &"
          # "exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
          # "sleep 1 && swww init && sleep 1 && swaylock && notify-send 'Hey $USER, Welcome back' &"
          "swww init"
          "wl-paste --type text --watch cliphist store &"
          "wl-paste --type image --watch cliphist store &"
          "waybar &"
          # "mako -c /home/nicolaivds/.cache/wal/mako.conf"
          # "${pkgs.mate.mate-polkit}/libexec/polkit-mate-authentication-agent-1 &"
          # "sleep 5 && discord --start-minimized &"
        ];
      };
    };
  };
}
