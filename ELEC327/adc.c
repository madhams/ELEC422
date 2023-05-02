#include <msp430.h> 
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
// ADC in MSP430


int datatosend[] = {0b00000001, 0b00000011, 0b00000111, 0b00001111, 0b00011111, 0b00111111, 0b01111111, 0b11111111};
char vt_char[5];
char rm_char[5];
char mv_char[5];
char charmemval[] = "ADC10MEM Value: ";
char volt[] = "Voltage of the Potentiometer is: ";
char newline[] = " \r\n";
char dot[] = ".";
#define SERIAL BIT0 //   P1.0
#define SRCLK BIT4  //   P1.4
#define RCLK BIT5   //   P1.5

void SRCLK_Pulse (void);  //To create a clock pulse for Shift Reg
void RCLK_Pulse (void);   //To create a clock pulse for Storage Reg
void Send_Bit (unsigned int value);     //For sending 1 or zero
void ser_output(char *str);
void main(void)
{
    int x;
    int y;
    int i;
    WDTCTL = WDTPW | WDTHOLD;   // stop watchdog timer
    BCSCTL1= CALBC1_1MHZ;
    DCOCTL = CALDCO_1MHZ;
    P1DIR |= SERIAL + SRCLK + RCLK;
    P1SEL = BIT1|BIT2;
    P1SEL2 = BIT1|BIT2;
    UCA0CTL1 |= UCSWRST+UCSSEL_2;
    UCA0BR0 = 52;
    UCA0BR1 = 0;
    UCA0MCTL = UCBRS_0;
    UCA0CTL1 &= ~UCSWRST;

    volatile float voltage;
    ADC10CTL0 = SREF_0|ADC10SHT_2|ADC10ON;
    ADC10CTL1 = INCH_3|SHS_0|ADC10DIV_0|ADC10SSEL_0|CONSEQ_0;
    ADC10AE0 = BIT3;  //P1.3 also above, INCH_3
    ADC10CTL0 |= ENC;

    while(1){
        ADC10CTL0 |= ADC10SC;
        while(ADC10CTL1 & ADC10BUSY);
        int memval = ADC10MEM;
        voltage = ((ADC10MEM*3.3)/1023); // mapping values
        int volt_int = floor(voltage);
        int rmndr = floor((voltage-volt_int)*1000);
        ltoa(memval, mv_char, 10);
        ltoa(volt_int,vt_char, 10);
        ltoa(rmndr,rm_char, 10);
        ser_output(charmemval); ser_output(mv_char); ser_output(newline);
        ser_output(volt); ser_output(vt_char); ser_output(dot); ser_output(rm_char); ser_output(newline);
        if ( voltage <= 0.412 ) y=0;
        else if ( voltage <= 0.825 ) y=1;
        else if ( voltage <= 1.236 ) y=2;
        else if ( voltage <= 1.648 ) y=3;
        else if ( voltage <= 2.06 ) y=4;
        else if ( voltage <= 2.472 ) y=5;
        else if ( voltage <= 2.884 ) y=6;
        else y=7;
        for (i=0;i<8;i++){
                    x = (datatosend[y] & (1 << i));
                    Send_Bit(x);
                    SRCLK_Pulse();

                }
        RCLK_Pulse();
        __delay_cycles(100000);
    }
}
void ser_output(char *str){
    while(*str != 0){
        while (!(IFG2&UCA0TXIFG));
        UCA0TXBUF = *str++;
    }
}
void SRCLK_Pulse (void)
{
  P1OUT |= SRCLK;
  P1OUT ^= SRCLK;
}
void RCLK_Pulse (void)
{
  P1OUT |= RCLK;
  P1OUT ^= RCLK;
}
void Send_Bit (unsigned int value)
{
    if (value != 0){
        P1OUT |= SERIAL;}
    else {
        P1OUT &= ~SERIAL;
    }
}