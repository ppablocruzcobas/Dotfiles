# Font for window titles.
font pango:Hack Nerd Font Bold 11
title_align center

default_orientation auto
workspace_layout default

# Colors
set $back               #282C34
set $primary            #ABB2BF
set $secondary          #0FE0C9
set $black              #282A2E
set $grey               #3E4452
set $white              #C5C8C6

# class                 border   backgr.  text    indicator child_border
# client.focused          #3E4452  #3E4452  $white  #2e9ef4   #3E4452
# client.focused_inactive $back    $back    $white  #484e50   $back
client.unfocused        $back    $back    $grey   #292d2e   $back
client.urgent           $back    #900000  $white  #900000   #900000
client.placeholder      $back    #0c0c0c  $white  #000000   #0c0c0c
client.background       $back

for_window [class="^.*"] border pixel 3
for_window [title="mpv"] floating enable
for_window [class="Xed"] floating enable
# for_window [title="Thunar"] floating enable
for_window [title="ClipGrab"] floating enable
for_window [title="Catfish"] floating enable
for_window [title="Viewnior"] floating enable
for_window [class="lxqt-openssh-askpass"] floating enable
for_window [class="Galculator"] floating enable
for_window [class="Blueman-manager"] floating enable
for_window [class="Nm-connection-editor"] floating enable
for_window [class="Lightdm-gtk-greeter-settings"] floating enable
for_window [class="Manjaro Settings Manager"] floating enable
for_window [class="Manjaro-hello"] floating enable
for_window [class="Xfburn"] floating enable
for_window [class="Pavucontrol"] floating enable
for_window [class="qt5ct"] floating enable
for_window [class="Pulseeffects"] floating enable
# for_window [class="Pamac-manager"] floating enable
# for_window [class="libreoffice"] floating enable

# Background
exec --no-startup-id feh --no-fehbg --bg-fill '/home/ppablocruzcobas/Pictures/Wallpapers/mojave_dynamic_12.jpg'

# Automatically select best layout for new windows
exec --no-startup-id autotiling

# Tmux...
# exec tmux has-session -t $HOST || alacritty -e tmux new -s $HOST &

# Icons on workspaces
exec --no-startup-id i3-workspace-names-daemon --delimiter " " --no-match-not-show-name --uniq

# Composition
exec --no-startup-id picom

# Launcher
exec --no-startup-id albert

# Redlight at night
exec --no-startup-id redshift

# Xfce4 services...
exec --no-startup-id thunar --daemon
exec --no-startup-id /usr/lib/xfce4/notifyd/xfce4-notifyd
exec --no-startup-id xfce4-power-manager
exec --no-startup-id xfce4-volumed-pulse
exec --no-startup-id /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 
exec --no-startup-id mpd
exec --no-startup-id mpDris2
exec --no-startup-id nm-applet

# Remember last visited workspace
workspace_auto_back_and_forth yes

# Use pactl to adjust volume in PulseAudio.
set $refresh_i3status killall -SIGUSR1 i3status
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5% && $refresh_i3status
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5% && $refresh_i3status
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status

bindsym Ctrl+Mod1+p exec playerctl play-pause
bindsym Ctrl+Mod1+n exec playerctl next

# Use these keys for focus, movement, and resize directions
set $up k
set $down j
set $left h
set $right l

# i3-gaps stuff
gaps inner 8
gaps outer 8

# Use Mouse+Mod1 to drag floating windows to their wanted position
floating_modifier Mod1

# Start a terminal
bindsym Mod1+Return exec alacritty
# Toggle Albert
bindsym Mod1+F2 exec albert toggle

bindsym Mod4+e exec thunar
bindsym Mod4+s exec qutebrowser -r accounts
bindsym Mod4+w exec qutebrowser -r default
bindsym Mod4+t exec /opt/tdesktop/Telegram
# bindsym Mod4+m exec alacritty -t mutt -e neomutt
bindsym Mod4+a exec alacritty -t ncmpcpp -e ncmpcpp
bindsym Mod4+h exec alacritty -t htop -e htop
bindsym Mod4+n exec alacritty -t nvim -e nvim
bindsym Mod4+c exec alacritty -t mc -e mc -u

# Kill focused window
bindsym Mod1+F4 kill

# Show Exit menu
bindsym Mod4+F4 exec ~/.config/i3/scripts/powermenu.sh

# alternatively, you can use the cursor keys:
bindsym Mod1+Left  focus left
bindsym Mod1+Down  focus down
bindsym Mod1+Up    focus up
bindsym Mod1+Right focus right

# Move focused window
bindsym Mod1+Shift+$left move left
bindsym Mod1+Shift+$down move down
bindsym Mod1+Shift+$up move up
bindsym Mod1+Shift+$right move right

# Alternatively, you can use the cursor keys:
bindsym Mod1+Shift+Left move left
bindsym Mod1+Shift+Down move down
bindsym Mod1+Shift+Up move up
bindsym Mod1+Shift+Right move right

# Lock
bindsym Mod1+Ctrl+Delete exec betterlockscreen -l blur 
bindsym XF86Sleep exec betterlockscreen -l blur && echo mem > /sys/power/state

# Screenshots
bindsym Print exec scrot -e 'mv $f ~/Pictures/Screenshots/'
bindsym Mod1+Print exec scrot -u -e 'mv $f ~/Pictures/Screenshots/'
bindsym Mod1+Shift+Print exec scrot -s -e 'mv $f ~/Pictures/Screenshots/'

# Split in horizontal orientation
bindsym Mod1+b split h

# Split in vertical orientation
bindsym Mod1+v split v

# Enter fullscreen mode for the focused container
bindsym Mod1+f fullscreen toggle

# Change container layout (stacked, tabbed, toggle split)
bindsym Mod1+s layout stacking
bindsym Mod1+w layout tabbed
bindsym Mod1+e layout toggle split

# Navigate workspaces
bindsym Mod4+Tab workspace next
bindsym Mod4+Shift+Tab workspace prev

# Navigate workspaces
bindsym Mod1+Tab exec i3-alt-tab --next
bindsym Mod1+Shift+Tab exec i3-alt-tab --prev


# Toggle tiling / floating
bindsym Mod1+Shift+space floating toggle

# Change focus between tiling / floating windows
bindsym Mod1+space focus mode_toggle

# Focus the parent container
bindsym Mod1+a focus parent

# Move the currently focused window to the scratchpad
bindsym Mod1+Shift+minus move scratchpad

# Show the next scratchpad window or hide the focused scratchpad window.
# If there are multiple scratchpad windows, this command cycles through them.
bindsym Mod1+minus scratchpad show

# Read 1 character and mark the current window with this character
bindsym Mod1+m exec i3-input -F 'mark %s' -l 1 -P 'Mark: '
# Read 1 character and go to the window with the character
bindsym Mod1+g exec i3-input -F '[con_mark="%s"] focus' -l 1 -P 'Goto: '

# Define names for default workspaces for which we configure key bindings later on.
# We use variables to avoid repeating the names in multiple places.
set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws0 "0"

# Switch to workspace
bindsym Mod1+1 workspace number $ws1
bindsym Mod1+2 workspace number $ws2
bindsym Mod1+3 workspace number $ws3
bindsym Mod1+4 workspace number $ws4
bindsym Mod1+5 workspace number $ws5
bindsym Mod1+6 workspace number $ws6
bindsym Mod1+7 workspace number $ws7
bindsym Mod1+8 workspace number $ws8
bindsym Mod1+9 workspace number $ws9
bindsym Mod1+0 workspace number $ws0

# Move focused container to workspace
bindsym Mod1+Shift+1 move container to workspace number $ws1
bindsym Mod1+Shift+2 move container to workspace number $ws2
bindsym Mod1+Shift+3 move container to workspace number $ws3
bindsym Mod1+Shift+4 move container to workspace number $ws4
bindsym Mod1+Shift+5 move container to workspace number $ws5
bindsym Mod1+Shift+6 move container to workspace number $ws6
bindsym Mod1+Shift+7 move container to workspace number $ws7
bindsym Mod1+Shift+8 move container to workspace number $ws8
bindsym Mod1+Shift+9 move container to workspace number $ws9
bindsym Mod1+Shift+0 move container to workspace number $ws0

# Reload the configuration file
bindsym Mod1+Shift+c reload
# Restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym Mod1+Shift+r restart

# resize window (you can also use the mouse for that)
mode "Resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym $left       resize shrink width 5 px or 5 ppt
        bindsym $down       resize grow height 5 px or 5 ppt
        bindsym $up         resize shrink height 5 px or 5 ppt
        bindsym $right      resize grow width 5 px or 5 ppt

        # same bindings, but for the arrow keys
        bindsym Left        resize shrink width 5 px or 5 ppt
        bindsym Down        resize grow height 5 px or 5 ppt
        bindsym Up          resize shrink height 5 px or 5 ppt
        bindsym Right       resize grow width 5 px or 5 ppt

        # back to normal: Enter or Escape or Mod1+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym Mod1+r mode "default"
}
bindsym Mod1+r mode "Resize"

# Don't change focus using mouse.
focus_follows_mouse no

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
    position top
    workspace_buttons yes
    tray_output none
    height 28
    font pango:DejaVu Sans Mono, AwesomeFont Regular 13
    status_command /usr/bin/i3status-rs $HOME/.config/i3/i3status-top.toml
    colors {
        separator #002b36
        background #002b36
        statusline #002b36
        focused_workspace #bfbfbf #268bd2 #002b36
        active_workspace #bfbfbf #268bd2 #002b36
        inactive_workspace #666666 #002b36 #839496
        urgent_workspace #666666 #750000 #f9f9f9
    }
}
