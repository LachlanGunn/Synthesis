/**
 * \example Fixed.pde
 *
 * Fixed-frequency sinusoid generator.
 *
 * This example produces a 1MHz sinusoidal signal using the %AD9835 class
 * from the Synthesis library.
 */

#include <SPI.h>
#include "AD9835.h"

// We begin by creating the AD9835 object with the pin assignments
// that are used.  If another pinout is used, this must be
// modified.
AD9835 dds(
        7, // FSYNC
        3, // SCLK
        2, // SDATA
        6, // FSEL
        5, // PSEL1
        4, // PSEL0
        50000000 // hzMasterClockFrequency (50MHz)
    );

void setup()
{
    // We must first set up all of our output pins.
    dds.begin();
}

void loop()
{
  

    // We then set the board to produce a 1MHz signal.
    dds.setFrequencyHz(0, 1000000);
    dds.selectFrequencyRegister(0);

    // Without modulation the choice of phase offset does not matter,
    // but we set it to zero for good measure.
    dds.setPhaseDeg(0,0);
    dds.selectPhaseRegister(0);

    // Finally, we turn on the IC.
    dds.enable();
    while(1)
    {
        delay(10);
    }
}
