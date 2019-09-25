#!/bin/bash
BOARD=$(bpi-hw)
service=linux

check_cmdline()
{
  # parse command line arguments
  for arg in $(cat /proc/cmdline); do
    case $arg in
      service=*)
        service="${arg#*=}"
        return
        ;;
    esac
  done
}

fbdev-bpi-w2() {
  if [ "x$BOARD" != "xbpi-w2" ] ; then
    if [ "x$BOARD" != "xbpi-m4" ] ; then
      return 0
    fi
  fi
  check_cmdline

  mkdir -p /dev/graphics
  ln -s /dev/fb0 /dev/graphics/fb0

  echo 10240 > /sys/kernel/rtk_alsa/dec_ao_buffer_size
  if [ "x$service" == "xlinux4.4" ] ; then
    /usr/local/bin/bpi-w2-daemon-4.4 > /dev/null &
  else
    /usr/local/bin/bpi-w2-daemon > /dev/null &
  fi
       
  #sleep 5
  #/usr/bin/rtkInitFb 39 250
  #/usr/local/bin/bpi-w2-init 0 250

}

#main
fbdev-bpi-w2
