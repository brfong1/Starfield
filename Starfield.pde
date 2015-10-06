NormalParticle[] particles;
void setup()
{
	size(400,400);
	frameRate(20);
	particles = new NormalParticle[100];
	for(int i = 0; i < particles.length; i++)
	{
	   particles[i] = new NormalParticle();
    }
    particles[0] = new OddballParticle();
    particles[1] = new JumboParticle();
}

interface particles
{
	public void move();
	public void show();
}

void draw()
{
	background(0);
	
    for(int j = 0; j < particles.length; j++)
    {
    	particles[j].show();
    	particles[j].move();
    }
}

class NormalParticle implements particles
{
	double dx, dy, theAngle, theSpeed;
	int r, g, b, sizeX, sizeY;
	NormalParticle()
	{
       r = (int)(Math.random()*255);
       g = (int)(Math.random()*255);
       b = (int)(Math.random()*255);
       dx = 200;
       dy = 200;
       theSpeed = Math.random()*10;
       theAngle = (Math.random()*(2*Math.PI));
       sizeX = 20;
       sizeY = 20;
	}
	void move()
	{
      dx = dx + Math.cos(theAngle)*theSpeed;
      dy = dy + Math.sin(theAngle)*theSpeed;
	}
	void show()
	{
      fill(r,g,b);
      noStroke();
      ellipse((float)dx,(float)dy, sizeX,sizeY);
	}
}

class OddballParticle extends NormalParticle
{
	OddballParticle()
	{
		dx = 50;
		dy = 250;
		r = 255;
		b = 255;
		g = 255;
	}
	public void move()
	{
      dx = dx + (int)(Math.random()*2)-4;
      dy = dy + (int)(Math.random()*2)-4;
	}
}

class JumboParticle extends NormalParticle
{
  JumboParticle()
  {
    sizeX = 60;
    sizeY = 60;
  }
}