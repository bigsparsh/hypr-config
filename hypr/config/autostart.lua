-- Auto-start config
-- if you dont use UWSM add your auto start programs here, otherwise use XDG autostart https://wiki.archlinux.org/title/XDG_Autostart

hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")
	hl.exec_cmd("qs")
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("blueman-applet")
	hl.exec_cmd("xhost +SI:localuser:root")
	hl.exec_cmd("brave --app=https://web.whatsapp.com")
	hl.exec_cmd("spotify")
	hl.exec_cmd("discord")
end)
