#!/bin/bash

printf "CREATING CHROME-SCALED APP LAUNCHER...\n"

cat > /tmp/chrome-scaled <<'EOF'
#!/bin/bash
text_scale=$(gsettings get org.gnome.desktop.interface text-scaling-factor)
/usr/bin/google-chrome-stable --high-dpi-support=1 --force-device-scale-factor=$text_scale %U
EOF

sudo cp /tmp/chrome-scaled /usr/bin/chrome-scaled
rm -f /tmp/chrome-scaled

sudo chmod go+rx /usr/bin/chrome-scaled

cat > /tmp/chrome-scaled.desktop <<'EOF'

[Desktop Entry]
Version=1.0
Name=Google Chrome
GenericName=Web Browser
Comment=Access the Internet
Exec=/usr/bin/chrome-scaled
Terminal=false
Icon=google-chrome
Type=Application
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml_xml;image/webp;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;
X-Ayatana-Desktop-Shortcuts=NewWindow;NewIncognito
Name[en_CA]=Chrome Scaled

EOF

sudo cp /tmp/chrome-scaled.desktop /usr/share/applications/chrome-scaled.desktop
rm -f /tmp/chrome-scaled.desktop

sudo chmod go+r /usr/share/applications/chrome-scaled.desktop

printf "DONE\n"
