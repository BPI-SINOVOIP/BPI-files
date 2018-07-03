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
                Response=""
                for x in id:
                    Response=Response+chr(x)
                uid = "ISO1443B UID : " + Response[16:32]
                print (uid)
            ser.write(b'0108000304990000')
            id = ser.readline()
            #print (id)
            if (len(id)> 18):
                Response=""
                for x in id:
                    Response=Response+chr(x)                
                uid = "ISO1443B UID : " + Response[16:24]
                print (uid)
            #Read ISO15693 UID
            ser.write(b'0108000304980000')
            id = ser.readline()
            #print (id)
            if (len(id)> 18):
                Response=""
                for x in id:
                    Response=Response+chr(x)                
                uid = "ISO15693 UID : " + Response[16:32]
                print (uid)
            #Read Felica UID
            ser.write(b'01080003049A0000')
            id = ser.readline()
            #print (id)
            if (len(id)> 18):
                Response=""
                for x in id:
                    Response=Response+chr(x)                
                uid = "Felica UID : " + Response[16:32]
                print (uid)
            #Read Felica UID
            ser.write(b'01080003049B0000')
            id = ser.readline()
            #print (id)
            if (len(id)> 18):
                Response=""
                for x in id:
                    Response=Response+chr(x)                
                if (len(id) > 27):
                    uid = "ISO1443A UID : " + Response[16:30]
                    print (uid)
                else:
                    uid = "ISO1443A UID : " + Response[16:24]
                    print (uid)                   
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
        print  (FWnumber)
        #print ("press Ctrl-C to exit.")
        #main()
    else:
        sys.exit()
    
