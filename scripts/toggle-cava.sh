cavastate=$(hyprctl clients | grep cava-new)

if [$cavastate == ""]; then
	echo "Yes"
	ghostty --background-opacity=0 --title=cava-new -e cava & disown
else
	echo "No"
	pkill cava
fi
