sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm git

#Fonts setup
sudo pacman -S --noconfirm ttf-dejavu ttf-hack ttf-inconsolata ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-liberation ttf-linux-libertine \
ttf-ubuntu-font-family adobe-source-code-pro-fonts gnu-free-fonts noto-fonts-emoji 


#Nvidia setup
sudo pacman -S --noconfirm nvidia cuda docker nvidia-container-toolkit

#paru install
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
sudo pacman -S --noconfirm makepkg
git clone https://aur.archlinux.org/paru.git
cd paru && makepkg -si

#Zsh install
sudo pacman -S --noconfirm zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.local/zsh-syntax-highlighting

#Xorg
sudo pacman -S --noconfirm xorg-server xterm xclip xorg-xinit xorg-xauth

#I3 
sudo pacman -S --noconfirm feh i3-wm i3status

#I3-lock-color
paru -S --noconfirm i3lock-color vscode sublime-text-dev google-chrome nekoray

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
cp -r alacritty ~/.config/
cp -r doom ~/.config/
cp -r i3 ~/.config/
cp -r lvim ~/.config/
cp -r polybar ~/.config/
cp -r picom ~/.config/
cp .zshrc ~/
cp .Xresources ~/
cp .xinitrc ~/
mkdir ~/.config/rofi
cp config.rasi ~/.config/rofi
