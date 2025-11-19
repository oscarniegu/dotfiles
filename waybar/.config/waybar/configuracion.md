# Ruta: `/home/elthelbar/.dotfiles/waybar/.config/waybar/config`

```
{
    "layer": "top",
    "position": "top",
    "mod": "dock",
    "exclusive": true,
    "passthrough": false,
    "gtk-layer-shell": true,
    "height": 36,
    "margin-right": 5,
    "margin-left": 5, 

    "modules-left": [
        "custom/rofi",
        "custom/weather",
        "custom/khorshididate",
        "clock",
        "wlr/taskbar",
    ],

    "modules-center": [
        "hyprland/workspaces",
    ],

    "modules-right": [
        "tray",
        "battery",
        "pulseaudio",
        "pulseaudio#microphone",
        "backlight",
        "cpu",
        "memory",
        "disk",
        "temperature",
        "custom/updates",
        "network",
        "hyprland/language",
        "custom/lock_screen",
        "custom/power"
    ],

    "custom/rofi": {
        "format": "",
        "on-click": "rofi -show drun",
        "tooltip": false
    },

    "custom/power": {
        "format": "",
        "on-click": "wlogout",
        "tooltip": false
    },


    "custom/lock_screen": {
        "format": "",
        "on-click": "sh -c '(sleep 0.5s; swaylock -eFfki ~/Pictures/lockscreen.png)' & disown",
        "tooltip": false
    },

    "hyprland/workspaces": {
        "on-click": "activate",
        "disable-scroll": true,
        "all-outputs": true,
        "show-special": true,
        "persistent-workspaces": {
            "*": [ 1, 2, 3, 4 ],
        },
    },

    "wlr/taskbar": {
        "format": "{icon}",
        "icon-size": 12,
        "all-outputs": true,
        "tooltip-format": "{name}: {title}",
        "on-click": "activate",
        "on-click-middle": "close",
        "ignore-list": [
            "rofi"
         ]
    },

    "tray": {
        "icon-size": 12,
        "spacing": 10
    },

    "cpu": {
        "interval": 10,
        "format": "",
        "max-length": 10,
        "format-alt-click": "click-right",
        "format-alt": " {usage}%",
    },

    "memory": {
        "interval": 30,
        "format": "",
        "format-alt-click": "click-right",
        "format-alt": " {}%",
        "max-length": 10,
        "tooltip": true,
        "tooltip-format": "Memory - {used:0.1f}GB used",
    },
    
    "disk": {
        "interval": 600,
        "format": "󰋊",
        "path": "/",
        "format-alt-click": "click-right",
        "format-alt": "󰋊 {percentage_used}%",
        "tooltip": true,
        "tooltip-format": "HDD - {used} used out of {total} on {path} ({percentage_used}%)",
        "states": {
            "warning": 85,
            "critical": 90,
        },
    },

    "temperature": {
        "thermal-zone": 1,
        "format": "",
        "format-alt-click": "click-right",
        "format-alt": " {temperatureC}°C",
        "critical-threshold": 70,
        "format-critical": " {temperatureC}°C",
    },

    "battery": {
        "states": {
            "good": 95,
            "warning": 30,
            "critical": 20
        },
        "format": "{icon}",
        "format-charging": " {capacity}%",
        "format-plugged": " {capacity}%",
        "format-alt-click": "click-right",
        "format-alt": "{icon} {capacity}%",
        "states": {
            "warning": 20,
            "critical": 10
        },
        "format-icons": ["󰂎", "󰁺", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󰁹"]
    },

    "pulseaudio": {
        "format": "{icon}",
        "format-muted": "",
        "on-click": "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle",
        "on-scroll-up": "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+",
        "on-scroll-down": "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-",
        "scroll-step": 5,
        "format-icons": {
            "headphone": "",
            "hands-free": "",
            "headset": "",
            "phone": "",
            "portable": "",
            "car": "",
            "default": ["", "", ""]
        },
        "tooltip": true,
        "tooltip-format": "{icon} at {volume}%"
    },

    "pulseaudio#microphone": {
        "format": "{format_source}",
        "format-source": "",
        "format-source-muted": "",
        "on-click": "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle",
        "on-scroll-up": "wpctl set-volume -l 1 @DEFAULT_AUDIO_SOURCE@ 5%+",
        "on-scroll-down": "wpctl set-volume -l 1 @DEFAULT_AUDIO_SOURCE@ 5%-",
        "scroll-step": 5,
        "tooltip": true,
        "tooltip-format": " at {volume}%"
    },

    "backlight": {
        "device": "intel_backlight",
        "format": "{icon}",
        "format-alt-click": "click-right",
        "format-alt": "{icon} {percent}%",
        "format-icons": ["󰃞", "󰃟", "󰃠"],
        "on-scroll-up": "incbrightness",
        "on-scroll-down": "decbrightness"
    },

    "custom/weather": {
        //shows the current weather and forecast
        "tooltip" : true,
        "format" : "{}",
        "interval" : 3600,
        "exec" : "~/.config/waybar/scripts/wttr.py",
        "return-type" : "json"
    },

    "custom/updates": {
        "format": "{}",
        "exec": "~/.config/waybar/scripts/update-sys",
        "on-click": "~/.config/waybar/scripts/update-sys update",
        "interval": 3600,
        "tooltip": true,
        "signal": 8,
        "return-type" : "json"
    },

    "network": {
        "format": "{ifname}",
        "format-wifi": " ",
        "format-ethernet": " ",
        "format-disconnected": " ", //An empty format will hide the module.
        "tooltip-format": " {ifname} via {gwaddr}",
        "tooltip-format-wifi": " {essid} ({signalStrength}%)",
        "tooltip-format-ethernet": " {ifname} {ipaddr}/{cidr}",
        "tooltip-format-disconnected": "Disconnected",
        "max-length": 50
    },

    "clock": {
        "timezone": "Europe/Madrid",
        "format": "{: %H:%M}",
        "tooltip": true,
        "on-click": "setbg",
        "tooltip-format": "{: %A, %B %e %Y}"
    },

    "custom/khorshididate": { 
        "tooltip" : true,
        "format": " {}",
        "format-alt": " {alt}",
        "format-alt-click": "click-right",
        "interval": 3600,
        "exec": "~/.config/waybar/scripts/khorshidi-date",
        "return-type" : "json"
    },

   "hyprland/language": {
        "format": "{}",
        "on-click": "hyprctl switchxkblayout at-translated-set-2-keyboard next",
        "format-en": "EN",
        "format-fa": "FA"
   },

}
```
# Ruta: `/home/elthelbar/.dotfiles/waybar/.config/waybar/scripts/khorshidi-date`

```
#!/usr/bin/env sh

text=$(pcal -t | cut -d'-' -f3)
alt=$(pcal -t)
tooltip=$(pcal -m | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2};?)?)?[mGK]//g" | sed -E ':a;N;$!ba;s/\r{0,1}\n/\\n/g')

printf '{"text": "%s", "alt": "%s", "tooltip": "%s"}\n' "$text" "$alt" "$tooltip"
```
# Ruta: `/home/elthelbar/.dotfiles/waybar/.config/waybar/scripts/update-sys`

```
#!/usr/bin/env bash

# Original script by @speltriao on GitHub
# https://github.com/speltriao/Pacman-Update-for-GNOME-Shell

# If the operating system is not Arch Linux, exit the script successfully
if [ ! -f /etc/arch-release ]; then
    exit 0
fi

# Calculate updates for each service
AUR=$(paru -Qua | wc -l)
OFFICIAL=$(checkupdates | wc -l)
ALL=$(paru -Qet | wc -l)

# Case/switch for each service updates
case $1 in
    aur) echo " $AUR";;
    official) echo " $OFFICIAL";;
esac

# If the parameter is "update", update all services
if [ "$1" = "update" ]; then
    foot paru -Syu; pkill -SIGRTMIN+8 waybar
fi

# If there aren't any parameters, return the total number of updates
if [ "$1" = "" ]; then
    # Calculate total number of updates
    COUNT=$((OFFICIAL+AUR))
    # If there are updates, the script will output the following:   Updates
    # If there are no updates, the script will output nothing.

    if [[ "$COUNT" = "0" ]]
    then
        printf '{"text": "%s", "tooltip": "%s"}\n' " $ALL" " $ALL "
    else
        # This Update symbol is RTL. So &#x202d; is left-to-right override.
        printf '{"text": "%s", "tooltip": "%s"}\n' " $COUNT" " $COUNT of  $ALL"
    fi
    exit 0
fi
```
# Ruta: `/home/elthelbar/.dotfiles/waybar/.config/waybar/scripts/wttr.py`

```python
#!/usr/bin/env python

import json
import requests
from datetime import datetime

WEATHER_CODES = {
    '113': '',
    '116': '',
    '119': '',
    '122': '',
    '143': '',
    '176': '󰼳',
    '179': '󰼴',
    '182': '󰼵',
    '185': '󰖗',
    '200': '',
    '227': '',
    '230': '',
    '248': '',
    '260': '',
    '263': '',
    '266': '',
    '281': '',
    '284': '',
    '293': '󰖗',
    '296': '󰖗',
    '299': '',
    '302': '',
    '305': '',
    '308': '',
    '311': '',
    '314': '',
    '317': '',
    '320': '',
    '323': '',
    '326': '',
    '329': '',
    '332': '',
    '335': '',
    '338': '',
    '350': '󰼩',
    '353': '',
    '356': '',
    '359': '',
    '362': '',
    '365': '',
    '368': '󰖘',
    '371': '',
    '374': '',
    '377': '',
    '386': '',
    '389': '',
    '392': '',
    '395': ''
}

data = {}


weather = requests.get("https://wttr.in/London?format=j1").json()


def format_time(time):
    return time.replace("00", "").zfill(2)


def format_temp(temp):
    return (hour['FeelsLikeC']+"°").ljust(3)


def format_chances(hour):
    chances = {
        "chanceoffog": "Fog",
        "chanceoffrost": "Frost",
        "chanceofovercast": "Overcast",
        "chanceofrain": "Rain",
        "chanceofsnow": "Snow",
        "chanceofsunshine": "Sunshine",
        "chanceofthunder": "Thunder",
        "chanceofwindy": "Wind"
    }

    conditions = []
    for event in chances.keys():
        if int(hour[event]) > 0:
            conditions.append(chances[event]+" "+hour[event]+"%")
    return ", ".join(conditions)

tempint = int(weather['current_condition'][0]['FeelsLikeC'])
extrachar = ''
if tempint > 0 and tempint < 10:
    extrachar = '+'


data['text'] = WEATHER_CODES[weather['current_condition'][0]['weatherCode']] + \
    " "+extrachar+weather['current_condition'][0]['FeelsLikeC']+"°"

data['tooltip'] = f"<b>{weather['current_condition'][0]['weatherDesc'][0]['value']} {weather['current_condition'][0]['temp_F']}°</b>\n"
data['tooltip'] += f"Feels like: {weather['current_condition'][0]['FeelsLikeC']}°\n"
data['tooltip'] += f"Wind: {weather['current_condition'][0]['windspeedKmph']}Km/h\n"
data['tooltip'] += f"Humidity: {weather['current_condition'][0]['humidity']}%\n"
for i, day in enumerate(weather['weather']):
    data['tooltip'] += f"\n<b>"
    if i == 0:
        data['tooltip'] += "Today, "
    if i == 1:
        data['tooltip'] += "Tomorrow, "
    data['tooltip'] += f"{day['date']}</b>\n"
    data['tooltip'] += f" {day['maxtempC']}°  {day['mintempC']}° "
    data['tooltip'] += f" {day['astronomy'][0]['sunrise']}  {day['astronomy'][0]['sunset']}\n"
    for hour in day['hourly']:
        if i == 0:
            if int(format_time(hour['time'])) < datetime.now().hour-2:
                continue
        data['tooltip'] += f"{format_time(hour['time'])} {WEATHER_CODES[hour['weatherCode']]} {format_temp(hour['FeelsLikeF'])} {hour['weatherDesc'][0]['value']}, {format_chances(hour)}\n"


print(json.dumps(data))
```
# Ruta: `/home/elthelbar/.dotfiles/waybar/.config/waybar/style.css`

```css
/* Colors (gruvbox) */
/*
@define-color black	#282828;
@define-color red	#cc241d;
@define-color green	#98971a;
@define-color yellow	#d79921;
@define-color blue	#458588;
@define-color purple	#b16286;
@define-color aqua	#689d6a;
@define-color gray	#a89984;
@define-color brgray	#928374;
@define-color brred	#fb4934;
@define-color brgreen	#b8bb26;
@define-color bryellow	#fabd2f;
@define-color brblue	#83a598;
@define-color brpurple	#d3869b;
@define-color braqua	#8ec07c;
@define-color white	#ebdbb2;
@define-color bg2	#504945;
*/

/* Colors (dracula) */
@define-color foreground	#f8f8f2;
@define-color background	rgba(40, 42, 54, 0.5);
@define-color orange	#ffb86c;
@define-color gray	#44475a;
@define-color black #21222c;
@define-color red	#ff5555;
@define-color green	#50fa7b;
@define-color yellow	#f1fa8c;
@define-color cyan	#8be9fd;
@define-color blue	#6272a4;
@define-color purple	#bd93f9;
@define-color pink	#ff79c6;
@define-color white #ffffff;
@define-color brred #ff6e6e;
@define-color brgreen #69ff94;
@define-color bryellow #ffffa5;
@define-color brcyan #a4ffff;
@define-color brblue #6272a4;
@define-color brpurple #d6acff;
@define-color brpink #ff92df;

@define-color arch_blue #89b4fa;

@define-color workspace_background	@background;
@define-color workspace_button	@foreground;
@define-color workspace_active	@black;
@define-color workspace_active_background	@green;
@define-color workspace_urgent	@white;
@define-color workspace_urgent_background	@brred;
@define-color workspace_hover	@black;
@define-color workspace_hover_background	@pink;
@define-color critical	@red;
@define-color warning	@yellow;


@keyframes blink {
    to {
        background-color: @white;
        color: @black;
    }
}

* {
    border: none;
    border-radius: 0;
    font-family: "JetBrainsMono Nerd Fonts";
    font-weight: bold;
    font-size: 16px;
    min-height: 0;
}

window#waybar {
    background: transparent;
	  color: @foreground;
}

#workspaces {
    background: @workspace_background;
    opacity: 1;
    transition: none;
    padding: 5px 5px;
    border-radius: 5px;
}

#workspaces button, #workspaces button.persistent {
    background: transparent;
    color: @workspace_button;
    transition: none;
}

#workspaces button.active {
    background: @workspace_active_background;
    color: @workspace_active;
    border-radius: 5px;
/*
    border-top: 2px solid @pink;
    border-bottom: 2px solid @pink;
*/
}

#workspaces button.urgent {
    background: @workspace_urgent_background;
    color: @workspace_urgent;
    border-radius: 5px;
}

#workspaces button:hover {
    background: @workspace_hover_background;
    color: @workspace_hover;
    border-radius: 5px;
}

#taskbar {
    background: @background;
    border-radius: 5px;
    margin: 5px 10px 5px 50px;
}

tooltip {
    background: @background;
    opacity: 0.95;
    border-radius: 10px;
    border-width: 2px;
    border-style: solid;
    border-color: @purple;
}

tooltip label{
    color: @grey;
}

#custom-rofi,
#custom-lock_screen,
#custom-power,
#custom-weather,
#custom-khorshididate,
#cpu,
#disk,
#custom-updates,
#memory,
#clock,
#battery,
#pulseaudio,
#network,
#tray,
#temperature,
#backlight,
#language {
    background: @background;
    opacity: 1;
    padding: 0px 5px;
    margin: 2px 0px 2px 0px;
}

#disk.critical,
#temperature.critical  {
    background-color: @critical;
}

#disk.warning,
#temperature.warning {
    background-color: @warning;
}

#battery {
    color: @green;
    border-radius: 5px 0px 0px 5px;
}

#battery.discharging {
    color: @foreground;
}

#battery.warning:not(.charging) {
    background: @warning;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}

#battery.critical:not(.charging) {
    background-color: @critical;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}

#custom-rofi {
    color: @arch_blue;
    border-radius: 5px 0px 0px 5px;
}

#custom-power {
    color: @red;
    border-radius: 0px 5px 5px 0px;
}

#clock {
    border-radius: 0px 5px 5px 0px;
}

#tray {
    background: @background;
    border-radius: 5px;
    margin: 5px 50px 5px 10px;
}

#pulseaudio {
}

#pulseaudio.microphone {
}
```
