import ddf.minim.*;

int windowWidth = 1000;
int windowHeight = 600;

float waveformHeight = 400;
float rWidth, rHeight;

Minim minim;
AudioInput in; 
PImage fade;

void setup()
{
  size(windowWidth, windowHeight, P3D);

  minim = new Minim(this);

  in = minim.getLineIn();
  
  background(0);
  fade = get(0, 0, width, height);
  
  rWidth = width*0.99;
  rHeight = height*0.99;
  
}

void draw()
{
  background(0);
  stroke(255);
  
  tint(255, 255, 255, 254);
  image(fade, (width-rWidth)/2, (height-rHeight)/2, rWidth, rHeight);
  noTint();
  //tekee fadeauksen
  
  int bufferSize = in.bufferSize();
  
  for(int i = 0; i < bufferSize - 1; i++)
  {
    int x1 = i * windowWidth / bufferSize;
    int x2 = (i + 1) * windowWidth / bufferSize;
    line( x1, (windowHeight - in.left.get(i)*waveformHeight) / 2, x2, (windowHeight - in.left.get(i+1)*waveformHeight) / 2);
  }  
  
   fade = get(0, 0, width, height);
}

