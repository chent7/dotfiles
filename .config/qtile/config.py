#
#   █▀▀█ █▀▀█ █▀▀ █▀▀ █▀▀█ █ █▀▀ 　 █▀▀ █▀▀█ █▀▀▄ █▀▀ ░▀░ █▀▀▀
#   █░░█ █▄▄█ █░░ █▀▀ █▄▄▀ ░ ▀▀█ 　 █░░ █░░█ █░░█ █▀▀ ▀█▀ █░▀█
#   █▀▀▀ ▀░░▀ ▀▀▀ ▀▀▀ ▀░▀▀ ░ ▀▀▀ 　 ▀▀▀ ▀▀▀▀ ▀░░▀ ▀░░ ▀▀▀ ▀▀▀▀
#

import json
from typing import List  # noqa: F401
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

##### Import Pywal Palette #####
with open('/home/pacer/.cache/wal/colors.json') as json_file:
    data = json.load(json_file)
    colorsarray = data['colors']
    val_list = list(colorsarray.values())
    def getList(val_list):
        return [*val_list]

def init_colors():
    return [*val_list]

colors = init_colors()
##### End Import Pywal Palette #####

mod = "mod1"
terminal = "kitty"
color_bg = colors[0]
color_focus = colors[1]

keys = [
    # MonadTall Binds
    Key([mod], "Left", lazy.layout.left()),
    Key([mod], "Right", lazy.layout.right()),
    Key([mod], "Down", lazy.layout.down()),
    Key([mod], "Up", lazy.layout.up()),
    Key([mod, "shift"], "Left", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "Right", lazy.layout.shuffle_right()),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up()),
    Key([mod], "equal", lazy.layout.grow_main()),
    Key([mod], "minus", lazy.layout.shrink_main()),
    Key([mod], "n", lazy.layout.normalize()),
    Key([mod, "shift"], "space", lazy.layout.flip()),

    # Window Manager Binds
    Key([mod], "Return", lazy.spawn(terminal)),
    Key([mod, "shift"], "q", lazy.window.kill()),
    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "control"], "q", lazy.shutdown()),
    Key(["mod4"], "l", lazy.spawn("i3lock -e -B 4")),
    Key([mod], "d", lazy.spawn("rofi -show drun")),
    Key([mod], "p", lazy.spawn("dmenu_run -p command: -nb %s -sb %s" % (color_bg,color_focus))),
]

groups = [
    Group(" WEB", position=1),
    Group(" GAM", position=2),
    Group(" SOC", position=3),
    Group(" FIL", position=4),
    Group(" CON", position=5),
    Group(" TER", position=6),
    Group(" COD", position=7),
    Group(" IMG", position=8),
    Group(" VID", position=9),
    Group(" TOR", position=10, matches=[Match(title=["qBittorrent v4.3.8"])],),
]

for g in groups:
    keys.extend([
        Key([mod], str(abs(g.position) % 10), lazy.group[g.name].toscreen()),
        Key([mod, "shift"], str(abs(g.position) % 10), lazy.window.togroup(g.name)),
    ])

layouts = [
    layout.MonadTall(
	border_focus=color_focus,
	border_normal=color_bg,
	border_width=3,
	margin=14,
    ),
]

widget_defaults = dict(
    font='JetBrains Mono',
    fontsize=14,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar([
	        widget.WindowName(
	    	    font='JetBrains Mono Bold',
		    padding=10,
	        ),
            widget.Clock(format='%Y-%m-%d %a %I:%M %p'),
        ],
            20,
	        background=color_bg,
	        opacity=0.7,
        ),
        bottom=bar.Bar([
            widget.Spacer(length=706,),
            widget.GroupBox(
                font='JetBrains Mono',
		        this_current_screen_border=color_focus,
		        borderwidth=0,
		        margin_x=0,
                margin_y=3,
	            rounded=False,
	            disable_drag=True,
	            highlight_method="block",
	        ),
            widget.Spacer(),
            widget.PulseVolume(
	            volume_app="pavucontrol",
	            step=5,
	            update_interval=0.15,
	        ),
            widget.Systray(),
        ],
            20,
            background=color_bg,
	        opacity=0.7,
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
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
    	*layout.Floating.default_float_rules,
    	Match(wm_class='Pavucontrol'),
    	Match(wm_class='imv'),
    	#Match(title=''),
    ],
    border_focus=color_focus,
    border_normal=color_bg,
    border_width=3,
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True
wmname = "LG3D" # fool java
