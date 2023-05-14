#!/usr/bin/env sh

packages=(
bat
bottom
cava
cliphist
dunst
exa
firefox
fzf
git
grimblast-git
htop
hyprland-nvidia-git
JetBrains Mono Nerd Font
jq
kitty
libcanberra
macchina
mpc
mpd
ncmpcpp
neofetch
neovim
nwg-look-bin
otf-san-francisco
pacman-contrib
papirus-icon-theme
pavucontrol
pfetch
pipes.sh
polkit-kde-agent
qt6ct
reflector
ripgrep
rofi-lbonn-wayland-only-git
swaybg
thunar
treefetch
ttf-space-mono-nerd
waybar-hyprland-git
webcord-vencord-git
wl-clipboard
xdg-desktop-portal-hyprland-git
zsh
)

countdown=5  # Set the countdown time in seconds
echo "Starting update in $countdown seconds. Press any key to cancel."

# Start the countdown loop
for i in $(seq $countdown -1 1); do
    echo "$i..."
    read -t 1 -n 1 && exit 1  # Wait for a key press and exit if one is detected
done

# Run the update command
paru -Syu --needed "${packages[@]}"
