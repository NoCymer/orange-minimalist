#################### UTILS #######################

function aur_install () {
    git clone https://aur.archlinux.org/${1}.git
    cd ${1}
    makepkg -si
    cd ..
    rm -rf ${1}
}

################## DEPENDENCIES ##################

sudo pacman -S nitrogen picom kitty imagemagick flameshot
sudo pacman -S playerctl polybar nm-connection-editor neofetch wmname

git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git
cd bspwm && make && sudo make install
cd ../sxhkd && make && sudo make install
cd ~
rm -rf bspwm
rm -rf sxhkd

aur_install "cli-visualizer"
aur_install "picom-rounded-corners" 
aur_install "albert"

################## FONTS #########################

sudo pacman -S ttf-fira-code ttf-roboto
aur_install "ttf-material-design-icons"
aur_install "ttf-iosevka"

################# COPY SETTINGS ##################

cp -rf .config ~/.config

##################################################
