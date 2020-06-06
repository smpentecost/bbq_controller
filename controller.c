/*
   gcc -pthread -o spi-pigpio-speed spi-pigpio-speed.c -lpigpio

   sudo ./spi-pigpio-speed [bytes [bps [loops] ] ]
*/

#include <stdio.h>
#include <stdlib.h>
#include <pigpio.h>
#include <unistd.h>

#define SERVOPIN 0 //BCM - PWM0
#define SERVOFREQ 50 //Hz

#define THERMOCHAN0 0 //Channel for THERMO0
#define THERMOCHAN1 1 //Channel for THERMO1
#define THERMOWORDS 2 //Words to read
#define THERMOBAUD 50000 //THERMO SPI BAUD
#define THERMOFLAGS 0 //Set all flags to 0 for default

#define DAMPERPERIOD 1 //Damper period in seconds

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
float get_temp(int spiHandle)
{
  char buf[THERMOWORDS];
  float temp = 0.0;   /* temperature in degrees fahrenheit */

  spiRead(spiHandle, buf, THERMOWORDS);
  temp = (((buf[0] << 8) | buf[1]) >> 3) * 0.25 * (9.0/5.0) + 32.0;
  return temp;
}

int main(int argc, char *argv[]){

  float set_temp = 0;

  if (gpioInitialise() < 0){
    printf("ERROR: Failed to initialize GPIOs.\n");
    return -1;
  } else {
    printf("SUCCESS: Initialized GPIOs.\n");
  }

  if (argc != 2){
    printf("ERROR: Set temperature required.\n");
    return -1;
  } else {
    set_temp = atof(argv[1]);
    printf("Set temp to %f fahrenheit.\n");
  }

  if (gpioGetMode(SERVOPIN) != PI_OUTPUT){
    gpioSetMode(SERVOPIN, PI_OUTPUT);
  }

  int spiHandle0 = spiOpen(THERMOCHAN0,
			  THERMOBAUD,
			  THERMOFLAGS);

  int spiHandle1 = spiOpen(THERMOCHAN1,
			  THERMOBAUD,
			  THERMOFLAGS);

  int damper = 0;
  float temp0 = 0.0;
  float temp1 = 0.0;
  
  while (1==1){
    temp0 = get_temp(spiHandle0);
    temp1 = get_temp(spiHandle1);
    printf("temp0 = %f\n", temp0);
    printf("temp1 = %f\n", temp1);
    if (temp0 < set_temp){
      if (damper < 100){
	damper++;
      }
    } else if (temp0 > set_temp){
      if (damper > 0){
	damper--;
      }
    }
    set_damper_open(damper);
    sleep(DAMPERPERIOD);
  }
    
  spiClose(spiHandle0);
  spiClose(spiHandle1);

  return 0;
}
