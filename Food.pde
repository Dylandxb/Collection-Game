class Food {
  int x, y;
  
  PImage img = loadImage("strawberry.png");
  
  Food(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  void update() {
    render();
    move();
  }
  
  void move() {
    x -=random(1,4);
    y +=random(0,0);
  }
  
  void render() {
    image(img,x,y);
    img.resize(32,32);
   
  }
  
}
