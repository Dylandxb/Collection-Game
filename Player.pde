class Player {
  int x,y;
  int imageCounter = 0;
  
  PImage img,img2,img3,img4,img5,img6,img7,img8,img9,img10,img11,img12;
  float speedLimit;
  
  
  Player() {  
    x = 0;
    y = 410;
    speedLimit = 4;
    this.img = loadImage("img.png");
    this.img.resize(80,80);    
    this.img2 = loadImage("img3.png");
    this.img2.resize(80,80);
    this.img3 = loadImage("img4.png");
    this.img3.resize(80,80);
    this.img4 = loadImage("img5.png");
    this.img4.resize(80,80);
    this.img5 = loadImage("img6.png");
    this.img5.resize(80,80);
    this.img6 = loadImage("img7.png");
    this.img6.resize(80,80);
    this.img7 = loadImage("img8.png");
    this.img7.resize(80,80);
    this.img8 = loadImage("img9.png");
    this.img8.resize(80,80);
    this.img9 = loadImage("img10.png");
    this.img9.resize(80,80);
    this.img10 = loadImage("img11.png");
    this.img10.resize(80,80);
    this.img11 = loadImage("img12.png");
    this.img11.resize(80,80);
    this.img12 = loadImage("img13.png");
    this.img12.resize(80,80);
  }
  
  void update() {
    if (left) {
      x -= speedLimit;
    }
    if (right) {
      x += speedLimit;
    }
    if ( up) {
      y -= speedLimit;
    }
    if (down) {
      y  += speedLimit;
    }
    checkBoundaries();
    
  }
  
  void checkBoundaries() {
    if ( x > width) { 
      x = 0;
    }
    if ( x < 0) { 
      x = 0;
    }
    if (y - 4 <  0) {
      y = 0 + 4;
    }
    if ( y  > height - 110) {
      y = height - 110;
    }
    
  }
  
  void render() {
    if (imageCounter >=0 && imageCounter<10) {
      image(this.img,this.x,this.y); }
    else if (imageCounter >=10 && imageCounter < 20) {
      image(this.img2,this.x,this.y); }
    else if (imageCounter >=20 && imageCounter < 30) {
      image(this.img3, this.x, this.y); }
    else if (imageCounter >=30 && imageCounter < 40) {
      image(this.img4, this.x, this.y); }
    else if (imageCounter >=40 && imageCounter < 50) {
      image(this.img5, this.x, this.y); }
    else if (imageCounter >= 50 && imageCounter < 60) {
      image(this.img6, this.x, this.y); }
    else if (imageCounter >= 60 && imageCounter < 70) {
      image(this.img7, this.x, this.y); }
    else if (imageCounter >= 70 && imageCounter < 80) {
      image(this.img8, this.x, this.y); }
    else if (imageCounter >= 80 && imageCounter < 90) {
      image(this.img9, this.x, this.y); }
    else if (imageCounter >= 90 && imageCounter < 100) {
      image(this.img10, this.x, this.y); }
    else if (imageCounter >= 100 && imageCounter < 110) {
      image(this.img11, this.x, this.y); }
    else if (imageCounter >= 110 && imageCounter < 120) {
      image(this.img12, this.x, this.y); }
    else if (imageCounter == 120) {
      image(this.img12,this.x, this.y);
      imageCounter =0; }
    imageCounter++;
  }
  boolean collided(WaterBucket bucket) {
    return abs(this.x - bucket.x)<50 && abs(this.y - bucket.y)<60;
  }
  boolean collided(Food strawberry) {
    return abs(this.x - strawberry.x) < 50 && abs(this.y - strawberry.y) < 50;
  }
  boolean collided(Enemy eagle) {
    return abs(this.x - eagle.x) < 50 && abs(this.y - eagle.y) < 45;
  }
  boolean collided(AI ant) {
    return abs(this.x - ant.x) < 100 && abs(this.y - ant.y) < 70;
  }
} 
