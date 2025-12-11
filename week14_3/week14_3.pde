PImage holeImg;
PImage mouseImg;
int imgSize = 130;

void setup(){
  size(600, 600);
  
  holeImg = loadImage("hole.png");
  mouseImg = loadImage("mouse.png");
  
  spawnMouse();
}
int x, y;
int score = 0;
int time = 0;
void draw(){
  background(207, 161, 109);
  
  drawHole();
  drawMouse();
    
  fill(255);
  textSize(24);
  text("Score: " + score, 255, 30);
}
void mousePressed(){
  if(dist(mouseX, mouseY, x*150+75, y*150+75) < 40){
    spawnMouse();
    score++;
  }
}
void spawnMouse(){
  x = int(random(4));
  y = int(random(4));
  time = 0;
}
void drawHole(){
  for(int i=0; i<4; i++){
    for(int j=0; j<4; j++){
      image(holeImg, i*150+75-imgSize/2, j*150+75-imgSize/2, imgSize, imgSize);
    }
  }
}
void drawMouse(){
  time++;
  if(time > 60) spawnMouse();
  image(mouseImg, x*150+75-imgSize/2, y*150+75-imgSize/2, imgSize, imgSize);
}
