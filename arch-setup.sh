#################### UTILS #######################

function aur_install () {
    git clone https://aur.archlinux.org/${1}.git
    cd ${1}
    makepkg -si
    cd ..
    rm -rf ${1}
}

################## DEPENDENCIES ##################

sudo pacman -S xmonad xmonad-contrib nitrogen picom kitty imagemagick
sudo pacman -S playerctl polybar nm-connection-editor neofetch

aur_install "cli-visualizer"
aur_install "picom-rounded-corners" 
aur_install "albert"

################## FONTS #########################

sudo pacman -S ttf-fira-code ttf-roboto
aur_install "ttf-material-design-icons"
aur_install "ttf-iosevka"

################# COPY SETTINGS ##################

cp -rf .config ~/.config
cp -rf .xmonad ~/.xmonad

##################################################
