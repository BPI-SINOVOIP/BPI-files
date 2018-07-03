LCD1602="lcd1602"
LCD1602="mosquitto_pub -t bananapi/rfid -m "
RFIDDEV=/dev/ttyUSB0

FW=`rfid_fw_usb.py $RFIDDEV`
echo $FW
    $LCD1602 "$FW"

while [ 1 ] ; do
  RFID=`rfid_usb.py $RFIDDEV`
  echo $RFID
  $LCD1602 "$RFID"
  sleep .1
done
