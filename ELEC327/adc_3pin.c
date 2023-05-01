#include <msp430.h>
// Global Variables
unsigned int adc[3] = {0};  // This will hold the different pin values
unsigned int pin0 = 0;
unsigned int pin1 = 0;
unsigned int pin2 = 0;
//Function Prototypes
void Setup_HW(void);        // Setup watchdog timer, clockc, ADC ports
void Read_Acc(void);    // This function reads the ADC and stores the pin values

int main(void)
{
  Setup_HW();
  while (1)
  {
        Read_Acc(); // This function reads the ADC and stores the pin0, pin1 and pin2 values
  }
}

// ADC10 interrupt service routine
#pragma vector=ADC10_VECTOR
__interrupt void ADC10_ISR(void)
{
  __bic_SR_register_on_exit(CPUOFF);        // Clear CPUOFF bit from 0(SR)
}

void Setup_HW(void)
{
      WDTCTL = WDTPW + WDTHOLD;                 // Stop WDT
      ADC10CTL1 = INCH_2 + CONSEQ_1;            // A2/A1/A0, single sequence
      ADC10CTL0 = ADC10SHT_2 + MSC + ADC10ON + ADC10IE;
      ADC10DTC1 = 0x03;                         // 3 conversions
      ADC10AE0 |= 0x03;                         // Disable digital I/O on P1.0 to P1.2
}
void Read_Acc(void)
{
    ADC10CTL0 &= ~ENC;
    while (ADC10CTL1 & BUSY);               // Wait if ADC10 core is active
    ADC10SA = (unsigned int)adc;            // Copies data in ADC10SA to unsigned int adc array
    ADC10CTL0 |= ENC + ADC10SC;             // Sampling and conversion start

    pin0 = adc[0];                        // adc array 0 copied to the variable pin0
    pin1 = adc[1];                        // adc array 1 copied to the variable pin1
    pin2 = adc[2];                        // adc array 2 copied to the variable pin2
    __bis_SR_register(CPUOFF + GIE);        // LPM0, ADC10_ISR will force exit
}
