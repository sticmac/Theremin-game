#define PHOTOCELL A0

void setup () {
  Serial.begin(9600);
}

void loop() {
  int var = analogRead(PHOTOCELL);
  Serial.println(var);
  delay(200);
}
