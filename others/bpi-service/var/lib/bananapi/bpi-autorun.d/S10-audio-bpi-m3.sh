#!/bin/bash
BOARD=$(bpi-hw)

AUDIO=no
ASOUNDFILE=/var/lib/alsa/asound.state.$BOARD

check_kernel()
{
  KVER=$(uname -r)
  case $KVER in
    3.4*)
      AUDIO=yes
      ;;
  esac
}

audio-bpi-m3() {
  if [ "x$AUDIO" != "xyes" ] ; then
    return 0
  fi
  if [ "x$BOARD" != "xbpi-m3" ] ; then
    return 0
  fi

  if [ ! -x "/usr/bin/amixer" ] ; then
    return 0
  fi

  # BPI-M3 do audio setup
  if [ -x "/usr/sbin/alsactl" ] ; then
    if [ -f $ASOUNDFILE ] ; then
      /usr/sbin/alsactl -f $ASOUNDFILE restore 2>&1 >/dev/null
    fi
  fi


  # headset mixer
  /usr/bin/amixer -c 0 cset numid=114 1 2>&1 >/dev/null
  /usr/bin/amixer -c 0 cset numid=65 0 2>&1 >/dev/null
  /usr/bin/amixer -c 0 cset numid=66 0 2>&1 >/dev/null
  /usr/bin/amixer -c 0 cset numid=75 1 2>&1 >/dev/null
  /usr/bin/amixer -c 0 cset numid=68 1 2>&1 >/dev/null
  /usr/bin/amixer -c 0 cset numid=84 1 2>&1 >/dev/null
  /usr/bin/amixer -c 0 cset numid=88 1 2>&1 >/dev/null
  /usr/bin/amixer -c 0 cset numid=104 0 2>&1 >/dev/null
  /usr/bin/amixer -c 0 cset numid=103 0 2>&1 >/dev/null
  /usr/bin/amixer -c 0 cset numid=26 61 2>&1 >/dev/null
  # amic mixer
  /usr/bin/amixer -c 0 cset numid=108 0 2>&1 >/dev/null
  /usr/bin/amixer -c 0 cset numid=107 0 2>&1 >/dev/null
  /usr/bin/amixer -c 0 cset numid=99 1 2>&1 >/dev/null
  /usr/bin/amixer -c 0 cset numid=95 1 2>&1 >/dev/null
  /usr/bin/amixer -c 0 cset numid=28 0 2>&1 >/dev/null
  /usr/bin/amixer -c 0 cset numid=27 0 2>&1 >/dev/null
  /usr/bin/amixer -c 0 cset numid=41 1 2>&1 >/dev/null
  /usr/bin/amixer -c 0 cset numid=34 1 2>&1 >/dev/null
  /usr/bin/amixer -c 0 cset numid=15 4 2>&1 >/dev/null

  /usr/bin/amixer -c 0 cset numid=49 0 2>&1 >/dev/null

  if [ -x "/usr/sbin/alsactl" ] ; then
    /usr/sbin/alsactl -f $ASOUNDFILE store 2>&1 >/dev/null
  fi
}

#main
check_kernel
audio-bpi-m3
