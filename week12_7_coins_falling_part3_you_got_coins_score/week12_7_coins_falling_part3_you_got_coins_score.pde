// week12_7_coins_falling_part3_you_got_coins_score
// 修改自 week12_6_coins_falling_part2_for_array_recycle_random
// 接金幣 (5) 小人在下面接金幣 (6)得分!!!
PImage imgCoin; // 有圖檔,拉進程式裡
void setup(){
  size(300, 500);
  imgCoin = loadImage("coin.png");
  for(int i=0; i<10; i++){
    x[i] = random(300-100);
    y[i] = -100 - random(1000);
  }
}
float userX = 150, userY = 450; // 我們要控制小人
float [] x = new float[10];
float [] y = new float[10]; // float x = 0, y = 0;
void draw(){
  background(255);
  for(int i=0; i<10; i++){
    image(imgCoin, x[i], y[i], 100, 100);
    y[i] += 3; // 往下掉
    if(y[i]>500){
      x[i] = random(300-100);
      y[i] = -100 - random(200);
    }
  }
  ellipse(userX, userY, 50, 10);
}
