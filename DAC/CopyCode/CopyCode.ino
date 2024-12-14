
// DAC R-2R Ladder 8 bit tutorials and schematic can be seen at

int valSin; // the sinwave variable
void setup() {
  DDRD = B11111111;  // Port D at Arduino Uno (pin 0-7)
}

void loop() {
//  for (int i = 0; i < 360; i++) { //looping the value of i from 0 to 360 degree
//    valSin = ((sin(i * DEG_TO_RAD) + 1) * 255) / 2; // creating the sinwave from i, 255 is the highest value in 8 bit (0-255)
//    PORTD = valSin; // assign the sinwave to portD
//    PORTD = 5;
//    delay(10); // set the delay of the analog value
//  }
    PORTD=5;
    delay(10);
}
