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
void mouseClicked()
{
  setup();
}
interface particles
{
  public void move();
  public void show();
  public void wrap();
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
    theSpeed = Math.random()*50;
    theAngle = (Math.random()*(2*Math.PI));
    sizeX = 23;
    sizeY = 42;
  }
  public void move()
  {
    dx = dx + (Math.cos(theAngle))*theSpeed;
    dy = dy + (Math.sin(theAngle))*theSpeed;
  }
  public void show()
  {
    fill(r, g, b);
    noStroke();
    // ellipse((float)dx,(float)dy, 20,20);
    image(cola, (float)dx, (float)dy, sizeX, sizeY);
  }
  public void wrap()
  {
    if (dx > 440 || dx < 0 || dy > 440 || dy < 0)
    {
      dx = 220;
      dy = 220;
      System.out.println("no");
      theSpeed = Math.random()*50;
      theAngle = (Math.random()*(2*Math.PI));
      sizeX = 23;
      sizeY = 42;
    }
  }
}

class OddballParticle extends NormalParticle
{
  OddballParticle()
  {
    dx = (Math.random()*400)+20;
    dy = (Math.random()*400)+20;
    r = 255;
    b = 255;
    g = 255;   
    up = true;
    left = true;
  }
  public void move()
  {
    theSpeed = Math.random()*5;
    theAngle = (Math.random()*(2*Math.PI)); 
    if (up) 
    {
      dy-=10;
      // dy = dy + Math.sin(theAngle)*theSpeed;
    } else
    {
      dy+=10;
      // dy = dy + Math.sin(theAngle)*theSpeed;
    }
    if (left)
    {
      dx-=10;
      // dx = dx + Math.cos(theAngle)*theSpeed;
    } else
    {
      dx+=10;
      // dx = dx + Math.cos(theAngle)*theSpeed;
    }
    if (dx - 1 <= 0 || dx + 51 >= 440)
    {
      left =! left;
    }
    if (dy - 1 < 0 || dy + 65 > 440)
    {
      up =! up;
    }
  }

  public void show()
  {
    image(potato, (float)dx, (float)dy, 50, 68);
  }
  public void wrap()
  {
    if (dx - 1 <= 0 || dx + 51 >= 440)
    {
      left =! left;
    }
    if (dy - 1 < 0 || dy + 65 > 440)
    {
      up =! up;
    }
  }
}

class JumboParticle extends NormalParticle
{
  JumboParticle()
  {
    sizeX = 46;
    sizeY = 84;
  }
}
