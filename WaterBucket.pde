class WaterBucket {
  
  
  int x;
  int y;
  int counter;
  
  PImage img = loadImage("waterbucket.png");
 

  
  
  WaterBucket(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  void update() {
    move();
    render();
  }
  
  void move() {
    x -=random(1,5); 
    y +=random(-2,3);
  }
  
  void render() {
    image(img,x,y);
    img.resize(20,20);
     
    
  }
  
}
