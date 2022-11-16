#include <stdint.h>   /* Declarations of uint_32 and the like */
#include <pic32mx.h>  /* Declarations of system-specific addresses etc */
#include "mipslab.h"  /* Declatations for these labs */
volatile int *trise = (volatile int*) 0xbf886100;
#define PRESCALE (7)                //Värdet 6 = 111 --> (1:256 prescale)
#define TIMEOUT (80000000/2560) //Detta ger 100ms för varje flagg 
                                //klockfrekvens / prescale / sec
#if (TIMEOUT > 0xffff)
#error "Timer period does not fit period register"
#endif
#define T2IF (1 << 8)


int timeoutcount = 0;
int counter = 0;
int mytime = 0x5957;

char textstring[] = "text, more text, and even more text!";

/* Interrupt Service Routine */
void user_isr( void )
{
  return;
}

/* Lab-specific initialization goes here */
void labinit( void )
{
  *trise &= -0xff; //Sätter port [0-7] till outputs.

  TRISD = (0x7f << 5) | TRISD; 
  PORTE = 0;

  
  PORTECLR = (0xff << 0);

  T2CON = 0;                //Sätter timer till noll.
  //T2CONSET = (PRESCALE << 4);
  PR2 = TIMEOUT;             // PR2 är definerade värdet för när timern ska avbryta efter 100ms
  TMR2 = 0;               // Nollställer räknaren
  //T2CONSET = (1 << 15);  //Slår på timer, bit nummer 15 är de som styr när timern är igång
  T2CON = 0x8070;       //Slår på timer och sätter prescale (1:256)


  return;
}

/* This function is called repetitively from the main program */
void labwork( void )
{
  
  int tmp;
    if( tmp = getbtns() )
  {
    if( tmp & 1 ) mytime = (mytime & ~0xf0) | ( getsw() << 4 );
    if( tmp & 2 ) mytime = (mytime & ~0xf00) | ( getsw() << 8 );
    if( tmp & 4 ) mytime = (mytime & ~0xf000) | ( getsw() << 12 );
  }
  

   if(IFS(0) & 0x100)  //T2IF IFS0<8> Flaggan är på bit 8. Därför T2IF = (1 << 8)
   {
    IFS(0) = 0; //Clear flag
    timeoutcount += 1;
  }


  if(timeoutcount >= 10 || (timeoutcount < 0))
  {
  time2string( textstring, mytime );
  display_string( 3, textstring );
  display_update();
  tick( &mytime );
  display_image(96, icon);
  PORTE += 1;
  timeoutcount = 0;
  }

}









