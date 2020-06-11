#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include "controller.h"

int main(int argc, char *argv[]){

  int damper = 0;
  float temp0 = 0.0;
  float temp1 = 0.0;
  float set_temp = 0;
  
  int *spiHandle0 = malloc(4);
  int *spiHandle1 = malloc(4);

  if (argc != 2){
    printf("ERROR: Set temperature required.\n");
    return -1;
  } else {
    set_temp = atof(argv[1]);
    printf("Set temp to %f fahrenheit.\n", set_temp);
  }

  initController();
  getHandles(spiHandle0, spiHandle1);
  
  while (1==1){
    temp0 = getTemp(spiHandle0);
    temp1 = getTemp(spiHandle1);
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
    setDamperOpen(damper);
    sleep(DAMPERPERIOD);
  }
    
   closeHandles(spiHandle0, spiHandle1);
  free(spiHandle0);
  free(spiHandle1);
  
  return 0;
}
