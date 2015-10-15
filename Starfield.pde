PImage cola;
PImage umaru;
PImage potato;
NormalParticle[] particles;
void setup()
{
  size(750, 420);
  frameRate(20);
  particles = new NormalParticle[100];
  for (int i = 0; i < particles.length; i++)
  {
    particles[i] = new NormalParticle();
  }
  particles[0] = new OddballParticle();
  particles[1] = new JumboParticle();
  cola = loadImage("cola.png");
  umaru = loadImage("umaru_cola.png");
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
  image(umaru, 0, 0, 750, 420);
  fill(255);
  for (int j = 0; j < particles.length; j++)
  {
    particles[j].show();
    particles[j].move();
    particles[j].wrap();
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
    // dx = (int)((Math.random()*20) + 330);
    // dy = (int)((Math.random()*20) + 50);
    dx = 330;
    dy = 70;
    // theSpeed = Math.random()*50;
    theSpeed = 50;
    theAngle = (Math.random()*(2*Math.PI));
    sizeX = 46;
    sizeY = 84;
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
    if ((dx > 510 || dx < 0) && (dy > 510 || dy < 0))
    {
      dx = (int)((Math.random()*20) + 330);
      dy = (int)((Math.random()*20) + 50);
      dx = 330;
      dy = 70;
      // theSpeed = Math.random()*50;
      theAngle = (Math.random()*(2*Math.PI));
      sizeX = 46;
      sizeY = 84;
    }
    // dx = dx + (Math.cos(theAngle))*theSpeed;
    // dy = dy + (Math.sin(theAngle))*theSpeed;
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
    if (dx - 1 <= 0 || dx + 51 >= 750)
    {
      left =! left;
    }
    if (dy - 1 < 0 || dy + 65 > 750)
    {
      up =! up;
    }
    if (dx - 1 <= 0 || dx + 51 >= 750)
    {
      left =! left;
    }
    if (dy - 1 < 0 || dy + 65 > 750)
    {
      up =! up;
    }
  }

  public void show()
  {
    image(potato, (float)dx, (float)dy, 75, 102);
  }
  public void wrap()
  {
    if (dx - 1 <= 0 || dx + 51 >= 750)
    {
      left =! left;
    }
    if (dy - 1 < 0 || dy + 65 > 750)
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
