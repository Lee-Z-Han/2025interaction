void setup(){
  size(600, 600);
  spawnMouse();
}
int x, y;
int score = 0;

void draw(){
  background(255);
  
  fill(255, 255, 0);
  ellipse(x*150+75, y*150+75, 80, 80);
    
  fill(0);
  textSize(24);
  text("Score: " + score, 480, 40);
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
}
