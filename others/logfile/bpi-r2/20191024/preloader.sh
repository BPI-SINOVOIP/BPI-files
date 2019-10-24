#!/bin/bash
#for new emmc update preloader
mmc bootpart enable 1 1 /dev/mmcblk0
echo 0 > /sys/block/mmcblk0boot0/force_ro
bpi-bootsel BPI-R2-EMMC-boot0-DDR1600-20191024-0k.img.gz /dev/mmcblk0boot0
#bpi-bootsel BPI-R2-preloader-DDR1600-20191024-2k.img.gz /dev/mmcblk0boot0
