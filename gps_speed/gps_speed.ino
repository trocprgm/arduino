/*
 * Rui Santos 
 * Complete Project Details https://randomnerdtutorials.com
 */
 
#include <TinyGPS++.h>
#include <SoftwareSerial.h>

// The TinyGPS++ object
TinyGPSPlus gps;

// The serial connection to the GPS device
SoftwareSerial ss(4, 3);
// RX, Tx


void setup() {
  Serial.begin(9600);
  ss.begin(9600);
  Serial.print("Start");
}

void loop() {
  // This sketch displays information every time a new sentence is correctly encoded.
  while (ss.available() > 0) {
    gps.encode(ss.read());
    if (gps.location.isUpdated()) {
      Serial.println(ss.available());
      Serial.print("Latitude= "); 
      Serial.print(gps.location.lat(), 6);
      Serial.print(" Longitude= "); 
      Serial.println(gps.location.lng(), 6);
      Serial.print("Speed in miles/h = ");
      Serial.println(gps.speed.mph());
    }
  }
  
}
