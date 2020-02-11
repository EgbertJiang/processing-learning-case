import processing.net.*; 
Client myClient; 
int clicks;
String inString;
void setup() { 
  // 连接到本地机器 5204端口 要保证端口一致
  myClient = new Client(this, "127.0.  0.1", 5204); 
  // Say hello  ， 向后端发送
  myClient.write("Hi there");
} 
void mouseReleased() {
  // 记录点击次数
  clicks++;
  // 向后端发送按键次数
  myClient.write("Mouse pressed " + clicks + " times.\n");
  //读取后端回报消息
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
