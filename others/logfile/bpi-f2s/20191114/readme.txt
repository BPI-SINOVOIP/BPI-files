2019-11-14-Fedora-Mate-armhfp-31-1.9-sda.raw.xz-bpi-f2s-sd-emmc.img.zip
https://drive.google.com/open?id=1ATHmvKvYoBpM3uyQ2xK4pvKahlgCGHnq

logfile:
https://github.com/BPI-SINOVOIP/BPI-files/blob/master/others/logfile/bpi-f2s/20191114/2019-11-14-Fedora-Mate-armhfp-31-1.9-sda.raw.xz-bpi-f2s-sd-emmc.img.txt

source file:
fedora 31 mate-desktop from:
https://ftp.yzu.edu.tw/Linux/Fedora/linux/releases/31/Spins/armhfp/images/Fedora-Mate-armhfp-31-1.9-sda.raw.xz
others from:
https://github.com/BPI-SINOVOIP/BPI-files/tree/master/SD
https://github.com/BPI-SINOVOIP/BPI-F2S-bsp

setup:
bpi-copy Fedora-Mate-armhfp-31-1.9-sda.raw.xz /dev/mmcblk0
#re-insert SD
tar xvf BOOTLOADER-bpi-f2s.tgz --keep-directory-symlink -C /media/mikey/__
tar xvf 4.19.37-BPI-F2S-Kernel.tgz --keep-directory-symlink -C /media/mikey/__
tar xvf 4.19.37-BPI-F2S-Kernel-net.tgz --keep-directory-symlink -C /media/mikey/__

#prepare for grub
mv /media/mikey__/boot/* /media/mikey/__boot

#trans FAT16 to FAT32 (SP7021 only support boot from FAT32)
tar xvf BPI-BOOT-bpi-f2s.tgz -C /media/mikey/B6F7-F766
cp -a /media/mikey/B6F7-F766 /tmp
umount /media/mikey/B6F7-F766
mkfs.vfat -F 32 /dev/mmcblk0p1 -I -n BPI-BOOT -i B6F7F766
mount /dev/mmcblk0p1  /mnt
cp -a /tmp/B6F7-F766/* /mnt
change uEnv.txt: root=/dev/mmcblk1p3
umount /mnt
eject /dev/mmcbl0
#put SD into  BPI-F2S and power on

