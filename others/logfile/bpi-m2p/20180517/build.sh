#
## run on Banana Pi or PC
#
#20180517
#bpi-migrate -c bpi-m2p.conf -c busybox.conf URLBASE="ftp://pi:bananapi@127.0.0.1/BPI-files"
#bpi-migrate -c bpi-m2p.conf -c busybox.conf URLBASE="ftp://pi:bananapi@192.168.30.124/BPI-files" URLCONF="ftp://pi:bananapi@192.168.30.124/BPI-files/others/for-bpi-tools/conf"
#bpi-migrate -c bpi-m2p.conf -c busybox.conf
#bpi-migrate -c localftp.conf -c bpi-m2p.conf -c busybox.conf
#bpi-migrate -c bpi-m2p.conf -I "-sd-emmc" -V "-v1.1" -c raspbian-jessie-from-sd.conf
bpi-migrate -c bpi-m2p-linux4.conf -I "-sd-emmc" -V "-v1.1" -c ubuntu-mate-from-sd.conf
