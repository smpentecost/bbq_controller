/*
   gcc -pthread -o spi-pigpio-speed spi-pigpio-speed.c -lpigpio

   sudo ./spi-pigpio-speed [bytes [bps [loops] ] ]
*/

#include <stdio.h>
#include <stdlib.h>
#include <pigpio.h>

#define SERVOPIN 17 //BPin 12 PWM0
#define SERVOFREQ 50 //Hz

#define THERMOCHAN0 0 //Channel for THERMO0
#define THERMOCHAN1 1 //Channel for THERMO1
#define THERMOWORDS 2 //Words to read
#define THERMOBAUD 50000 //THERMO SPI BAUD
#define THERMOFLAGS 0 //Set all flags to 0 for default

/*
 * Sets the open percentage of the damper. 
 * percent - should be between 0 and 100
 * return - 0 (success) or -1 (failure)
 */
int set_damper_open(int percent)
{
  int servo_pos;
  
  if (percent<0 || percent>100){
    printf("WARNING: Damper percent should be between 0 and 100.\n");
    return -1;
  } else {
    servo_pos = percent * 10 + 1000;
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
 * handle - an integer for the spi_handle
 */
float get_temp(int spiHandle)
{
  char buf[THERMOWORDS];
  float temp = 0.0;   /* temperature in degrees fahrenheit */

  spiRead(spiHandle, buf, THERMOWORDS);
  temp = (((buf[0] << 8) | buf[1]) >> 3) * 0.25 * (9.0/5.0) + 32.0;
  return temp;
}

int main(int argc, char *argv[]){

  if (gpioInitialise() < 0){
    printf("ERROR: Failed to initialize GPIOs.\n");
    return -1;
  } else {
    printf("SUCCESS: Initialized GPIOs.\n");
  }

  if (gpioGetMode(SERVOPIN) != PI_OUTPUT){
    gpioSetMode(SERVOPIN, PI_OUTPUT);
  }

  int spiHandle = spiOpen(THERMOCHAN0,
			  THERMOBAUD,
			  THERMOFLAGS);
  
  printf("temp = %f\n", get_temp(spiHandle));
    
  spiClose(spiHandle);

  return 0;
}
