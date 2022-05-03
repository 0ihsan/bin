#!/bin/bash

# # <swiftbar.hideAbout>true</swiftbar.hideAbout>
# # <swiftbar.hideRunInTerminal>true</swiftbar.hideRunInTerminal>
# # <swiftbar.hideLastUpdated>true</swiftbar.hideLastUpdated>
# # <swiftbar.hideDisablePlugin>true</swiftbar.hideDisablePlugin>
# # <swiftbar.hideSwiftBar>true</swiftbar.hideSwiftBar>
# echo 'dl | refresh=true'

# desktop color wallpaper
lightbg='#A7C080'
lightbg='#CDA863'
lightbg='#FAF4ED'
lightbg='#347773'
lightbg='#E8BF44'
darkbg='#2D3339'
darkbg='#16171F'
darkbg='#347773'
darkbg='#111111'

bg=
target=
shouldbedark=
if defaults read -g AppleInterfaceStyle | grep -q Dark; then
	target=light
	shouldbedark=false
	kittytheme='Rosé Pine Dawn'
	bg="$lightbg"
else
	target=dark
	shouldbedark=true
	kittytheme='zenwritten_dark'
	bg="$darkbg"
fi

osascript -e 'tell application "System Events"
	set dark mode of appearance preferences to '$shouldbedark'
end tell'

which -s kitty && kitty +kitten themes --reload-in=all "$kittytheme"
# sed -i '' "s/^colors: \*[darklight]*$/colors: *$target/" /Users/ihsan/.config/alacritty/color.yml

for pid in $(pgrep {n,}vim); do kill -SIGUSR1 $pid; done

m wallpaper $(echo "$bg" | ~/bin/hex2bmp)

