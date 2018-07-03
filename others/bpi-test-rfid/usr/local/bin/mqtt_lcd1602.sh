
while [ 1 ] ; do
	LCD=`mosquitto_sub -C 1 -t bananapi/rfid`
	echo "$LCD"
	lcd1602 $LCD
	sleep .1
done
