#!/bin/bash
BOARD=$(bpi-hw)

load_modules()
{
  case ${BOARD} in
  bpi-m3)
    modprobe bcmdhd
    ;;
  bpi-m64)
    modprobe bcmdhd
    ;;
  bpi-r18-avs)
    modprobe bcmdhd
    ;;
  bpi-m2m)
    modprobe bcmdhd
    ;;
  bpi-m2u)
    modprobe bcmdhd
    ;;
  bpi-m2z)
    modprobe bcmdhd
    ;;
  bpi-m2p-h5)
    modprobe bcmdhd
    ;;
  bpi-m2p)
    modprobe bcmdhd
    ;;
  bpi-m2)
    modprobe bcmdhd
    ;;
  bpi-m1p)
    modprobe ap6211
    ;;
  bpi-r2)
    if [ -x /etc/init.d/wifi_enable ] ; then
      /etc/init.d/wifi_enable &
    fi
    ;;
  *)
    ;;
  esac
}

#main
load_modules
