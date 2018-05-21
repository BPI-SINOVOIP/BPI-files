
#GPIOS="13 14 3 17 58 25 27 7 4 5 6 8 12 11 100 21 54 59 57 22 23 24 60"
#IGPIOS="21 3 2 5 4 9"
# IGPIO + 101
#GPIOS="122 104 103 106 105 110"
GPIOS="13 14 122 104 103 3 17 58 25 27 106 105 7 4 110 5 6 8 12 11 100 21 54 59

export_gpio() {
for IN in $GPIOS
do
        EXPORT=/sys/class/gpio/export
        echo "echo $IN > $EXPORT"
        echo $IN > $EXPORT
done
}

out_gpio() {
for IN in $GPIOS
do
        DIR=/sys/class/gpio/gpio$IN/direction
        echo "echo out > $DIR"
        echo out > $DIR
done                                         
}                                            
                                             
hi_gpio() {                                  
for IN in $GPIOS                             
do                                           
        VALUE=/sys/class/gpio/gpio$IN/value  
        echo "echo 1 > $VALUE"               
        echo 1 > $VALUE                      
        sleep .1                             
done                                         
}                                            
                                             
low_gpio() {                               
for IN in $GPIOS
do                                                                             
        VALUE=/sys/class/gpio/gpio$IN/value  
        echo "echo 0 > $VALUE"               
        echo 0 > $VALUE                      
        sleep .1                             
done                                         
}                                            
                                             
                                             
export_gpio                                  
out_gpio                                     
                                             
while [ 1 ]                                  
do                                           
        hi_gpio                              
        low_gpio                           
done
