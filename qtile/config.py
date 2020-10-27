# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.


from typing import List  # noqa: F401
from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.lazy import lazy
from libqtile import layout, bar, widget


term = "alacritty"
mod = "mod4"

colors = [
    "#282a36",   # 0. background
    "#44475a",   # 1. selection
    "#8be9fd",   # 2. cyan
    "#50fa7b",   # 3. green
    "#ffb86c",   # 4. orange
    "#ff79c6",   # 5. pink
    "#bd93f9",   # 6. purple
    "#ff5555",   # 7. red
    "#f1fa8c",   # 8. yellow
]    

keys = [
    # Switch between windows in current stack pane
    Key([mod], "k", lazy.layout.down()),
    Key([mod], "j", lazy.layout.up()),

    # Move windows up or down in current stack
    Key([mod, "control"], "k", lazy.layout.shuffle_down()),
    Key([mod, "control"], "j", lazy.layout.shuffle_up()),

    # Switch window focus to other pane(s) of stack
    Key([mod], "Tab", lazy.layout.next()),

    # Swap panes of split stack
    Key([mod, "shift"], "space", lazy.layout.rotate()),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.spawn("dmenu_run -p 'Run: '")),
    Key([mod], "Return", lazy.spawn(term)),

    # Toggle between different layouts as defined below
    Key([mod], "space", lazy.next_layout()),
    Key([mod, "shift"], "c", lazy.window.kill()),

    Key([mod, "shift"], "r", lazy.restart()),
    Key([mod, "shift"], "q", lazy.shutdown()),
    Key([mod], "r", lazy.spawncmd()),

    Key([mod, "mod1"], "b", lazy.spawn("brave")),
    Key([mod, "mod1"], "k", lazy.spawn("keepassxc")),
    Key([mod, "mod1"], "s", lazy.spawn(term + " -e sh ./.local/bin/launchspt")),
    Key([mod, "mod1"], "f", lazy.spawn(term + " -e sh ./.local/bin/vifmrun")),
    Key([mod, "mod1"], "p", lazy.spawn("planner")),

    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%")),
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),

    Key([], "XF86MonBrightnessUp", lazy.spawn("xbacklight -inc 5")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("xbacklight -dec 5")),

    Key([mod], "s", lazy.spawn(term + " -e sh ./.local/bin/screenshot full")),
    Key([mod, "shift"], "s", lazy.spawn(term + " -e sh ./.local/bin/screenshot window")),

    Key([mod], "i", lazy.layout.grow()),
    Key([mod], "m", lazy.layout.shrink()),
    Key([mod], "n", lazy.layout.normalize()),
    Key([mod, "shift"], "space", lazy.layout.flip()),
]

groups = [Group(i) for i in ["ter", "net", "dev", "media", "misc"]]

for i, group in enumerate(groups):
    # Each workspace is identified by a number starting at 1
    actual_key = str(i + 1)
    keys.extend([
        # Switch to workspacke N (actual_key)
        Key([mod], actual_key, lazy.group[group.name].toscreen()),
        # Send window to workspace N (actual_key)
        Key([mod, "shift"], actual_key, lazy.window.togroup(group.name))
    ])

layout_theme = {"border_width": 3,
                "margin": 10,
                "border_focus": colors[6],
                "border_normal": "#000000",
               }

layouts = [
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.Max(**layout_theme),
    layout.Floating(),
    # Try more layouts by unleashing below layouts.
    # layout.Bsp(),
    # layout.Columns(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font='mononoki Nerd Font Mono',
    fontsize=12,
    padding=3,
    background=colors[0]
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(linewidth=0, padding = 20),
                widget.GroupBox(
                    active = "#ffffff",
                    inactive = "#ffffff",
                    highlight_method = "line",
                    highlight_color = colors[1],
                    this_current_screen_border = colors[6],
                    fontsize = 12
                ),
                widget.Prompt(),
                widget.WindowName(),
                widget.Systray(),
                widget.Clock(format='%A, %B %d [%H:%M]', background=colors[0], foreground=colors[8]),
                widget.Sep(linewidth = 0, padding = 3),
                widget.TextBox(text=":"),
                widget.Sep(linewidth = 0, padding = 3),
                widget.TextBox(text="", fontsize=20, foreground=colors[2]),
                widget.DF(visible_on_warn=False, format="{uf}{m}", foreground=colors[2]),
                widget.Sep(linewidth = 0, padding = 3),
                widget.TextBox(text=":"),
                widget.Sep(linewidth = 0, padding = 3),
                widget.TextBox(text="", fontsize=23, foreground=colors[3]),
                widget.CPU(format="{load_percent}%", foreground=colors[3]),
                widget.Sep(linewidth = 0, padding = 3),
                widget.TextBox(text=":"),
                widget.Sep(linewidth = 0, padding = 3),
                widget.Battery(charge_char='', discharge_char='', full_char='',
                               format='{char} {percent:2.0%}', background=colors[0],
                               foreground=colors[7]),
                widget.Sep(linewidth = 0, padding = 3),
                widget.TextBox(text=":"),
                widget.Sep(linewidth = 0, padding = 3),
                widget.TextBox(text="", fontsize=25, padding = 0, background=colors[0], foreground=colors[6]),
                widget.Backlight(backlight_name='intel_backlight', padding = 0, background=colors[0], foreground=colors[6]),
                widget.Sep(linewidth = 0, padding = 3),
                widget.TextBox(text=":"),
                widget.Sep(linewidth = 0, padding = 3),
                widget.TextBox(text="", fontsize=25, background=colors[0], foreground=colors[5]),
                widget.Volume(background=colors[0], foreground=colors[5]),
                widget.Sep(linewidth = 0, padding = 3),
                widget.TextBox(text=":"),
                widget.Sep(linewidth = 0, padding = 3),
                widget.TextBox(text='Updates:', background=colors[0], foreground=colors[4]),
                widget.Pacman(background=colors[0], foreground=colors[4], update_interval=1800),
                widget.Sep(linewidth = 0, padding = 3),
                widget.TextBox(text=":"),
                widget.Sep(linewidth = 0, padding = 3),
                widget.CurrentLayout(foreground=colors[8]),
                widget.Sep(linewidth = 0, padding = 3),
                widget.Sep(linewidth=0, padding = 20),
            ],
            25,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

#@hook.subscribe.startup_once
#def start_once():
#    lazy.spawn("nitrogen --restore &")
#    lazy.spawn("dunst &")
#    home = os.path.expanduser('~')
#    subprocess.call([home + '/.config/qtile/autostart.sh'])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
