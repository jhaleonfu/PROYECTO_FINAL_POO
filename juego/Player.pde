//Es la clase del jugador que pinta la imagen adecuada
//para el jugador.
class Player extends GameCharacter{
  
  PImage img;
  
  public Player(){
    radius = 20;
    img = loadImage("playerImage.jpg");
  }
  
  public void doDraw(){
    ellipse(position.getX(),position.getY(),radius*2,radius*2);
    image(img,position.getX()-radius,position.getY()-radius,radius*2,radius*2);
  }
}