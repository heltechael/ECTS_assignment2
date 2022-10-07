#include "xparameters.h"
#include "xgpio.h"
#include "led_ip.h"
#include "XScuTimer.h"
#include "matrix_ip.h"

#define ONE_SECOND 325000000 // half of the CPU clock speed
//====================================================

int main(void) {
	XScuTimer Timer; /* Cortex A9 SCU Private Timer Instance */
	XGpio dip, push;
	int dip_check, my_counter;

	// PS Timer related definitions
	XScuTimer_Config *ConfigPtr;
	XScuTimer *TimerInstancePtr = &Timer;
	ConfigPtr = XScuTimer_LookupConfig(XPAR_PS7_SCUTIMER_0_DEVICE_ID);
	s32 Status = XScuTimer_CfgInitialize(TimerInstancePtr, ConfigPtr,
			ConfigPtr->BaseAddr);
	if (Status != XST_SUCCESS) {
		xil_printf("Timer init() failed\r\n");
		return XST_FAILURE;
	}

	// Load timer with delay in multiple of ONE_SECOND
	XScuTimer_LoadTimer(TimerInstancePtr, ONE_SECOND);
	// Set AutoLoad mode
	XScuTimer_EnableAutoReload(TimerInstancePtr);
	// Start the timer
	XScuTimer_Start(TimerInstancePtr);

	xil_printf("-- Start of the Program --\r\n");

	XGpio_Initialize(&dip, XPAR_SWITCHES_DEVICE_ID); // Modify this
	XGpio_SetDataDirection(&dip, 1, 0xffffffff);

	XGpio_Initialize(&push, XPAR_BUTTONS_DEVICE_ID); // Modify this
	XGpio_SetDataDirection(&push, 1, 0xffffffff);

	while (1) {
		xil_printf("Enter choice: 1 (SW LEDS), 2 (Timer LEDS).\n\rCMD:> ");
		/* Read an input value from the console. */
		int value = inbyte();
		inbyte(); //CR
		inbyte(); //LF (Skip this line using PuTTY terminal)
		switch (value) {
		case '1':
//			psb_check = XGpio_DiscreteRead(&push, 1);
//			xil_printf("Push Buttons Status %x\r\n", psb_check);
			dip_check = XGpio_DiscreteRead(&dip, 1);
			xil_printf("DIP Switch Status %x\r\n", dip_check);

			// output dip switches value on LED_ip device
			LED_IP_mWriteReg(XPAR_LED_IP_S_AXI_BASEADDR, 0, dip_check);
//			for (i = 0; i < 9999999; i++)
//				;
			break;
		case '2':

			// Check timer expired
			if (XScuTimer_IsExpired(TimerInstancePtr)) {
				// clear status bit
				XScuTimer_ClearInterruptStatus(TimerInstancePtr);
				my_counter++;
				my_counter %= 16;
				LED_IP_mWriteReg(XPAR_LED_IP_S_AXI_BASEADDR, 0, my_counter);
			}
			break;
		case '3':

			break;
		case '4':
			for (row = 0; row < 4; ++row) {
				for (col = 0; col < 4; ++col) {
					Xil_Out32(
							XPAR_MATRIX_IP_0_S_AXI_BASEADDR
									+ MATRIX_IP_S_AXI_SLV_REG0_OFFSET,
							A[row].vect);
					Xil_Out32(
							XPAR_MATRIX_IP_0_S_AXI_BASEADDR
									+ MATRIX_IP_S_AXI_SLV_REG1_OFFSET,
							B[col].vect);
					P[row].comp[col] = Xil_In32(
							XPAR_MATRIX_IP_0_S_AXI_BASEADDR
									+ MATRIX_IP_S_AXI_SLV_REG2_OFFSET);

				}
			}
			break;
		default:
			break;
		}

	}
	// Stop the timer
	XScuTimer_Stop(TimerInstancePtr);
}
