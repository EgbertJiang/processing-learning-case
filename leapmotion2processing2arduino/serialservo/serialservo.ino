#include <Servo.h>
//servo pin 9
String inString = ""; 
Servo myservo;  
int pos = 0;    

void setup() {
  Serial.begin(9600);
  myservo.attach(9);  
  myservo.write(0);
  while (!Serial);

}

void loop() {
  if(Serial.available() > 0) {
      int inChar = Serial.read();
      if (isDigit(inChar)) {
        inString += (char)inChar;
      }
      if (inChar == '\n') {
         pos=inString.toInt();
         if(pos>180)
            pos=180;
         else if(pos<0)
            pos=0;
         myservo.write(inString.toInt());
        inString = "";
      }
    }
//   delay(2);
}
