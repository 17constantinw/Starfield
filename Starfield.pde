NormalParticle [] part;  
void setup()
{
 part = new NormalParticle[100];
  size(500,500);
  background(0,0,0);
  for(int i = 0; i < part.length; i++) {
   part[i] = new NormalParticle();
  } 
  for(int i = 1; i < part.length; i+=30) {
    part[i] = new JumboParticle();
  }
  for(int i = 2; i < part.length; i+=50) {
    part[i] = new OddballParticle();
  }
}
void draw()
{
  noStroke();
  fill(0,0,0,33);
  rect(0,0,500,500);
  for(int i = 0; i < part.length; i++) {
  part[i].show();
  part[i].move();
  }
}
class NormalParticle implements Particle
{
  int color1, color2, color3;
  double dX, dY,dTheta, dSpeed;
  NormalParticle() {
    dX = 250;
    dY = 250;
    dTheta = Math.PI*2*Math.random();
    dSpeed = (Math.random()*4)+0.5;
    color1 = (int)(Math.random()*256);
    color2 = (int)(Math.random()*256);
    color3 = (int)(Math.random()*256);
    
  }
  public void show() {
    
    fill(color1,color2,color3);
    ellipse((float)dX,(float)dY,15,15);
    
  }
  public void move() {
    dX += dSpeed*Math.cos(dTheta);
    dY += dSpeed*Math.sin(dTheta);
    dTheta += 0.05;
  }
}
interface Particle
{
  public void show();
  public void move();
}
class OddballParticle extends NormalParticle
{
  public void show() {
    fill(256,256,256);
    rect((float)dX,(float)dY,25,25);
  }
  public void move() {
    dX += dSpeed*Math.cos(dTheta);
    dY += dSpeed*Math.sin(dTheta);
    dTheta -= 0.05;
  }
}
class JumboParticle extends NormalParticle
{
   public void show() {
     fill(color1, color2, color3);
     ellipse((float)dX,(float)dY,50,50);
   }
}

