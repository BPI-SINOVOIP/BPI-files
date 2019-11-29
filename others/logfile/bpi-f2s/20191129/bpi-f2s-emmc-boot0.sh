#!/bin/bash
#for new emmc update preloader
mmc bootpart enable 1 1 /dev/mmcblk0
echo 0 > /sys/block/mmcblk0boot0/force_ro
bpi-bootsel /usr/lib/u-boot/bananapi/bpi-f2s/BPI-F2S-xboot-emmc-boot0-0k.img.gz /dev/mmcblk0boot0
