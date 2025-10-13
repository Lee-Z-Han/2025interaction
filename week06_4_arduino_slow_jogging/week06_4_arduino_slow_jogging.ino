// week06_4_arduino_slow_jogging
void setup() {
  // put your setup code here, to run once:
  pinMode(8, OUTPUT); // 8 Buzzer
}

void loop() {
  // put your main code here, to run repeatedly:
  tone(8, 780, 60); // 你自己決定聲音的 Hz pin8, 780 Hz, 60 ms
  delay(333); // 等 0.333 秒 換下個音
  tone(8, 320, 60); // 你自己決定聲音的 Hz pin8, 320 Hz, 60 ms
  delay(333); // 等 0.333 秒 換下個音
} // 每秒會叫3聲，60秒會叫180聲， 180 BPM (Beat Per Minute)
