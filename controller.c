/*
   gcc -pthread -o spi-pigpio-speed spi-pigpio-speed.c -lpigpio

   sudo ./spi-pigpio-speed [bytes [bps [loops] ] ]
*/

#include <stdio.h>
#include <stdlib.h>
#include <pigpio.h>

#include "controller.h"

int initController()
{
  if (gpioInitialise() < 0){
    printf("ERROR: Failed to initialize GPIOs.\n");
    return -1;
  } else {
    printf("SUCCESS: Initialized GPIOs.\n");
  }

  if (gpioGetMode(SERVOPIN) != PI_OUTPUT){
    gpioSetMode(SERVOPIN, PI_OUTPUT);
  }

  return 0;
}

void getHandles(int *handle0, int *handle1)
{
  *handle0 = spiOpen(THERMOCHAN0,
		     THERMOBAUD,
		     THERMOFLAGS);

  *handle1 = spiOpen(THERMOCHAN1,
		     THERMOBAUD,
		     THERMOFLAGS);
}

void closeHandles(int *handle0, int *handle1)
{
  spiClose(*handle0);
  spiClose(*handle1);
}

/*
 * Sets the open percentage of the damper. 
 * percent - should be between 0 and 100
 * return - 0 (success) or -1 (failure)
 */
int setDamperOpen(int percent)
{
  int servo_pos;
  
  if (percent<0 || percent>100){
    printf("WARNING: Damper percent should be between 0 and 100.\n");
    return -1;
  } else {
    servo_pos = 2300 - (percent * 9);
  }

  printf("Setting damper to %d%%.\n", percent);
  if (gpioServo(SERVOPIN, servo_pos) < 0){
    printf("ERROR: Issue setting PWM.");
    return -1;
  }
  return 0;
}

/*
 * Get the temp given an spi_handle
 * handle - spi_handle value
 */
float getTemp(int *spiHandle)
{
  char buf[THERMOWORDS];
  float temp = 0.0;   /* temperature in degrees fahrenheit */

  spiRead(*spiHandle, buf, THERMOWORDS);
  temp = (((buf[0] << 8) | buf[1]) >> 3) * 0.25 * (9.0/5.0) + 32.0;
  return temp;
}

