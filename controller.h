#define SERVOPIN 0 //BCM - PWM0
#define SERVOFREQ 50 //Hz

#define THERMOCHAN0 0 //Channel for THERMO0
#define THERMOCHAN1 1 //Channel for THERMO1
#define THERMOWORDS 2 //Words to read
#define THERMOBAUD 50000 //THERMO SPI BAUD
#define THERMOFLAGS 0 //Set all flags to 0 for default

#define DAMPERPERIOD 1 //Damper period in seconds

int initController(int *handle0, int *handle1);

int setDamperOpen(int percent);

float getTemp(int *spiHandle);

void closeHandles(int *handle0, int *handle1);
