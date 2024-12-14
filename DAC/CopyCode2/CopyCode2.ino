#define RESOLUTION 8
#define MAX_VALUE 256

int outputs[RESOLUTION] = {0,1,2,3,4,5,6,7};
int vals[RESOLUTION];
int dacstate;
float dally;

void setup()
{
  for(int i = 0; i < RESOLUTION; i++)
	pinMode(outputs[i], OUTPUT);
}

void writeValue(int value)
{
  for(int u = 0; u < RESOLUTION; u++)
  {
	vals[u] = (value >> u) & 1;
	digitalWrite(outputs[u], vals[u]);
  }
}

void loop()
{
dally = map(analogRead(A0),0,255,0,100);

for(int i = 0; i < 360; i++) {
        dacstate=((sin(i * DEG_TO_RAD) + 1) * 255) / 2;
        writeValue(dacstate);
        delayMicroseconds(dally);
}
}
