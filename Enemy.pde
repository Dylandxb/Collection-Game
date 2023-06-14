class Enemy {
  int x;
  int y;
  int w, h;
  int currentFrame, loopFrames;
  int offset;
  int halt;
  float speedX, speedY;
  
  
  Enemy() {
    x = width/2;
    y = 80;
    w = 40;
    h = 34;
    offset = 0;
    currentFrame = 0;
    loopFrames = 3;
    halt = 7;
    speedX = 0;
    speedY = 0;
  }
  
  void update(float cowboyx, float cowboyy) {
    if ( dist(x,y, cowboyx,cowboyy) < 250) {
      if (abs(x -cowboyx) < abs(y - cowboyy)) {
        if ( y < cowboyy) { //gap on Y axis
          speedX = 0;
          speedY = 2; //enemy above
          
        } else {
          speedX = 0;
          speedY = -2; //enemy below
          
        }
      } else {
        if ( x < cowboyx) {
          speedX = 2;
          speedY = 0;
          offset = 6;
        } else {
          speedX = -2;
          speedY = 0;
          offset = 3;
        }
      }
      x +=speedX;
      y +=speedY;
      checkBoundaries();
          
      
    }
    if ( halt == 0) {
      currentFrame = (currentFrame+1)%loopFrames;
    }
    halt = (halt+1)%7;
  }
  
  void checkBoundaries() {
    if ( x + 20 > width) {
      x = width/2;
    }
    if ( y + 20 > 440) {
      y = 440;
    }
    
  }
  
  void display() {
    image(enemyImages[currentFrame+offset],x,y);
  }

   
}
