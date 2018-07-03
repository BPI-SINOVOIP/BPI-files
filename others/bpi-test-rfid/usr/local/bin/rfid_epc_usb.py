#!/usr/bin/python
#import jogtek
import serial
import sys
import time
import numpy as np

def crc16(data):
    '''
    CRC-16-CCITT Algorithm
    '''
    data = bytearray(data)
    byteflag = 0
    bytedata = 0
    poly = 0x1021
    crc = 0xFFFF
    for b in data:
        if b > 0x39:
            b = b - 0x41 + 10
        else:
            b -= 0x30       
        if byteflag == 0:
            b <<= 4
            bytedata = b
            byteflag = 1
        else:
            bytedata += b
            byteflag = 0
            c = (bytedata << 8)
            for _ in range(0, 8):
                if ((crc ^ c)  & 0x8000) : 
                    crc = (crc << 1) ^ poly
                else:
                    crc <<= 1
                c = c << 1 
                crc = crc & 0xffff
            
    return np.uint16(crc)


#comport = '/dev/ttyAMA0'
comport = '/dev/ttyUSB0'
if len(sys.argv) >= 2:
  comport = sys.argv[1]
  #print 'set: ' + comport

#multiepc = False
multiepc = True

ser = serial.Serial(port=comport, baudrate = 38400,
                    parity=serial.PARITY_NONE,
                    stopbits=serial.STOPBITS_ONE,
                    bytesize=serial.EIGHTBITS,
                    timeout=2)

#print
#print("Read EPC by TM915")
#print

try:
    while True:
        epc = ""
        if multiepc == True :
            #print("epc:1")
            ser.write(b'\nU\r')
        else:
            #print("epc:2")
            ser.write(b'\nQ\r')
        while True:
            buf = ser.readline() 
            buf = ser.readline().decode('utf-8')
            #print("epc:3")
            if multiepc == True :
                if len(buf) <= 4 :
                    break
                #print("epc:4")
                #print("buf: " + buf)
                #print(buf[1:33])
                print(buf[1:17] + " " + buf[17:31])
                crcdata=bytes(buf[1:33],"ascii")    
                if crc16(crcdata) == 0x1D0F :
                    epc = epc + buf[1:33] + "\r\n"                    
            else:
                print("epc:5")
                if len(buf) > 5 :
                    crcdata=bytes(buf[1:33],"ascii")    
                    if crc16(crcdata) == 0x1D0F :
                        epc = epc + buf[1:33] + "\r\n"
                break
        #print("epc:6")
        if epc != "" :
            epc = epc[:len(epc)-2]
            print (epc)
        time.sleep(0.2)

        
except KeyboardInterrupt:
    ser.close()
    print("Exit.")
    sys.exit()
        
finally:
    ser.close()
    sys.exit()     
