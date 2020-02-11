//leap motion 头文件
import de.voidplus.leapmotion.*;
PVector v1;
PVector v2;
float light1;
float light2;
LeapMotion leap;


//导入串口
import processing.serial.*;
Serial myPort; 
//初始化角度变量
int pos=0;

void setup() {
  size(1200, 600);
  background(255);
  leap = new LeapMotion(this);
  //打开串口
  String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);

}

void draw() {
  background(255);

  for (Hand hand : leap.getHands ()) {


    //int     handId             = hand.getId();
    //PVector handPosition       = hand.getPosition();
    //PVector handStabilized     = hand.getStabilizedPosition();
    //PVector handDirection      = hand.getDirection();
    //PVector handDynamics       = hand.getDynamics();
    //float   handRoll           = hand.getRoll();
    //float   handPitch          = hand.getPitch();
    //float   handYaw            = hand.getYaw();
    boolean handIsLeft         = hand.isLeft();
    boolean handIsRight        = hand.isRight();
    float   handGrab          = hand.getGrabStrength();
    //float   handPinch          = hand.getPinchStrength();
    //float   handTime           = hand.getTimeVisible();
    //PVector spherePosition     = hand.getSpherePosition();
    //float   sphereRadius       = hand.getSphereRadius();
    
    if(handIsRight){
      v2  = hand.getPosition();
      light2 = map(handGrab,0,1,0,255);
      fill(light2);
      float r = map(handGrab,1,0,50,200);
      ellipse(v2.x,v2.y,r,r);
      float poss= map(handGrab,1,0,0,180);
      pos = int(poss);
      //发送数据到串口
      myPort.write(str(pos));
      myPort.write("\n");//终止标识符
      
      println(pos);
    }    
  hand.draw();
  }
}
