#include <xparameters.h>
#include <xgpio.h>
#include <xstatus.h>
#include <xil_printf.h>

/* Definitions */
//#define GPIO_DEVICE_ID XPAR_GPIO_0_DEVICE_ID  /* GPIO device for buttons/switches */
//#define GPIO_DEVICE_ID XPAR_LED_DEVICE_ID /*GPIO device that LEDs are connected to*/
#define GPIO_DEVICE_ID XPAR_LED_DEVICE_ID
#define LED XPAR_LED_DEVICE_ID
#define WAIT_VAL 1000000000                   /* Delay value for 1Hz operation */

/* Function prototypes */
int delay(void);

/* Main function */
int main()
{
int count;
int count_masked;
XGpio switches, leds;
int statusLED;
int statusSwitch;
int buttons;
int sw;
//u32 buttons, switches;

/* Initialize GPIO for buttons/switches */
statusSwitch = XGpio_Initialize(&switches, GPIO_DEVICE_ID);
if (statusSwitch != XST_SUCCESS) {
xil_printf("GPIO initialization failed\n\r");
}

/* Initialize GPIO for LEDs */
statusLED = XGpio_Initialize(&leds, LED);
if (statusLED != XST_SUCCESS) {
xil_printf("LEDs initialization failed\n\r");
}

/* Set data directions */
XGpio_SetDataDirection(&switches, 1, 0xFF);  /* Upper 4-bits for buttons (input) */
//XGpio_SetDataDirection(&switches, 2, 0x0F);  /* Lower 4-bits for switches (input) */
XGpio_SetDataDirection(&leds, 1, 0x00);  /* LEDs as output */

/* Initialize count */
count = 0;

while (1)
{
/* Read button and switch states */
buttons = XGpio_DiscreteRead(&switches, 1);
//sw = XGpio_DiscreteRead(&switches, 2);

/* Handle push button 0: Increment count at 1Hz */
if (buttons & 0x10) {  // BTN0 pressed
count++;
count_masked = count & 0x0F;
xil_printf("Action: Incrementing count\n\r", count_masked);
delay();
}

/* Handle push button 1: Decrement count at 1Hz */
if (buttons & 0x20) {  // BTN1 pressed
count--;
count_masked = count & 0x0F;
xil_printf("Action: Decrementing count\n\r", count_masked);
delay();
}

/* Handle push button 2: Display switches status */
if (buttons & 0x40) {  // BTN2 pressed
int switch_state = XGpio_DiscreteRead(&switches, 1);
sw = switch_state  & 0x0F;

//write switch status to LEDs
XGpio_DiscreteWrite(&leds, 1, sw);

//xil_printf("Action: Displaying switches status\n\r");
xil_printf("Switches state: 0x%x\n\r", sw);
delay();
}

/* Handle push button 3: Display count on LEDs */
if (buttons & 0x80) {  // BTN3 pressed
count_masked = count & 0xF;  // Mask to lower 4 bits for the LEDs
XGpio_DiscreteWrite(&leds, 1, count_masked);  // Write to LEDs

xil_printf("Value of LEDs = 0x%x\n\r", count_masked);
delay();
}
}


return 0;

}

/* Delay function to create a 1Hz timing */
int delay(void)
{
volatile int delay_count=0;
while(delay_count < WAIT_VAL)
delay_count++;
return (0);
}
