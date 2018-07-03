#!/usr/bin/python
#import jogtek
import serial
import sys
import time

def main():
    try:
        while True:
            #Read ISO14443B UID
            ser.write(b'0108000304970000')
            id = ser.readline()
            #print (id)
            if (len(id)> 18):
                uid = "ISO1443B_UID: " + id[16:32]
                print (uid)
                break
            ser.write(b'0108000304990000')
            id = ser.readline()
            #print (id)
            if (len(id)> 18):
                uid = "ISO1443B_UID: " + id[16:24]
                print (uid)
                break
            #Read ISO15693 UID
            ser.write(b'0108000304980000')
            id = ser.readline()
            #print (id)
            if (len(id)> 18):
                uid = "ISO15693_UID: " + id[16:32]
                print (uid)
                break
            #Read Felica UID
            ser.write(b'01080003049A0000')
            id = ser.readline()
            #print (id)
            if (len(id)> 18):
                uid = "Felica_UID: " + id[16:32]
                print (uid)
                break
            #Read Felica UID
            ser.write(b'01080003049B0000')
            id = ser.readline()
            #print (id)
            if (len(id)> 18):
                if (len(id) > 27):
                    uid = "ISO1443A_UID: " + id[16:30]
                    print (uid)
                    break
                else:
                    uid = "ISO1443A_UID: " + id[16:24]
                    print (uid)                   
                    break
            time.sleep(0.1)
            
    except KeyboardInterrupt:
        print("Exit.")
        sys.exit()

    finally:
        sys.exit()

if __name__ == "__main__":
    RFIDDEV='/dev/ttyUSB0'
    if len(sys.argv) >= 2:
      RFIDDEV = sys.argv[1]
      #print 'set: ' + RFIDDEV
    ser = serial.Serial(port=RFIDDEV,baudrate = 115200,
                    parity=serial.PARITY_NONE,
                    stopbits=serial.STOPBITS_ONE,
                    bytesize=serial.EIGHTBITS,
                    timeout=2)
    #Read FW number
    ser.write(b'0108000304FF0000')
    id = ser.readline()
    if (len(id)> 18):
        FWnumber = id[16:27]
        #print (FWnumber)
        #print ("press Ctrl-C to exit.")
        main()
    else:
        sys.exit()
    
