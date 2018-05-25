
echo 128 > /sys/class/gpio/export                                               
echo 97 > /sys/class/gpio/export                                                
echo 98 > /sys/class/gpio/export                                                
echo out > /sys/class/gpio/gpio128/direction                                    
echo out > /sys/class/gpio/gpio97/direction                                     
echo out > /sys/class/gpio/gpio98/direction                                     
                                                                                
on_off_led()                                                                    
{                                                                               
ONOFF=$1                                                                        
echo $ONOFF > /sys/class/gpio/gpio128/value                                     
sleep .1                                                                        
echo $ONOFF > /sys/class/gpio/gpio97/value                                      
sleep .1                                                                        
echo $ONOFF > /sys/class/gpio/gpio98/value                                      
sleep .1                                                                        
}                                                                               
                                                                                
while [ 1 ]                                                                     
do                                                                              
        on_off_led 0                                                            
        sleep .5                                                                
        on_off_led 1                                                            
        sleep .5                                                                
done
