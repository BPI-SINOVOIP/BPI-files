#
## run on Banana Pi BPI-M2P
#
## with github
#
#bpi-update -c bpi-m2p-linux4.conf
#
## with local ftp server
#
bpi-update -c localftp.conf -c bpi-m2p-linux4.conf
#
## update bootloader
#
bpi-bootsel /usr/lib/u-boot/bananapi/u-boot-2018.01/u-boot-2018.01-bpi-m2p-8k.img.gz
#
## reboot
#
reboot
