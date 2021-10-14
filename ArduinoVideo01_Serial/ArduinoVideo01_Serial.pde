/* Arduino video example by Thomas Rutgers, st. Joost Techlab 2021
This code works with the AnalogReadSerial example sketch
(In the Arduino IDE: File->Examples->Basics->AnalogReadSerial)

*/

import processing.serial.*;

Serial myPort;  // Create object from Serial class
int val = 0;      // Data received from the serial port

void setup() 
{
  size(400, 400);
  println(Serial.list()); //show the list
  String portName = Serial.list()[2];
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');
}

void draw()
{
  background(0);
  text(val,200,200);
}

void serialEvent(Serial p) { 
  String inString = p.readStringUntil('\n');
  val = Integer.parseInt(inString.trim());
} 
