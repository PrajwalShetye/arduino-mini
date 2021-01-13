#include <Arduino.h>

#define DELAY_MS (200)

// the setup function runs once when you press reset or power the board
void setup(void) {
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(LED_BUILTIN, OUTPUT);
  Serial.begin(9600);
  delay(DELAY_MS * 5);
  Serial.println("===== ===== ===== arduino:mini ===== ===== =====");
}

// the loop function runs over and over again forever
void loop(void) {
  digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(DELAY_MS);                       // wait for a second
  digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
  delay(DELAY_MS);                       // wait for a second
  Serial.println("Cycle complete");
}
