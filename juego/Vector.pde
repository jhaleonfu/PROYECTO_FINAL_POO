//Clase auxiliar para un vector de 2 dimensiones
class Vector{
  float x,y;
  
  public Vector(float x, float y){
    setX(x);
    setY(y);
  }
  
  public void multiplyScalar(float e){
    x = x * e;
    y = y * e;
  }
  
  public void addVector(Vector v){
    x += v.getX();
    y += v.getY();
  }
  
  public float getX(){
    return x;
  }
  
  public float getY(){
    return y;
  }
  
  
  
  public void setX(float x){
    this.x = x;
  }
  
  public void setY(float y){
    this.y = y;
  }
  
  public void setPosition(float x, float y){
    setX(x);
    setY(y);
  }
}