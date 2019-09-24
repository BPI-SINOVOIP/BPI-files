
#on BPI-M64
dnf group list
#dnf groupinstall "Fedora Workstation" --skip-broken
dnf groupinstall "MATE Desktop" --skip-broken --allowerasing

systemctl set-default graphical.target

