#bin/bash
#GPIO40_NO_IGPIO="13 14 3 17 58 25 27 7 4 5 6 8 12 11 100 21 54 59 57 22 23 24 60"
#IGPIOSORG="21 3 2 5 4 9"
#IGPIO + 101 = GPIO
#IGPIOS="122  104 103 106 105 110"
#GPIO40="13 14 122 104 103 3 17 58 25 27 106 105 7 4 110 5 6 8 12 11 100 21 54 59 57 22 23 24 60"
#BPI-M4 https://youtu.be/SVegH35v-_k
GPIO40="17 16 21 9 8 42 3 43 44 11 10 31 18 47 19 20 22 45 23 41 40 50 4 2 53 34 5 6"
#GPIOLED="128 97 98" 

GPIOS="$GPIO40 $GPIOLED"

export_gpio() {
  for IN in $GPIOS ; do
    EXPORT=/sys/class/gpio/export
    VALUE=/sys/class/gpio/gpio$IN/value
    if [ ! -f $VALUE ] ; then
      echo $IN > $EXPORT
    fi
  done
}

out_gpio() {
  for IN in $GPIOS ; do
    DIR=/sys/class/gpio/gpio$IN/direction
    if [ -f $DIR ] ; then
      echo  out > $DIR
    fi
  done
}

hi_gpio() {
  for IN in $GPIOS ; do
    VALUE=/sys/class/gpio/gpio$IN/value
    if [ -f $VALUE ] ; then
      echo 1 > $VALUE
    fi
  done
}

on_off_led()                                                                    
{                                                                               
ONOFF=$1                                                                        
  for IN in $GPIOS ; do
    VALUE=/sys/class/gpio/gpio$IN/value
    if [ -f $VALUE ] ; then
      echo $ONOFF > $VALUE
      sleep .1                                                                
    fi
  done
}                                                                               
                                                                                
export_gpio
out_gpio
hi_gpio

while [ 1 ] ; do
  on_off_led 0                                                            
  sleep .5                                                                
  on_off_led 1                                                            
  sleep .5                                                                
done
