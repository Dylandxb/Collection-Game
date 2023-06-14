Timer gameTime;
WaterBucket bucket1,bucket2;
Player cowboy;
Food strawberry;
Enemy eagle;
Enemy anothereagle;
AI ant;
int timeRemaining;
PFont font1,font2,font3;
PImage sps;
int spsX = 0;
PImage gb;
PImage enemyImages [];
int enemyFrames;
PImage aiImages [];
int aiFrames;
int gbX;
int lives = 3;
int score = 0;
int highscore = 0;
String gameState;
ArrayList<WaterBucket> bucketList = new ArrayList();
ArrayList<Food> foodList = new ArrayList();
int spawn = 0;
boolean left,right,up,down;
int wins;
int losses;
int gamelevel;
int previousscore;
import processing.sound.*; //https://mixkit.co/free-sound-effects/game/
SoundFile waterhit;
SoundFile wingame;
SoundFile losegame;
SoundFile collision;

void setup() {
  size(700, 600);
  gameState = "SPLASH"; 
  sps = loadImage("splash2.jpg"); 
  sps.resize(width,height); 
  gb = loadImage("gameBackground.jpg");
  gb.resize(width,height);
  gameTime = new Timer (1000);
  previousscore = score;
  timeRemaining = 60;
  cowboy = new Player();
  enemyFrames = 11;
  enemyImages = new PImage[enemyFrames];
  for ( int i = 0; i <enemyFrames; i++) {
    enemyImages[i] = loadImage("assets/birds-E/bird"+nf(i,2)+".png");
  }
  aiFrames = 7;
  aiImages = new PImage[aiFrames];
  for ( int j = 0; j < aiFrames; j++) {
    aiImages[j] = loadImage("assets/ants-E/ant"+nf(j,2)+".png");
  }
  ant = new AI();
  eagle = new Enemy();
  anothereagle = new Enemy();
  left = false;
  right = false;
  up = false;
  down = false;
  wins = 0;
  losses = 0;
  gamelevel = 1;
  waterhit = new SoundFile( this, "mixkit-unlock-new-item-game-notification-254.wav");
  wingame = new SoundFile(this, "mixkit-bubbly-achievement-tone-3193.wav");
  losegame = new SoundFile(this, "mixkit-player-losing-or-failing-2042.wav");
  collision = new SoundFile(this, "mixkit-creature-cry-of-hurt-2208.wav");
  font1 = loadFont("CooperBlack-48.vlw");
  font2 = loadFont("Garamond-48.vlw");
  font3 = loadFont("Papyrus-Regular-48.vlw");
  strawberry = new Food(30, (int)random(60));
  for ( int i = 0; i <2; i++) {
    foodList.add(new Food(width, (int) random(380)));
  }
  bucket1 = new WaterBucket(20, (int)random(40));
  bucket2 = new WaterBucket(20, (int)random(40));
  for ( int i = 0; i<10; i++) {
    bucketList.add(new WaterBucket(width, (int) random(380)));
  }
  
  

}

void draw() {
  if (gameState == "SPLASH") {
    startGame();
  } else if (gameState == "PLAY") {
    playGame();
  } else if (gameState == "WIN") {
    winGame();
  } else if (gameState == "FINISH") {
    loseGame();
  }
}

void startGame() {
  image(sps,spsX,0);
  textFont(font1, 30);
  fill(0);
  text("Desert Run",width/2, 200);
  textFont(font2, 30);
  textSize(20);
  noFill();
  rect(290, 335, 120,60);
  fill(255,255,0);
  text("Game Info",width/2,height/2+60);
  textAlign(CENTER,CENTER);
  noFill();
  rect(290,275,120,60);
  fill(255,255,0);
  text("Click to Play",width/2,height/2);
  textAlign(CENTER,CENTER);
  textFont(font1,20);
  text("High Score: "+highscore, width/2, 250);
  if (mousePressed==true && mouseX > 290 && mouseX < 410 && mouseY > 275 && mouseY < 335) {
    gameState = "PLAY";
   
  }
  if (mousePressed==true && mouseX > 290 && mouseX < 410 && mouseY > 335 && mouseY < 395) {
    println("How to play:\nCollect water for score\nPick up food for extra lives\nAvoid colliding with the eagles or ant\nAnt is -3 lives\nEagle is -1 live\nGame level increase per 20 score");
  }
  
}

void playGame () { 
  image(gb,gbX,0);
    image(gb,gbX+gb.width,0);
    gbX -=1;
    if (gbX == -gb.width)
      gbX =0;
   
  if (gameTime.timefinish()==true){
    if (timeRemaining > 1) {
      timeRemaining = timeRemaining -1;
      gameTime.begin();
    } else {                   
      losses++;
      gameState = "FINISH";
      losegame.play();
    }
  if (score == previousscore + 20  ) { 
    wins++;
    gameState = "WIN";
    wingame.play();
    
  }
  else if (score >= previousscore +20 || timeRemaining == 0 ) { 
    wins++;
    gameState = "WIN";
    wingame.play();
  } else if (gamelevel == 0 || score>= previousscore + 20) {
    wins++;
    gameState = "WIN";
    wingame.play();
  }
  
  if (lives >= 6) {
    lives = 6;
  }
  if (cowboy.collided(eagle)) {
    lives = lives -1;
    collision.play();
    if (lives <= 0) {
      gameState = "FINISH";
      losses++;
      losegame.play();
  }
  }
  if ( cowboy.collided(ant)) {
    lives = lives - 3;
    if ( lives <= 0) {
      gameState = "FINISH";
      losses++;
      losegame.play();
  }
  }
  }
  spawn++;
  if (spawn %60==0) {
    bucketList.add(new WaterBucket(width, (int) random(300)));
    
  }
  else if (spawn % 60==5) {
    foodList.add(new Food(width, (int)random(460,500)));
  }
  textAlign(LEFT);
  textFont(font3, 10);
  textSize(15);
  fill(0,0,255);
  text("Time:"+timeRemaining,width/2-20,height-20);
  text("Lives:"+lives,22,height-20);
  text("Score:"+score,width-64,height-20);
  fill(255,140,0);
  textFont(font1,15);
  text("Game Level:" + gamelevel, width/2-45, 20);
  textFont(font3, 20);
  
  for(int i = 0; i < bucketList.size(); i++) {
    WaterBucket currentBucket = bucketList.get(i);
    currentBucket.update();
  if (cowboy.collided(currentBucket)) {
    score +=1;
    waterhit.play();
    highscore = max(score, highscore);
    bucketList.remove(i);
  }
  }
  for ( int i = 0; i < foodList.size(); i++) {
    Food currentFood = foodList.get(i);
    currentFood.update();
  if (cowboy.collided(currentFood)) {
    lives +=1;
    foodList.remove(i);
  }
  }
  strawberry.update();
  strawberry.render();
  bucket1.update();
  bucket2.update();
  cowboy.update();
  cowboy.render();
  eagle.update(cowboy.x, cowboy.y);
  eagle.display();
  anothereagle.update(cowboy.x,cowboy.y);
  anothereagle.display();
  ant.display();
  ant.update(cowboy.x, cowboy.y);
}

void winGame() {
  fill(0,128,0); 
  rect(0,0,width,height);
  fill(0);
  textSize(14);
  textAlign(CENTER,CENTER);
  text("Winner!\nWill you play again?",width/2,height/2);
  if (mousePressed == true) {
    gameState = "SPLASH";
    gameTime.begin();
    gamelevel++;
    previousscore = score;
    timeRemaining = 60;
    cowboy = new Player();
    eagle = new Enemy();
    ant = new AI();
  }
  showWins();
}

void loseGame() { 
  fill(200);
  rect(0,0,width,height);
  fill(0);
  noFill();
  textSize(14);
  rect(width/2-100,height/2-30,200,60);
  textAlign(CENTER,CENTER);
  text("Loser!!\nClick to play again",width/2,height/2);
  if (mousePressed==true && mouseX> width/2-100 && mouseX <width/2+100 && mouseY>height/2-30 && mouseY< height/2 +60) {
    resetGame();
    timeRemaining = 60;
    gamelevel = 0;
    score = 0;
    lives = 3;
    cowboy = new Player();
    eagle = new Enemy();
    ant = new AI();
  }
  showLosses();
}


  

void resetGame() {
  gameState = "PLAY";
  timeRemaining =60;
  if (gamelevel>1 || previousscore >=20) {
    anothereagle = new Enemy();
    anothereagle.x = width/2-40;
    anothereagle.y = 80;
    anothereagle.update(cowboy.x,cowboy.y);
    anothereagle.display();
  } 
    
}



void showWins() {
  textAlign(LEFT);
  textSize(18);
  fill(255,0,0);
  text("Wins:" + wins, 40,40);
}

void showLosses() {
  textAlign(LEFT);
  textSize(18);
  fill(255,0,0);
  text("Losses:" + losses, 40,40);
}

void keyPressed() {
    if (keyCode == LEFT) {
      left = true;
    }
    if (keyCode == RIGHT) {
      right = true;
    }
    if (keyCode == UP ) {
      up = true;
    }
    if (keyCode == DOWN) { 
      down = true;
    }
  }


void keyReleased() {
  switch(keyCode) {
    case 37:
      left = false;
      break;
    case 39:
      right = false;
      break;
    case 38:
      up = false;
      break;
    case 40:
      down = false;
      break;
    }
  }
