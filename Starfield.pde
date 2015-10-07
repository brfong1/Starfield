PImage cola;
PImage umaru;
NormalParticle[] particles;
void setup()
{
		size(440,440);
	frameRate(20);
	particles = new NormalParticle[100];
	for(int i = 0; i < particles.length; i++)
	{
	   particles[i] = new NormalParticle();
    }
    particles[0] = new OddballParticle();
    particles[1] = new JumboParticle();
    cola = loadImage("cola.png");
    umaru = loadImage("http://biginjap.com/59850-thickbox_default/himouto-umaru-chan-roughly-life-size-cushion.jpg");

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
      fill(r,g,b);
      noStroke();
      // ellipse((float)dx,(float)dy, sizeX,sizeY);
      image(cola, (float)dx, (float)dy, 23,42);
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
	// public void show()
	// {
		
	// }
}

class JumboParticle extends NormalParticle
{
  JumboParticle()
  {
    sizeX = 50;
    sizeY = 50;
  }
}