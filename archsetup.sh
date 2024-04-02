sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm git

#Fonts setup
sudo pacman -S --noconfirm adobe-source-code-pro-fonts cantarell-fonts fontconfig gnu-free-fonts \
gsfonts libfontenc libxfont2 noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-ms-fonts ttf-ubuntu-font-family \
ttf-font-awesome ttf-jetbrains-mono-nerd xorg-fonts-encodings

#Nvidia setup
sudo pacman -S --noconfirm nvidia

#Yay install
sudo pacman -S --noconfirm makepkg
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si

#Zsh install
sudo pacman -S --noconfirm zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.local/zsh-syntax-highlighting

#Xorg
sudo pacman -S --noconfirm xorg-server xterm xclip

#I3 
sudo pacman -S --noconfirm feh i3-wm i3status

#I3-lock-color
yay -S --noconfirm i3lock-color

#Window manager
sudo pacman -S --noconfirm ly
sudo systemctl enable ly.service

#Rofi install
sudo pacman -S --noconfirm rofi

#Alacritty install
sudo pacman -S --noconfirm alacritty

#Firefox install
sudo pacman -S --noconfirm firefox

#Lvim install
sudo pacman -S --noconfirm make python3 python-pip npm cargo
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

#Go setup
sudo pacman -S --noconfirm go

#Telegram setup
sudo pacman -S --noconfirm telegram-desktop

echo "Install done. Copying config"
cp -r ./alacritty ~/.config/
cp -r ./doom ~/.config/
cp -r ./i3 ~/.config/
cp -r ./lvim ~/.config/
cp -r ./rofi ~/.config/
cp .zshrc ~/
cp .Xresources ~/
cp .xinitrc ~/
