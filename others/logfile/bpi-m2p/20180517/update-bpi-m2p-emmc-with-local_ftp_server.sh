#
## run on Banana Pi BPI-M2P
#
## with github
#
#bpi-update -c bpi-m2p.conf
#
## with local ftp server
#
bpi-update -c localftp.conf -c bpi-m2p.conf
#
## update bootloader
#
bpi-bootsel /usr/lib/u-boot/bananapi/bpi-m2p/BPI-M2P-720P.img.gz
#
## reboot
#
reboot
