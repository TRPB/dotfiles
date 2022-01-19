# Install papirus and breeze, we'll be using both of these
sudo pacman -S papirus-icon-theme breeze-icons

yay -S papirus-folders 


# Copy the files into /local/share
# By overwriting the colours locally, icons won't get overwritten on a papirus-icon-theme package update, but the package will install new icons in /usr when it's updated e.g. applications
cp -R -P /usr/share/icons/Papirus/ ~/.local/share/icons/
cp -R -P /usr/share/icons/Papirus-Dark/ ~/.local/share/icons/

cd ~/.local/share/icons/Papirus-Dark/

# Replace the colours in -black variants with Nord
find -L . -name "*blue*" -type f -exec sed -i 's/'1d344f'/'d8dee9'/gI' {} \; # 
find -L . -name "*blue*" -type f -exec sed -i 's/'5294e2'/'4c566a'/gI' {} \; # main blue
find -L . -name "*blue*" -type f -exec sed -i 's/'dcdcdc'/'e5e9f0'/gI' {} \; # grey (icon)
find -L . -name "*blue*" -type f -exec sed -i 's/'4877b1'/'434c5e'/gI' {} \; # dark blue (back panel)
find -L . -name "*blue*" -type f -exec sed -i 's/'ffffff'/'e5e9f0'/gI' {} \; # white (top)

# papirus' small icons look worse than the stencil icons used in breeze, copy the small breeze place/device icons over. They're used in dolphin and open/save dialogs

mkdir -p ~/.local/share/icons/Papirus-Dark/16x16/places/
mkdir -p ~/.local/share/icons/Papirus-Dark/16x16/devices/

# This fixes a few icons that are in different folders in the different themes
cp /usr/share/icons/breeze-dark/places/16/* ~/.local/share/icons/Papirus-Dark/16x16/devices/

cp /usr/share/icons/breeze-dark/places/16/* ~/.local/share/icons/Papirus-Dark/16x16/places/
cp /usr/share/icons/breeze-dark/devices/16/* ~/.local/share/icons/Papirus-Dark/16x16/devices/

mkdir -p ~/.local/share/icons/Papirus-Dark/24x24/places/
mkdir -p ~/.local/share/icons/Papirus-Dark/24x24/devices/

# This fixes a few icons that are in different folders in the different themes
cp /usr/share/icons/breeze-dark/places/24/* ~/.local/share/icons/Papirus-Dark/24x24/devices/

cp /usr/share/icons/breeze-dark/places/24/* ~/.local/share/icons/Papirus-Dark/24x24/places/
cp /usr/share/icons/breeze-dark/devices/24/* ~/.local/share/icons/Papirus-Dark/24x24/devices/

mkdir -p ~/.local/share/icons/Papirus-Dark/22x22/places/
mkdir -p ~/.local/share/icons/Papirus-Dark/22x22/devices/

# This fixes a few icons that are in different folders in the different themes
cp /usr/share/icons/breeze-dark/places/22/* ~/.local/share/icons/Papirus-Dark/22x22/devices/

cp /usr/share/icons/breeze-dark/places/22/* ~/.local/share/icons/Papirus-Dark/22x22/places/
cp /usr/share/icons/breeze-dark/devices/22/* ~/.local/share/icons/Papirus-Dark/22x22/devices/

gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'

echo 'Now select the theme in qt5ct'

rm ~/.cache/icon-cache.kcache && kbuildsycoca5 --noincremental

gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'

# is there a way to do this programatically? The icon theme isn't set in kdeglobals
echo 'Now select the theme in qt5ct'

qt5ct

find -L . -name "*-black*" -type f -exec mkdir -p `sed 's/usr/\.local/gI' | dirname {}`  \;

