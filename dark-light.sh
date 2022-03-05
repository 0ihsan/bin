#!/bin/bash

# # <swiftbar.hideAbout>true</swiftbar.hideAbout>
# # <swiftbar.hideRunInTerminal>true</swiftbar.hideRunInTerminal>
# # <swiftbar.hideLastUpdated>true</swiftbar.hideLastUpdated>
# # <swiftbar.hideDisablePlugin>true</swiftbar.hideDisablePlugin>
# # <swiftbar.hideSwiftBar>true</swiftbar.hideSwiftBar>
# echo 'dl | refresh=true'

lightbg='#A7C080'
lightbg='#CDA863'
darkbg='#2D3339'
darkbg='#16171F'

bg=
target=
if defaults read -g AppleInterfaceStyle | grep -q Dark; then
	target=light
	bg="$lightbg"
else
	target=dark
	bg="$darkbg"
fi


osascript -e 'tell application "System Events"
	if dark mode of appearance preferences is false then
		set dark mode of appearance preferences to true
	else
		set dark mode of appearance preferences to false
	end if
end tell'

sed -i '' "s/^colors: \*[darklight]*$/colors: *$target/" /Users/ihsan/.config/alacritty/color.yml

which -s kitty && kitty @ set-colors --all --configured "/Users/ihsan/.config/kitty/everforest-$target-kitty.conf" 2>&1 >/tmp/kitt.log
m wallpaper $(echo "$bg" | ~/bin/hex2bmp)

for pid in $(pgrep {n,}vim); do kill -SIGUSR1 $pid; done
