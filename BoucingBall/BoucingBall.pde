void setup(){
  size(1920,1080);
}
float ballx = 1920/5,bally = 1080/2;
float ballsize = 10;
float ballspeedx = 3,ballspeedy = 3;



//b = border
float b1x = 0, b1y = 0;        //top-left
float b2x = 1920,b2y = 0;      //top-right
float b3x = 1920,b3y = 1080;   //bot-right
float b4x = 0, b4y = 1080;     //bot-left
float bspeed = 0.5;
void draw(){
  background(255);
  b1x += bspeed;  //Flytter "border" grænsen
  b1y += bspeed;
  b2x -= bspeed;
  b2y += bspeed;
  b3x -= bspeed;
  b3y -= bspeed;
  b4x += bspeed;
  b4y -= bspeed;  //Flytter "border" grænsen
  
  if (b3y-b1y < 30){  //Hvis boxen er for lille voksen den igen 
    bspeed = -bspeed;
  }
  if (b1x < 0){       //HVis boxen er for stor skrumper den igen
    bspeed = -bspeed;
  }
  
  
  ballx += ballspeedx;
  bally += ballspeedy;
  
  if (ballx+ballspeedx+ballsize >= b2x){ //Hvis den kommer til at ramme højre grænsen næste frame. Flytter den hen til grænsen (For at være "Pixel-perfect") og derefter skifter retning
    while(ballx+ballsize <= b2x){
      ballx ++;
    }
    ballspeedx = -ballspeedx;
  }
  if (ballx+ballspeedx-ballsize <= b1x){ //Hvis den kommer til at ramme venstre grænsen næste frame. Flytter den hen til grænsen (For at være "Pixel-perfect") og derefter skifter retning
    while(ballx+ballsize <= b1x){
      ballx --;
    }
    ballspeedx = -ballspeedx;
  }
  if (bally+ballspeedy-ballsize <= b1y){ //Hvis den kommer til at ramme top grænsen næste frame. Flytter den hen til grænsen (For at være "Pixel-perfect") og derefter skifter retning
    while(bally+ballsize <= b1y){
      bally --;
    }
    ballspeedy = -ballspeedy;
  }
  if (bally+ballspeedy+ballsize >= b3y){ //Hvis den kommer til at ramme bund grænsen næste frame. Flytter den hen til grænsen (For at være "Pixel-perfect") og derefter skifter retning
    while(bally+ballsize <= b3y){
      bally ++;
    }
    ballspeedy = -ballspeedy;
  }
  
  
  ellipse(ballx,bally,ballsize,ballsize); //Draw Ball
  line(b1x,b1y,b2x,b2y);                  //Draw Top border
  line(b2x,b2y,b3x,b3y);                  //Draw Right border
  line(b3x,b3y,b4x,b4y);                  //Draw Bot border
  line(b4x,b4y,b1x,b1y);                  //Draw Left border
}
