PImage cola;
PImage umaru;
PImage potato;
NormalParticle[] particles;
void setup()
{
  size(440, 440);
  frameRate(20);
  particles = new NormalParticle[100];
  for (int i = 0; i < particles.length; i++)
  {
    particles[i] = new NormalParticle();
  }
  particles[0] = new OddballParticle();
  particles[1] = new JumboParticle();
  cola = loadImage("cola.png");
  umaru = loadImage("http://biginjap.com/59850-thickbox_default/himouto-umaru-chan-roughly-life-size-cushion.jpg");
  potato = loadImage("potato.png");
}

interface particles
{
  public void move();
  public void show();
}

void draw()
{
  background(255);
  image(umaru, -80, -60, 600, 600);
  fill(255);
  rect(0, 0, 500, 45);
  for (int j = 0; j < particles.length; j++)
  {
    particles[j].show();
    particles[j].move();
  }
}

class NormalParticle implements particles
{
  double dx, dy, theAngle, theSpeed;
  int r, g, b, sizeX, sizeY;
  boolean up, left;
  NormalParticle()
  {
    r = (int)(Math.random()*255);
    g = (int)(Math.random()*255);
    b = (int)(Math.random()*255);
    dx = 200;
    dy = 200;
    theSpeed = Math.random()*5;
    theAngle = (Math.random()*(2*Math.PI));
    sizeX = 10;
    sizeY = 10;
  }
  void move()
  {
    dx = dx + Math.cos(theAngle)*theSpeed;
    dy = dy + Math.sin(theAngle)*theSpeed;
  }
  void show()
  {
    fill(r, g, b);
    noStroke();
    // ellipse((float)dx,(float)dy, sizeX,sizeY);
    image(cola, (float)dx, (float)dy, 23, 42);
  }
}

class OddballParticle extends NormalParticle
{
  OddballParticle()
  {
    dx = Math.random()*200;
    dy = Math.random()*200;
    r = 255;
    b = 255;
    g = 255;
    theSpeed = 1;
    up = true;
    left = true;
  }
  public void move()
  {
    if (up)
      dy-=10;
    else
      dy+=10;
    if (left)
      dx-=10;
    else
      dx+=10;
    if (dx <= 0 || dx + 51 >= 440)
    {
      left =! left;
    }
    if (dy < 0 || dy + 65 > 440)
    {
      up =! up;
    }
   }
    
  public void show()
  {
    image(potato, (float)dx, (float)dy, 50, 68);
  }
}

class JumboParticle extends NormalParticle
{
  JumboParticle()
  {
    sizeX = 50;
    sizeY = 50;
  }
}
