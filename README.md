# Hacks to make Fedora work on a Microsoft Surface Go (2018)


Run any script to fix a specific issue or the `fix_all.sh` script.

## WiFi Binary Blob

For the wifi, you need to download the
[board.bin](http://www.killernetworking.com/support/K1535_Debian/board.bin)
binary blog into *this* directory (i.e. the directory where you find this
`README.md` after cloning or downloading this repo). I didn't include the binary
in this repo because I don't know the legal implications of redistributing it.

Then run `fix_wifi.sh`.

####NOTE: You will have to rerun `fix_wifi.sh` every time there's a kernel update

## GNOME Fractional Scaling

GNOME Fractional Scaling has been in development for some time and is quite
mature as a feature (in my testing anyways and as reported by others on reddit
and stackoverflow), but upstream still doesn't consider the feature ready for
prime time (I assume because of some issues with XWayland applications). As such
we need to enable it by hand.

`gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"`

The `fix_gnome_fractional_scaling.sh` script does this.

## Chrome

You need to set the scaling override to pick up scaling from the GNOME
`gsettings`. The script `fix_chrome_scaling.sh` handles this and creates a new
application entry that will query `gsettings` at application launch time.

## Firefox

Firefox works fine, you just need the wayland launcher. Install it with
`dnf -y install firefox-wayland`.
