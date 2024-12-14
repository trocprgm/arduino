#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#include <TinyGPS++.h> //for gps
#include <SoftwareSerial.h> //for gps


#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 32 // OLED display height, in pixels

#define OLED_RESET     -1
#define SCREEN_ADDRESS 0x3C

Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

TinyGPSPlus gps;

SoftwareSerial ss(4, 3);




void setup() {
  // put your setup code here, to run once:
    // SSD1306_SWITCHCAPVCC = generate display voltage from 3.3V internally
  if(!display.begin(SSD1306_SWITCHCAPVCC, SCREEN_ADDRESS)) {
    Serial.println(F("SSD1306 allocation failed"));
    for(;;); // Don't proceed, loop forever
  }
  display.clearDisplay();
  floatshow(13.2);
  display.display();
  Serial.begin(9600); // starts serial monitor yapping
  ss.begin(9600); // starts gps serial yapping?
}


void loop(){
  // This sketch displays information every time a new sentence is correctly encoded.
  unsigned long clickt = 0;
  float lat = 0;
  float lng = 0;
  float speedy = 13.2;
  while (ss.available() > 0){
    gps.encode(ss.read());
    if (gps.location.isUpdated()){
      //Serial.print("Latitude= "); 
      //Serial.print(gps.location.lat(), 6);
      //Serial.print(" Longitude= "); 
      //Serial.println(gps.location.lng(), 6);
      //Serial.print("\nSatty's ");
      //Serial.println(ss.available());
      lat = gps.location.lat();
      lng = gps.location.lng();
      //Serial.println(TinyGPSPlus::cardinal(gps.course.deg()));

      speedy = gps.speed.mph();
      
      //Serial.print("Speed in miles/h = ");
      
      
      if (millis() >= (clickt + 500)) {
        //Adjusting interval time ^^, can fix/break things. Thinking emote
        
        //Serial.print(millis());
        clickt = millis();
        //Serial.println(speedy);
        floatshow(speedy);
      }
      
    }
    
  }
  
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

void floatshow(float rawspeed) {
  //display.clearDisplay();
  //display.display();
  char disp[5] = {' ',' ',' ',' ',' '};
  int trunkspeed = (int)(rawspeed);
  int first = trunkspeed / 10;
  int secon = trunkspeed % 10;
  char firstchar = horid(first);
  char seconchar = horid(secon);
  
  display.setTextSize(4);      // Normal 1:1 pixel scale
  display.setTextColor(SSD1306_WHITE); // Draw white text
  display.setCursor(0, 0);     // Start at top-left corner
  display.cp437(true);         // Use full 256 char 'Code Page 437' font
  disp[0] = firstchar;
  disp[1] = seconchar;
  display.clearDisplay();
  display.println(disp);
  display.display();
  
  
}
