#include <SoftwareSerial.h>
SoftwareSerial gpsSerial(4, 3); // RX, TX

void setup() {
  Serial.begin(9600);
  gpsSerial.begin(9600);
}

void loop() {
  while (gpsSerial.available()) {
    Serial.write(gpsSerial.read());
  }
}
