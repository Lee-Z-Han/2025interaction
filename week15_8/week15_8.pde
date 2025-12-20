import processing.sound.*;

PFont font;

SoundFile hitSound;
SoundFile spawnSound;

PImage hole1Img;
PImage hole2Img;
PImage mouseImg;
PImage badmouseImg;
PImage hitmouseImg;
PImage hitbadmouseImg;
PImage hammerImg;
PImage hithammerImg;
int imgSize = 130;

int game = 0;

void setup(){
  font = createFont("Microsoft JhengHei Bold", 32);
  textFont(font);
  size(600, 600);
  
  hole1Img = loadImage("hole1.png");
  hole2Img = loadImage("hole2.png");
  mouseImg = loadImage("mouse.png");
  badmouseImg = loadImage("badmouse.png");
  hitmouseImg = loadImage("hitmouse.png");
  hitbadmouseImg = loadImage("hitbadmouse.png");
  hammerImg = loadImage("hammer.png");
  hithammerImg = loadImage("hithammer.png");
  
  hitSound = new SoundFile(this, "hit.wav");
  spawnSound = new SoundFile(this, "spawn.wav");
}
int x, y;
int choose;
int score = 0;
int bestscore = 0;
int time = 0;
int hammertime = 0;
int gametime = 0;
int gametimeCount = 30;
boolean hit = false;
boolean down = false;
void draw(){
  if(game == 0){
    background(207, 161, 109);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(60);
    text("打地鼠", 300, 160);
    textSize(32);
    text("點擊畫面進入遊戲介紹", 300, 480);
  }
  if(game == 1){
    background(207, 161, 109);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(60);
    text("遊戲介紹", 300, 160);
    textSize(32);
    text("點擊畫面開始遊戲", 300, 480);
  }
  if(game == 2){
    background(207, 161, 109);
    
    noCursor();
    
    if(gametimeCount == 0) game++;
    
    gameTime();
    
    drawHole1();
    drawMouse();
    drawHole2();
    
    if(hammertime > 0 ) hammertime--;
    if(hammertime == 0) image(hammerImg, mouseX, mouseY, imgSize/2, imgSize/2);
    else image(hithammerImg, mouseX, mouseY, imgSize/2, imgSize/2);
      
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(24);
    text("Score: " + score, 300, 30);
    text("Time: " + gametimeCount, 520, 30);
  }
  if(game == 3){
    background(207, 161, 109);
    cursor();
    
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(60);
    text("遊戲結束", 300, 160);
    textSize(32);
    text("Score: " + score, 300, 280);
    fill(255, 255, 0);
    if(score <= bestscore) text("BestScore: " + bestscore, 300, 320);
    else text("恭喜突破目前最高分數!!", 300, 320);
    fill(255);
    text("點擊畫面重新開始遊戲", 300, 480);
  }
}
void mousePressed(){
  if(game == 0 || game == 1) game++;
  if(game == 2){
    hitSound.play();
    hammertime = 10;
    if(dist(mouseX, mouseY, x*150+75, y*150+75) < 40 && hit == false){
      if(choose < 8) score++;
      else score--;
      hit = true;
    }
  }
  if(game == 3){
    if(bestscore < score) bestscore = score;
    gametimeCount = 30;
    score = 0;
    game--;
    spawnMouse();
  }
}
void spawnMouse(){
  spawnSound.play();
  x = int(random(4));
  y = int(random(4));
  choose = int(random(10));
  time = 0;
  hit = false;
  down = false;
}
void drawHole1(){
  for(int i=0; i<4; i++){
    for(int j=0; j<4; j++){
      image(hole1Img, i*150+75-imgSize/2, j*150+75-imgSize/2, imgSize, imgSize);
    }
  }
}
void drawHole2(){
  for(int i=0; i<4; i++){
    for(int j=0; j<4; j++){
      image(hole2Img, i*150+75-imgSize/2, j*150+75-imgSize/2, imgSize, imgSize);
    }
  }
}
void drawMouse(){
  if(hit == false && down == false) time++;
  else time--;
  if(time > 30) down = true;
  if(time < 0) spawnMouse();
  if(choose < 8){
    if(hit == false) image(mouseImg, x*150+75-imgSize/2, y*150+75-imgSize/2+40-time/1.5, imgSize, imgSize);
    else image(hitmouseImg, x*150+75-imgSize/2, y*150+75-imgSize/2+40-time/1.5, imgSize, imgSize);
  }
  else{
    if(hit == false) image(badmouseImg, x*150+75-imgSize/2, y*150+75-imgSize/2+40-time/1.5, imgSize, imgSize);
    else image(hitbadmouseImg, x*150+75-imgSize/2, y*150+75-imgSize/2+40-time/1.5, imgSize, imgSize);
  }
}
void gameTime(){
  gametime++;
  if(gametime > 60){
    gametimeCount--;
    gametime = 0;
  }
}
