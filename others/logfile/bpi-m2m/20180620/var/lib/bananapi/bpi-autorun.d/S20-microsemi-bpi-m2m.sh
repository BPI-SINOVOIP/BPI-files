#!/bin/bash
BOARD=$(bpi-hw)

microsemi-bpi-m2m() {
  if [ "x$BOARD" != "xbpi-m2m" ] ; then
    return 0
  fi
  #
  for IN in hbi_spi00 snd-soc-microsemi-dac snd-soc-zl380xx ; do
    MOD=/usr/local/zl380xx/${IN}.ko
    if [ -f $MOD ] ; then
      insmod $MOD
    fi
  done
  #
  sudo chown -R pi:pi /dev/hbi*
}

#main
microsemi-bpi-m2m
