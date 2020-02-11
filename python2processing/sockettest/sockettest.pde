import processing.net.*; 
Client myClient; 
int clicks;
String inString;
void setup() { 
  // Connect to the local machine at port 10002.
  // This example will not run if you haven't
  // previously started a server on this port.
  myClient = new Client(this, "127.0.0.1", 5204); 
  // Say hello
  myClient.write("Hi there");
} 
void mouseReleased() {
  // Count the number of mouse clicks:
  clicks++;
  // Tell the server:
  myClient.write("Mouse pressed " + clicks + " times.\n");
  inString = myClient.readString(); 
  println(inString); 
}
void draw() { 
  // Change the background if the mouse is pressed
  if (mousePressed) {
    background(255);
  } else {
    background(0);
  }
} 
