
class Asteroid extends GameCharacter{
  private Vector velocity;
  PImage img;
  
  public Asteroid(float vx, float vy){
    super();
    velocity = new Vector(vx,vy);
    radius = 20;
    img = loadImage("asteroid.jpg");
  }
  
  public void move(){
    position.addVector(velocity);
  }
  
  public void changeOrientation(){
    velocity.multiplyScalar(-1);
  }
  
   
  public void doDraw(){
    color(255,0,0);
    ellipse(position.getX(),position.getY(),radius*2,radius*2);
    image(img,position.getX()-radius,position.getY()-radius,radius*2,radius*2);
  }
}