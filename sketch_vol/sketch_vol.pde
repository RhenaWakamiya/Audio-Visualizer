import ddf.minim.analysis.*;
import ddf.minim.*;
 
Minim minim;
AudioInput audioIn;
 
void setup()
{
  size(800, 600);
  minim = new Minim(this);
  audioIn = minim.getLineIn(Minim.STEREO, 512);
}
 
void draw()
{
  background(0);
  float level = audioIn.mix.level()*1000;
  fill(255,0,255);
  ellipse(width/2, height/2, level, level);
  println(level);
  
  if(level>=100.0){
    background(255);
  }
}
 
void stop()
{
  audioIn.close();
  minim.stop();
  super.stop();
}