//Se tiene la clase del mundo que guarda las naves y asteroides del juego
class GameWorld{
  private ArrayList<Asteroid> ships;
  
  private Player player; //Jugador actual
  private boolean isPaused;//Saber si esta pasuado on o el juego
  
  
  public GameWorld(){
    ships = new ArrayList<Asteroid>();
    player = new Player();
    player.setPosition(300,500);
    isPaused = true;   
  }
  
  
  public void resetGame(){
    ships.clear();
    isPaused = false;
  }
  
  public void setIsPaused(boolean b){
    this.isPaused = b;
  }
  
  public boolean isPaused(){
    return isPaused;
  }
  
  public void setPlayerPosition(float x, float y){
    if( isPaused == false )
      player.setPosition(x,y);
  }
 
   public void addShip(Asteroid ship){
    ships.add(ship);
  }
  
  //Dibuja el mundo
  public void drawWorld(){
    player.doDraw();
    for(Asteroid ship : ships){
      ship.doDraw();
      if( isPaused == false )
        ship.move();
    }
  }
  //Chequea si el jugador actual se estrello con algun asteroide
  public boolean collision(){
    for(Asteroid ship : ships){
      if( player.touch(ship) ) 
        return true;
    }
    return false;
  }
}