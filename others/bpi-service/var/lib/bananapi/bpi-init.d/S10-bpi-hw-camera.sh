#!/bin/bash
BOARD=$(bpi-hw)

load_modules()
{
  case ${BOARD} in
  bpi-m3)
#    MODULES="videobuf-core videobuf-dma-contig cci actuator vm149c_act vfe_os vfe_subdev ov8858_4lane vfe_v4l2"
#    MODULES="vm149c_act ov8858_4lane vfe_v4l2"
    MODULES="ov5640 vfe_v4l2"
    ;;
  bpi-m64)
    MODULES="dw9714_act ov5640 vfe_v4l2"
    ;;
  bpi-r18-avs)
    MODULES="dw9714_act ov5640 vfe_v4l2"
    ;;
  bpi-m2m)
    MODULES="ov5640 vfe_v4l2"
    ;;
  bpi-m2u)
    MODULES="ov5640 vfe_v4l2"
    ;;
  bpi-m2p)
    MODULES="ov5640 vfe_v4l2"
    ;;
  bpi-m2p-h5)
    MODULES="ov5640 vfe_v4l2"
    ;;
  bpi-m2z)
    MODULES="ov5640 vfe_v4l2"
    ;;
  bpi-m2)
    MODULES="ov5640 vfe_v4l2"
    ;;
  *)
    MODULES="ov5640 vfe_v4l2"
    ;;
  esac
  for IN in $MODULES ; do
    modprobe $IN
  done
}

#main
load_modules
