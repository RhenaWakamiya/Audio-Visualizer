import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer audio;
BeatDetect beat;
FFT fft;

void setup()
{
  fullScreen();
  //size(800, 600);
  colorMode(HSB, 120);
  smooth();
  blendMode(ADD);//混色は加算合成で
  noStroke();

  minim = new Minim(this);

  audio = minim.loadFile("チルドレンレコード.mp3", 512);

  fft = new FFT(audio.bufferSize(), audio.sampleRate());
  audio.loop();

  frameRate(30);
}

void draw()
{
  background(0);
  //background(120);

  int angle = 30; // 360/30=12

  fft.forward(audio.mix);
  println(fft.specSize());

  translate(width/2, height/2);

  for (int i = 0; i <12; i++) //360/30=12　12色表現できる
  {
    float vol = fft.getBand(i);//音量（vol）によって図形の大きさを変更

    fill(i*10, 100, 120, 20);

    float r1 = vol * 5 ;//音量（vol）
    rect(i, 50, r1, r1);

    float r2 = vol * 10 ;//音量（vol）
    rect(i, 100, r2, r2);

    float r3 = vol * 15 ;//音量（vol）
    rect(i, 150, r3, r3);

    float r4 = vol * 20 ;//音量（vol）
    rect(i, 200, r4, r4);

    float r5 = vol * 25;//音量（vol）
    rect(i, 250, r5, r5);

    float r6 = vol * 30;//音量（vol）
    rect(i, 300, r6, r6);

    rotate(radians(angle));//rectを円状に配置
  }
}

void stop()
{
  audio.close();
  minim.stop();
  super.stop();
}