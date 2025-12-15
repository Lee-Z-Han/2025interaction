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
  
  hitSound = new SoundFile(this, "hit.wav");
  spawnSound = new SoundFile(this, "spawn.wav");
}
int x, y;
int choose;
int score = 0;
int time = 0;
boolean hit = false;
boolean down = false;
void draw(){
  if(game == 0){
    background(207, 161, 109);
    fill(255);
    textSize(60);
    text("打地鼠", 215, 160);
  }
  if(game == 1){
    background(207, 161, 109);
    fill(255);
    textSize(60);
    text("遊戲介紹", 185, 160);
  }
  if(game == 2){
    background(207, 161, 109);
    
    noCursor();
    
    drawHole1();
    drawMouse();
    drawHole2();
    
    fill(255, 255, 0);
    ellipse(mouseX, mouseY, 80, 80);
      
    fill(255);
    textSize(24);
    text("Score: " + score, 255, 30);
  }
}
void mousePressed(){
  if(game == 0 || game == 1) game++;
  if(game == 2){
    hitSound.play();
    fill(255, 0, 0);
    ellipse(mouseX, mouseY, 80, 80);
    if(dist(mouseX, mouseY, x*150+75, y*150+75) < 40 && hit == false){
      if(choose < 8) score++;
      else score--;
      hit = true;
    }
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
