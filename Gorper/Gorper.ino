#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 32 // OLED display height, in pixels

#define OLED_RESET     -1
#define SCREEN_ADDRESS 0x3C

Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);



void setup() {
  // put your setup code here, to run once:
    // SSD1306_SWITCHCAPVCC = generate display voltage from 3.3V internally
  if(!display.begin(SSD1306_SWITCHCAPVCC, SCREEN_ADDRESS)) {
    Serial.println(F("SSD1306 allocation failed"));
    for(;;); // Don't proceed, loop forever
  }
  display.display();
  display.clearDisplay();
  testdrawchar();  



}

char horid(int meth) {
  // LOOK AWAY
  // I was too lazy to figure out how to do this properly
  // just pretend this function doesn't exist
  switch (meth)
  {
    case 0:
      return '0';
    case 1:
      return '1';
    case 2:
      return '2';
    case 3:
      return '3';
    case 4:
      return '4';
    case 5:
      return '5';
    case 6:
      return '6';
    case 7:
      return '7';
    case 8:
      return '8';
    case 9:
      return '9';
    default:
      return 'L';
  }
}



void loop() {
  // put your main code here, to run repeatedly:

}

void testdrawchar(void) {
  display.clearDisplay();
  char testy[5] = {'t', 'e', ' ', ' ', 'n'};
 
  display.clearDisplay();
  for (int i = 0; i <= 200; i++) {
    // presumes to take in int
    if (i >= 100) {
      i = i - 100;
    }
    
    int first = i / 10;
    int secon = i % 10;

    
    char firstchar = horid(first);
    char seconchar = horid(secon);
    
    display.clearDisplay();
    display.setTextSize(4);      // Normal 1:1 pixel scale
    display.setTextColor(SSD1306_WHITE); // Draw white text
    display.setCursor(0, 0);     // Start at top-left corner
    display.cp437(true);         // Use full 256 char 'Code Page 437' font
    testy[0] = firstchar;
    testy[1] = seconchar;
    display.println(testy);
    delay(1000);
    display.display();
  }
  
}
