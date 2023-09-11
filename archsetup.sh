sudo pacman -Syu --noconfirm

#Pulseaudio setup
sudo pacman -S pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber helvum pavucontrol
systemctl --user enable --now pipewire.socket
systemctl --user enable --now pipewire-pulse.socket
systemctl --user enable --now wireplumber.service

#Fonts setup
sudo pacman -S --noconfirm font-manager ttf-jetbrains-mono-nerd noto-fonts-cjk noto-fonts-emoji noto-fonts ttf-font-awesome

#Nvidia setup
sudo pacman -S --noconfirm nvidia nvidia-libgl

#GDM install
sudo pacman -S --noconfirm gdm
sudo systemctl gdm.service

#Wayland install
sudo pacman -S --noconfirm wayland wl-clipboard

#Hyprland install
sudo pacman -S --noconfirm hyprland

#Yay install
sudo pacman -S --noconfirm makepkg
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si

#Waybar install
sudo pacman -S --noconfirm waybar

#rofi install
sudo pacman -S --noconfirm rofi

#Alacritty install
sudo pacman -S --noconfirm alacritty

#Firefox install
sudo pacman -S --noconfirm firefox

#Lvim install
sudo pacman -S --noconfirm git make python3 python-pip npm cargo
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

#Go setup
sudo pacman -S --noconfirm go

#Telegram setup
sudo pacman -S --noconfirm telegram-desktop
