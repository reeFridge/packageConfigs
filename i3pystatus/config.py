from i3pystatus import Status

status = Status()

# Displays clock like this:
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
status.register("clock",
    format="%a %-d %b %X ",)

# Shows the average load of the last minute and the last 5 minutes
# (the default value for format is used)
status.register("load")

# Shows your CPU temperature, if you have a Intel CPU
status.register("temp",
    format="{temp:.0f}°C",)

# Displays whether a DHCP client is running
status.register("runwatch",
    name="DHCP",
    path="/var/run/dhclient*.pid",)

# Shows the address and up/down state of eth0. If it is up the address is shown in
# green (the default value of color_up) and the CIDR-address is shown
# (i.e. 10.10.10.42/24).
# If it's down just the interface name (eth0) will be displayed in red
# (defaults of format_down and color_down)
#
# Note: the network module requires PyPI package netifaces
status.register("network",
    interface="enp5s0",
    format_up="{v4cidr}",
    )

# Note: requires both netifaces and basiciw (for essid and quality)
status.register("network",
    interface="wlp3s0b1",
     hints = {"markup": "pango"},
    format_up = "<span color=\"#00FF00\">{essid}</span> {bytes_recv:6.1f}KiB {bytes_sent:5.1f}KiB",
    format_down = "",
    dynamic_color = True,
    start_color = "#00FF00",
    end_color = "#FF0000",
    color_down = "#FF0000",
    upper_limit = 800.0,
    )

# Shows disk usage of /
# Format:
# 42/128G [86G]
status.register("disk",
    path="/home",
    format="{used}/{total}G [{avail}G]",)

# Shows pulseaudio default sink volume
#
# Note: requires libpulseaudio from PyPI
status.register("pulseaudio",
    format="VOL: {volume}%",)

# Shows mpd status
# Format:
# Cloud connected▶Reroute to Remain
status.register("mpd",
    format="{artist} - {status} - {title}",
    hints = {"markup": "pango"},
    status={
        "play": "<span color=\"green\">▶</span>",
        "pause": "<span color=\"orange\">▶</span>",
        "stop": "<span color=\"red\">◾</span>",
    },)

status.run()