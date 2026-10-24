#!/bin/bash
echo "=========================================================="
echo "🍏 Launching Flat macOS Interface for Classic MacBooks... "
echo "=========================================================="

# 1. Install critical system software packages (Static Plank Dock)
sudo apt update
sudo apt install -y plank

# 2. Establish hidden user configuration paths
mkdir -p ~/.themes ~/.fonts ~/.local/share/plank/themes ~/.config/autostart

# 3. Deploy the hand-tuned asset configuration files
echo "Deploying smooth visual assets..."
cp -r ./themes/* ~/.themes/
cp -r ./fonts/* ~/.fonts/
cp -r ./dock-themes/* ~/.local/share/plank/themes/

# 4. Inject the permanent persistent Control/Command key swap
echo "Configuring MacBook keyboard muscle memory layout..."
cat <<EOF > ~/.config/autostart/mac-keys.desktop
[Desktop Entry]
Type=Application
Name=Mac Keyboard Switch
Exec=setxkbmap -option altwin:ctrl_win
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
EOF

# 5. Inject the Plank Dock into the auto-boot manager list
echo "Registering bottom app dock into system autostart..."
cat <<EOF > ~/.config/autostart/plank.desktop
[Desktop Entry]
Type=Application
Name=Plank Dock
Exec=plank
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
EOF

echo "=========================================================="
echo "🎯 Configuration Applied Successfully!"
echo "=========================================================="
echo "Next Steps to complete your interface:"
echo "1. Log out and back into Linux Mint."
echo "2. Set Window Manager Style theme to: 'Space-hdpi'."
echo "3. Drag your primary panel to the TOP of the monitor screen."
echo "4. Run 'plank --preferences' and turn off 'Icon Zoom'."
