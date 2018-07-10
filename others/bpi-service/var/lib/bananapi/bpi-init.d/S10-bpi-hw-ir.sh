#!/bin/bash
BOARD=$(bpi-hw)

load_modules()
{
  case ${BOARD} in
  bpi-r2)
    #Enable NEC protocol
    echo "+nec" >/sys/class/rc/rc0/protocols
    ;;
  bpi-m3)
    modprobe sunxi-ir-rx
    ;;
  bpi-m64)
    modprobe sunxi-ir-rx
    ;;
  bpi-r18-avs)
    #modprobe sunxi-ir-rx
    ;;
  bpi-m2u)
    modprobe sunxi-ir-rx
    ;;
  bpi-m2z)
    #modprobe sunxi-ir-rx
    ;;
  bpi-m2p-h5)
    modprobe sunxi-ir-rx
    ;;
  bpi-m2p)
    modprobe sunxi-ir-rx
    ;;
  bpi-m2)
    modprobe sun6i-ir
    ;;
  bpi-m1p)
    modprobe sunxi-ir
    ;;
  bpi-m1)
    modprobe sunxi-ir
    ;;
  bpi-r1)
    modprobe sunxi-ir
    ;;
  *)
    ;;
  esac
}

#main
load_modules
