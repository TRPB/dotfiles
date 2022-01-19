#!/bin/bash

# Get Arc GTK theme

git clone https://github.com/jnsh/arc-theme --depth 1
cd arc-theme

# Top bar
find . -name "*" -type f -exec sed -i 's/'2F343F'/'434c5e'/gI' {} \;


# Side panel
find . -name "*" -type f -exec sed -i 's/'383C4A'/'3b4252'/gI' {} \;

# middle panel
find . -name "*" -type f -exec sed -i 's/'404552'/'2e3440'/gI' {} \;

# Night 4
find . -name "*" -type f -exec sed -i 's/'565965'/'4c566a'/gI' {} \;

# very occasional backgrounds e.g. gtk file open dialog

find . -name "*" -type f -exec sed -i 's/'353945'/'3b4252'/gI' {} \;


# colour used for alternating rows
find . -name "*" -type f -exec sed -i 's/'3C434F'/'3b4252'/gI' {} \;

# grey - scrollbar colour
find . -name "*" -type f -exec sed -i 's/'767B87'/'4c566a'/gI' {} \;


# highlight color
find . -name "*" -type f -execed -i 's/'5294E2'/'4c566a'/gI' {} \;


# white - some fonts
find . -name "*" -type f -exec sed -i 's/'FFFFFF'/'eceff4'/gI' {} \;

# off white - most fonts
find . -name "*" -type f -exec sed -i 's/'D3DAE3'/'e5e9f0'/gI' {} \;



meson setup --prefix=$HOME/.local -Dvariants=dark -Dthemes=gtk2,gtk3,gtk4,metacity,plank,unity,xfwm build/

meson configure build/

meson install -C build/


# Now the kvantum theme for qt applications

mkdir -p ~/.config/Kvantum/ArcDarkNord
cp /usr/share/Kvantum/KvArcDark/KvArcDark.kvconfig ~/.config/Kvantum/ArcDarkNord/ArcDarkNord.kvconfig
cp /usr/share/Kvantum/KvArcDark/KvArcDark.svg ~/.config/Kvantum/ArcDarkNord/ArcDarkNord.svg


cd ~/.config/Kvantum/ArcDarkNord

# Replace the Arc colours with Nord colours and build the theme



# Top bar
find . -name "*" -type f -exec sed -i 's/'2F343F'/'434c5e'/gI' {} \;


# Side panel
find . -name "*" -type f -exec sed -i 's/'383C4A'/'3b4252'/gI' {} \;

# middle panel
find . -name "*" -type f -exec sed -i 's/'404552'/'2e3440'/gI' {} \;

# Night 4
find . -name "*" -type f -exec sed -i 's/'565965'/'4c566a'/gI' {} \;


# highlight color
find . -name "*" -type f -exec sed -i 's/'5294E2'/'4c566a'/gI' {} \;

# colour used for alternating rows
find . -name "*" -type f -exec sed -i 's/'3C434F'/'3b4252'/gI' {} \;

# grey - scrollbar colour
find . -name "*" -type f -exec sed -i 's/'767B87'/'4c566a'/gI' {} \;

# very occasional backgrounds e.g. gtk file open dialog

find . -name "*" -type f -exec sed -i 's/'353945'/'3b4252'/gI' {} \;

# white - some fonts
find . -name "*" -type f -exec sed -i 's/'FFFFFF'/'eceff4'/gI' {} \;

# off white - most fonts
find . -name "*" -type f -exec sed -i 's/'D3DAE3'/'e5e9f0'/gI' {} \;


# Some Qt applications use colours defined in a cholor-schem .colors file 

mkdir -p ~/.local/share/color-schemes
cp /usr/share/color-schemes/KvArcDark.colors ~/.local/share/color-schemes/ArcDarkNord.colors

cd ~/.local/share/color-schemes

sed -i 's/'47,52,63'/'46,52,64'/gI' ArcDarkNord.colors
sed -i 's/'56,60,74'/'59,66,82'/gI' ArcDarkNord.colors
sed -i 's/'64,69,82'/'67,76,94'/gI' ArcDarkNord.colors
sed -i 's/'86,89,101'/'76,86,106'/gI' ArcDarkNord.colors
sed -i 's/'82,148,226'/'94,129,172'/gI' ArcDarkNord.colors
sed -i 's/'KvArcDark'/'ArcDarkNord'/gI' ArcDarkNord.colors


# Use this colour scheme in kdeglobals

sed -i 's/ColorScheme=[^\n]*/ColorScheme=ArcDarkNord/gI' ~/.config/kdeglobals



echo 'Launching kvantummanager, remember to set the theme there to ArcDarkNord'

kvantummanager

echo 'Launching q5ct, set icon theme, cursor theme here'

qt5ct

