#bin/bash
#GPIO40_NO_IGPIO="13 14 3 17 58 25 27 7 4 5 6 8 12 11 100 21 54 59 57 22 23 24 60"
#IGPIOSORG="21 3 2 5 4 9"
#IGPIO + 101 = GPIO
#IGPIOS="122  104 103 106 105 110"
#W2
#GPIO40="13 14 122 104 103 3 17 58 25 27 106 105 7 4 110 5 6 8 12 11 100 21 54 59 57 22 23 24 60"
#GPIOLED="128 97 98" 
#F2S
GPIO40="12 13 15 18 19 21 23 25 27 30 31 33 34 36 38 14 16 17 20 22 24 26 28 29 32 35 37 39"
GPIOLED="" 

GPIO40NAME1="P1_04 P1_05 P1_07 P2_02 P2_03 P2_05 P2_07 P3_01 P3_03 P3_06 P3_07 P4_01 P4_02 P4_04 P4_06"
GPIO40NAME2="P1_06 P2_00 P2_01 P2_04 P2_06 P3_00 P3_02 P3_04 P3_05 P4_00 P4_03 P4_05 P4_07"

GPIOS="$GPIO40 $GPIOLED"

GPIO=0

gpio2name() {
    IN=$1
    A=$((($IN/8)))
    B=$((($IN%8)))
    GPIO="P${A}_0${B}"
    #echo $GPIO
    return 
}

export_gpio() {
  for IN in $GPIOS ; do
    gpio2name $IN
    #echo $GPIO
    EXPORT=/sys/class/gpio/export
    VALUE=/sys/class/gpio/$GPIO/value
    if [ ! -f $VALUE ] ; then
      #BPI debug	    
      #echo $GPIO
      (echo $IN > $EXPORT) 2>/dev/null
    fi
  done
}

out_gpio() {
  for IN in $GPIOS ; do
    gpio2name $IN
    DIR=/sys/class/gpio/$GPIO/direction
    if [ -f $DIR ] ; then
      echo  out > $DIR
    fi
  done
}

hi_gpio() {
  for IN in $GPIOS ; do
    gpio2name $IN
    VALUE=/sys/class/gpio/$GPIO/value
    if [ -f $VALUE ] ; then
      echo 1 > $VALUE
    fi
  done
}

on_off_led()                                                                    
{                                                                               
ONOFF=$1                                                                        
  for IN in $GPIOS ; do
    gpio2name $IN
    VALUE=/sys/class/gpio/$GPIO/value
    if [ -f $VALUE ] ; then
      echo $ONOFF > $VALUE
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
