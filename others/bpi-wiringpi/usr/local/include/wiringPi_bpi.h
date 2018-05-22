/*
 * wiringPi.h:
 *	Arduino like Wiring library for the Raspberry Pi.
 *	Copyright (c) 2012-2017 Gordon Henderson
 ***********************************************************************
 * This file is part of wiringPi:
 *	https://projects.drogon.net/raspberry-pi/wiringpi/
 *
 *    wiringPi is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU Lesser General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    wiringPi is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU Lesser General Public License for more details.
 *
 *    You should have received a copy of the GNU Lesser General Public License
 *    along with wiringPi.  If not, see <http://www.gnu.org/licenses/>.
 ***********************************************************************
 */

#ifndef	__WIRING_BPI_H__
#define	__WIRING_BPI_H__

#define BPI	1
/* define in OLD wiringPi.h */
#define I2C_PIN         7
#define SPI_PIN         8
#define PULLUP          5
#define PULLDOWN        6
#define PULLOFF         7

#define BPI_MODEL_MIN   21

// Function prototypes
//	c++ wrappers thanks to a comment by Nick Lott
//	(and others on the Raspberry Pi forums)

#ifdef __cplusplus
extern "C" {
#endif

// Core wiringPi functions

extern int  bpi_wiringPiSetup       (void) ;
extern int  bpi_wiringPiSetupSys    (void) ;
extern int  bpi_wiringPiSetupI2C    (int board_model, const char **device);
extern int  bpi_wiringPiSetupSPI    (int board_model, const char **device);
extern int  bpi_piGpioLayout        (void);
extern void bpi_piBoardId           (int *model, int *rev, int *mem, int *maker, int *warranty);

extern          void bpi_pinModeAlt          (int pin, int mode) ;
extern          void bpi_pinMode             (int pin, int mode) ;
extern          void bpi_pullUpDnControl     (int pin, int pud) ;
extern          int  bpi_digitalRead         (int pin) ;
extern          void bpi_digitalWrite        (int pin, int value) ;
extern unsigned int  bpi_digitalRead8        (int pin) ;
extern          void bpi_digitalWrite8       (int pin, int value) ;
extern          void bpi_pwmWrite            (int pin, int value) ;

// On-Board Raspberry Pi hardware specific stuff

extern          void bpi_setPadDrive         (int group, int value) ;
extern          int  bpi_getAlt              (int pin) ;
extern          void bpi_pwmToneWrite        (int pin, int freq) ;
extern          void bpi_pwmSetMode          (int mode) ;
extern          void bpi_pwmSetRange         (unsigned int range) ;
extern          void bpi_pwmSetClock         (int divisor) ;
extern          void bpi_gpioClockSet        (int pin, int freq) ;
extern unsigned int  bpi_digitalReadByte     (void) ;
extern unsigned int  bpi_digitalReadByte2    (void) ;
extern          void bpi_digitalWriteByte    (int value) ;
extern          void bpi_digitalWriteByte2   (int value) ;

// Interrupts
//	(Also Pi hardware specific)

extern int  bpi_wiringPiISR         (int pin, int mode, void (*function)(void)) ;

#ifdef __cplusplus
}
#endif

#endif
