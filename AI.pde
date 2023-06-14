class AI {
  int x,y,w,h;
  int currentFrame, loopFrames;
  int offset;
  int halt;
  int speedX, speedY;
  
  AI() {
    x = width-150;
    y = 500;
    w = 120;
    h = 70;
    offset = 0;
    currentFrame = 0;
    loopFrames = 3;
    halt = 5;
    speedX = 0;
    speedY = 0;
  }
  
  void update(float cowboyx, float cowboyy) {
    if ( dist(x,y,cowboyx,cowboyy) < 500) {
      if ( abs(x-cowboyx) < abs(y-cowboyy)) {
        if ( y < cowboyy) { 
          speedX = 0;
          speedY = 0; 
        } else {
          speedX = 0;
          speedY = -0; 
        }
      } else {
        if ( x < cowboyx) {
          speedX = 2;
          speedY = 0;
          
        } else {
          speedX = -2;
          speedY = 0;
      
        }
      }
      x +=speedX;
      y +=speedY;
      checkBoundaries();
      
    }
    if (halt == 0) {
      currentFrame = (currentFrame+1)%loopFrames;
    }
    halt = (halt+1)%5;
  
  
    
  }
  
  void checkBoundaries() {
    if ( x + 50 > width) {
      x = width-200;
    }
  }
  
  void display() {
    image(aiImages[currentFrame+offset],x,y,w,h);
    
  }
  
  
}
