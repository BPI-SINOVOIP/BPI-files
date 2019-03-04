#!/bin/bash
BOARD=$(bpi-hw)

fbdev-bpi-w2() {
  if [ "x$BOARD" != "xbpi-w2" ] ; then
    if [ "x$BOARD" != "xbpi-m4" ] ; then
      return 0
    fi
  fi

  mkdir -p /dev/graphics
  ln -s /dev/fb0 /dev/graphics/fb0

  echo 10240 > /sys/kernel/rtk_alsa/dec_ao_buffer_size
  /usr/local/bin/bpi-w2-daemon > /dev/null &
       
  sleep 5
  #/usr/bin/rtkInitFb 39 250
  /usr/local/bin/bpi-w2-init 0 250

}

#main
fbdev-bpi-w2
