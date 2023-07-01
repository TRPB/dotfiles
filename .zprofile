export QT_QPA_PLATFORMTHEME=qt5ct

export QT_WAYLAND_FORCE_DPI=

export MOZ_ENABLE_WAYLAND=1

export GTK_THEME=Arc-Dark

export QT_STYLE_OVERRIDE=kvantum

export EDITOR=nano

if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

eval $(ssh-agent -s)

