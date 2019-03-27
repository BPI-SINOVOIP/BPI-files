#!/bin/sh

#gunzip -c BPI_M3_1080P.img.gz | dd of=/dev/mmcblk0 conv=sync,noerror bs=1k

die() {
        echo "$*" >&2
        exit 1
}

#[ -s "./env.sh" ] || die "please run ./configure first."

#. ./env.sh
export BOARD=BPI-M4-USB-emmc
export TARGET_PRODUCT=bpi-m4

O=$1
if [ ! -z $O ] ; then
	BOARD=$O
fi

U=./${TARGET_PRODUCT}
if [ ! -d $U ]; then
	mkdir -p $U
fi

TMP_FILE=./${BOARD}.tmp
IMG_FILE=${U}/${BOARD}-2k.img
UBOOT=$TOPDIR/rt-pack/rtk/${TARGET_PRODUCT}/bin/u-boot.bin
UBOOT=BOOTLOADER.bin
FACTORY=F_220000.bin
FACTORY=F_220000.tar
FW_TABLE1=T_620000.bin
FW_TABLE2=T_628000.bin
AUDIO=A_28F0200.bin
AUDIO=bluecore.audio.enc.A01

(sudo dd if=/dev/zero of=${TMP_FILE} bs=1M count=100) >/dev/null 2>&1
LOOP_DEV=`sudo losetup -f --show ${TMP_FILE}`
(sudo dd if=$UBOOT of=${LOOP_DEV} bs=1k seek=2) >/dev/null 2>&1
#(sudo dd if=$FACTORY of=${LOOP_DEV} bs=128k seek=17) >/dev/null 2>&1
(sudo dd if=$FW_TABLE1 of=${LOOP_DEV} bs=1k seek=6272) >/dev/null 2>&1
#(sudo dd if=$FW_TABLE2 of=${LOOP_DEV} bs=1k seek=6304) >/dev/null 2>&1
(sudo dd if=$AUDIO of=${LOOP_DEV} bs=512 seek=83841) >/dev/null 2>&1
sudo sync
sudo losetup -d ${LOOP_DEV}
(dd if=${TMP_FILE} of=${IMG_FILE} bs=1k skip=2 count=102398 status=noxfer) >/dev/null 2>&1

if [ -f ${IMG_FILE}.gz ]; then
	rm -f ${IMG_FILE}.gz
fi

echo "gzip ${IMG_FILE}"
gzip ${IMG_FILE}
sudo rm -f ${TMP_FILE}
