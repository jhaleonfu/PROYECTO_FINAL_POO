//Super clase que abstrae un personaje del juego
//Tiene su posicion y radio, se utiliza una abstraccion
//Con circulos para poder determinar colisiones
abstract class GameCharacter{
  protected Vector position;
  protected float radius;
  
  public GameCharacter(){
    position = new Vector(0,0);
  }
 
  public void setPosition(float x, float y){
    position.setX(x);
    position.setY(y);
  }
  
  public boolean touch(GameCharacter GameCharacter){
    float x0 = position.getX();
    float y0 = position.getY();
    float R0 = radius;
    
    float x1 = GameCharacter.position.getX();
    float y1 = GameCharacter.position.getY();
    float R1 = GameCharacter.radius;
    //Formula matematica de interseccion de circulos 
    return (R0-R1)*(R0-R1) <= (x0-x1)*(x0-x1)+(y0-y1)*(y0-y1) && (x0-x1)*(x0-x1)+(y0-y1)*(y0-y1) <= (R0+R1)*(R0+R1);

  }
  
  public abstract void doDraw();
}