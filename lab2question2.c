//8-bit GPIO IP block 
//lower 4-bits = switches
//upper 4-bits = buttons


/COUNT value 
//push button 0 - increment COUNT
//button 1 - decrement 
//button 2 = status of switches
//button 4 = COUNT displayed on LEDs 

#include <xparameters.h>
#include <xgpio.h>
#include <xstatus.h>
#inlclude <xil_printf.h>

#define GPIO_DEVICE_ID XPAR_LED_ID
#define WAIT_VAL 10000000


int delay (void);

int main(){
	int count;
	int count_masked;
	XGpio leds;
	XGpio switches;
	
	int statusLed; //status of leds
	
	int statusSwitch; //status of switches 
	
	statusLed = XGpio_Initialize(&leds, GPIO_DEVICE_ID);
	XGpio_SetDataDirection(&leds, 1,0x00);
	if(status != XST_SUCCESS) {
		xil_printf("Initilization failed"); 
	} 
	
	
	statusSwitch = XGpio_Initialize(&switches, SWITCH);
	
	
	
	




}
	
	