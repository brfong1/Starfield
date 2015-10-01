
void setup()
{
	size(400,400);
}
void draw()
{
	
}
class NormalParticle
{
	double dx, dy, theAngle, theSpeed;
	int r, g, b;
	NormalParticle()
	{
       r = (int)(Math.random()*255);
       g = (int)(Math.random()*255);
       b = (int)(Math.random()*255);
       dx = 200;
       dy = 200;
       theSpeed = Math.random()*10;
       theAngle = (Math.random()*(2*Math.PI));
	}
	void move()
	{
      dx = dx + Math.cos(theAngle)*theSpeed;
      dy = dy + Math.cos(theAngle)*theSpeed;
	}
	void show()
	{
      ellipse((int)dx,(int)dy, 20,20);
	}
}
interface Particle
{
	
}
class OddballParticle //uses an interface
{
	
}
class JumboParticle //uses inheritance
{
	
}

