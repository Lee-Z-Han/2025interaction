import processing.sound.*;

SoundFile hitSound;
SoundFile spawnSound;

PImage holeImg;
PImage mouseImg;
PImage badmouseImg;
PImage hitmouseImg;
PImage hitbadmouseImg;
int imgSize = 130;

void setup(){
  size(600, 600);
  
  holeImg = loadImage("hole.png");
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
  background(207, 161, 109);
  
  drawMouse();
  drawHole();
    
  fill(255);
  textSize(24);
  text("Score: " + score, 255, 30);
}
void mousePressed(){
  hitSound.play();
  if(dist(mouseX, mouseY, x*150+75, y*150+75) < 40 && hit == false){
    if(choose < 8) score++;
    else score--;
    hit = true;
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
void drawHole(){
  for(int i=0; i<4; i++){
    for(int j=0; j<4; j++){
      image(holeImg, i*150+75-imgSize/2, j*150+75-imgSize/2, imgSize, imgSize);
    }
  }
}
void drawMouse(){
  if(hit == false && down == false) time++;
  else time--;
  if(time > 60) down = true;
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
