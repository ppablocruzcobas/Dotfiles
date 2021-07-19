# Font for window titles.
font pango:Hack Nerd Font Bold 11
title_align center

default_orientation auto
workspace_layout default

# Class                 border  bground text    indicator child_border

client.focused          #6272A4 #6272A4 #F8F8F2 #6272A4   #6272A4
client.focused_inactive #44475A #44475A #F8F8F2 #44475A   #44475A
client.unfocused        #282A36 #282A36 #BFBFBF #282A36   #282A36
client.urgent           #44475A #FF5555 #F8F8F2 #FF5555   #FF5555
client.placeholder      #282A36 #282A36 #F8F8F2 #282A36   #282A36

# client.focused          #4C7899 #285577 #FFFFFF #2E9EF4   #285577
# client.focused_inactive #333333 #5F676A #FFFFFF #484E50   #5F676A
# client.unfocused        #333333 #222222 #888888 #292D2E   #222222
# client.urgent           #2F343A #900000 #FFFFFF #900000   #900000
# client.placeholder      #000000 #0C0C0C #FFFFFF #000000   #0C0C0C

client.background       #F8F8F2

# Border
for_window [class="^.*"] border pixel 2

# Floating...
for_window [window_role="pop-up"] floating enable
for_window [window_role="task_dialog"] floating enable
for_window [title="Preferences$"] floating enable
# Floating for custom apps...
for_window [title="mpv"] floating enable
for_window [class="Xed"] floating enable
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
for_window [class="Pavucontrol"] floating enable
for_window [class="qt5ct"] floating enable
for_window [class="Pulseeffects"] floating enable
for_window [class="Skype"] floating enable
for_window [class="Telegram"] floating enable
for_window [class="libreoffice"] floating enable

# Redlight at night
exec --no-startup-id redshift

# Composition
exec --no-startup-id picom

# Theme configuration
# set $gnome-schema org.gnome.desktop.interface
# exec_always {
#     gsettings set $gnome-schema gtk-theme 'Matcha-dark-sea'
#     gsettings set $gnome-schema icon-theme 'Papirus-Dark-Maia'
#     gsettings set $gnome-schema cursor-theme 'Simple-and-Soft'
#     # gsettings set $gnome-schema font-name ''
# }

# Services...
exec --no-startup-id thunar --daemon
exec --no-startup-id tvolnoti -T dark
exec --no-startup-id dunst
exec --no-startup-id nm-applet

# Launcher
exec --no-startup-id albert

# Automatically select best layout for new windows
exec --no-startup-id autotiling

# Icons on workspaces
exec --no-startup-id i3-workspace-names-daemon --delimiter " " --no-match-not-show-name --uniq

# Lock screen when idle...
exec --no-startup-id xidlehook --not-when-audio --not-when-fullscreen --timer 300 "betterlockscreen -l" ""

# Clean common partition...
# exec ntfsfix /dev/sdc1

# Remember last visited workspace
workspace_auto_back_and_forth yes

# Use pactl to adjust volume in PulseAudio.
set $refresh_i3status killall -SIGUSR1 i3status
bindsym XF86AudioRaiseVolume exec ~/.config/i3/scripts/volume.sh up
bindsym XF86AudioLowerVolume exec ~/.config/i3/scripts/volume.sh down
bindsym XF86AudioMute exec exec ~/.config/i3/scripts/volume.sh mute

# Sreen brightness controls
bindsym XF86MonBrightnessUp exec ~/.config/i3/scripts/brightness.sh up
bindsym XF86MonBrightnessDown exec ~/.config/i3/scripts/brightness.sh down

# Control players like Spotify...
bindsym Ctrl+Mod1+p exec playerctl play-pause
bindsym Ctrl+Mod1+n exec playerctl next

# Use these keys for focus, movement, and resize directions
set $up k
set $down j
set $left h
set $right l

# i3-gaps stuff
gaps inner 8
gaps outer 4

# Use Mouse+Mod1 to drag floating windows to their wanted position
floating_modifier Mod1

# Start a terminal
bindsym Mod1+Return exec alacritty

# Toggle Albert
bindsym Mod1+F2 exec albert toggle

# Shortcut for some apps...
bindsym Mod4+e exec thunar
bindsym Mod4+q exec qutebrowser -r default
bindsym Mod4+t exec /opt/tdesktop/Telegram
bindsym Mod4+s exec Skype
bindsym Mod4+w exec whatsapp-for-linux
bindsym Mod4+h exec alacritty -t htop -e htop
bindsym Mod4+n exec alacritty -t nvim -e nvim
bindsym Mod4+c exec alacritty -t mc -e mc -u

# Kill focused window
bindsym Mod1+F4 kill

# Jump to urgent windows...
bindsym Mod1+u [urgent=latest] focus

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
bindsym Mod1+Ctrl+Delete exec betterlockscreen -l
bindsym XF86Sleep exec betterlockscreen -l && echo mem > /sys/power/state

# Screenshots
bindsym Print exec scrot -e 'mv $f ~/Bilder/Screenshots/'
bindsym Mod1+Print exec scrot -u -e 'mv $f ~/Bilder/Screenshots/'
bindsym Mod1+Shift+Print exec scrot -s -e 'mv $f ~/Bilder/Screenshots/'

# Split in horizontal orientation
bindsym Mod1+b split h

# Split in vertical orientation
bindsym Mod1+v split v

# Enter fullscreen mode for the focused container
bindsym Mod1+f fullscreen toggle

# Master-stack...
bindsym Mod1+a exec "i3-msg \\"move left; focus up; move right; focus left\\""

# Change container layout (stacked, tabbed, toggle split)
bindsym Mod1+s layout stacking
bindsym Mod1+w layout tabbed
bindsym Mod1+e layout toggle split

# Navigate workspaces
bindsym Mod4+Tab workspace next
bindsym Mod4+Shift+Tab workspace prev

# Navigate apps...
bindsym Mod1+Tab exec i3-alt-tab --next
bindsym Mod1+Shift+Tab exec i3-alt-tab --prev


# Toggle tiling / floating
bindsym Mod1+Shift+space floating toggle

# Change focus between tiling / floating windows
bindsym Mod1+space focus mode_toggle

# Focus the parent container
bindsym Mod1+p focus parent

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
    # status_command /usr/bin/i3status-rs $HOME/.config/i3/i3status-top.toml
    status_command ~/.local/bin/bumblebee-status #-a playerctl

    colors {
        background #282A36
        statusline #F8F8F2
        separator  #44475A

        focused_workspace  #44475A #44475A #F8F8F2
        active_workspace   #282A36 #44475A #F8F8F2
        inactive_workspace #282A36 #282A36 #BFBFBF
        urgent_workspace   #FF5555 #FF5555 #F8F8F2
        binding_mode       #FF5555 #FF5555 #F8F8F2

        # focused_workspace  #4C7899 #285577 #FFFFFF
        # active_workspace   #333333 #222222 #FFFFFF
        # inactive_workspace #333333 #222222 #888888
        # urgent_workspace   #2F343A #900000 #FFFFFF
        # binding_mode       #2F343A #900000 #FFFFFF
    }
}
