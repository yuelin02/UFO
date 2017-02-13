#include <SoftwareSerial.h>
SoftwareSerial BTserial(2, 3);

int pinRed = A0;
int pinYellow = A1;
int pinBlue = A2;

int pinRedVal = 0;
int pinYellowVal = 0;
int pinBlueVal = 0;

//int RedVal = 1000;
//int YellowVal = 660;
//int BlueVal = 330;

int state = 0;
//char a;


void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  BTserial.begin(9600);
  //  BTserial.println("Hello from Arduino");
}

void loop() {
  // put your main code here, to run repeatedly:
  int pinRedVal = analogRead(pinRed);
  int pinYellowVal = analogRead(pinYellow);
  int pinBlueVal = analogRead(pinBlue);

//  Serial.println(pinRedVal);
//  Serial.println(pinYellowVal);
//  Serial.println(pinBlueVal);

  if ((pinRedVal <= 10) && (pinYellowVal <= 10) && (pinBlueVal <= 10)) {
    state = 0;
  } else if ((pinRedVal >= 990) && (pinRedVal <= 1020)) {
    state = 1;
  } else if ((pinYellowVal >= 670) && (pinYellowVal <= 700)) {
    state = 2;
  } else if ((pinBlueVal >= 320) && (pinBlueVal <= 350)) {
    state = 3;
  } else if (((pinRedVal >= 670) && (pinRedVal <= 700)) || ((pinYellowVal >= 990) && (pinYellowVal <= 1020))) {
    state = 4;
  } else if (((pinYellowVal >= 320) && (pinYellowVal <= 350)) || ((pinBlueVal >= 670) && (pinBlueVal <= 700))) {
    state = 5;
  } else if (((pinBlueVal >= 990) && (pinBlueVal <= 1020)) || ((pinRedVal >= 320) && (pinRedVal <= 350))) {
    state = 6;
  }

  delay(100);
  BTserial.println(state);
  Serial.println(state);
}
