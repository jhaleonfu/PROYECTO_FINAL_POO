import java.util.Random;

/*
Variables globales del juego:
EL world es el mundo donde estan las naves
*/
GameWorld world;
int currentLevel; //Nivel actual del juego
int time; //Tiempo actual dentro del nivel 
int timePerLevel = 500; //Duracion de cada nivel

double probabilityPerLevel[] = { 0.01, 0.02, 0.03, 0.035, 0.04 }; //Probabilidades por nivel de aparicion de un asteroide
float velocityXPerLevel[] = { 10.0, 11.5, 13.2, 14.0, 15.0 }; //Velocidades maximas en X para cada asteroide aleatorio
float velocityYPerLevel[] = {0.0, 0.0, 3.0, 4.0, 5.0}; //Velocidades maximas en Y para cada asteroide aleatorio
int asteroidsPerLevel[] = { 3,1,2,2,3 }; //Cantidad de asteroides aleatorios que se agregan en cada instante de tiempo por nivel 

int numberOfLevels = probabilityPerLevel.length; //cantidad de nivleles


//Dibuja el fondo negro
void drawBackground(){
  background(0);
}


//Iniciaizacion de variables
void setup() {
  size(600, 600);
  drawBackground();
  noStroke();
  fill(102);
  world = new GameWorld();
  currentLevel = 0;
}

//Aca corre cada instante de tiempo del jueg o
void draw(){
  time++; //Se actualiza el tiempo
  drawBackground();
  
  if( time >= timePerLevel ){ //Se chequea si se debe subir el nivel
    
    levelUp();
  }
  
  world.setPlayerPosition(mouseX,mouseY); //Se mueve el jugador de acuerdo a la posicion del mouse
  world.drawWorld(); //Se dibuja el muundo del juego (las naves y asteroides)
  if( world.isPaused() == false ) //Si el juego no esta pausado se agregan asteroides aleatoriamente
    randomlyAddEnemies();
    
  if( world.isPaused() == false && world.collision() ){ //Si el mundo no esta pausado y hay colision del jugador con algun asteroide se reporta al usuario
    MsgBox("Game Over", "Fail");
    world.resetGame();
    currentLevel = 0;
    time = 0;
    
    //Si hay colision se reinicia el juego
  }
  
  
  //Se dibuja el estado del juego en texto
  if( world.isPaused() ){
    textSize(32);
    text("Oprima cualquier tecla para inciar", 10, 30);
    fill(255, 0, 0);  
  }else{
    textSize(32);
    text("Nivel Actual " + currentLevel, 10, 30);
    text("Tiempo: " + (timePerLevel-time), 10, 70);
    fill(255, 0, 0);
  }

}

//Se sube el nivel si no ha superado el numero maximo de niveles
void levelUp(){
  if( currentLevel >= numberOfLevels ){
    MsgBox("You won the game!", "WIN");
    currentLevel = 0;
    time = 0;
    world.resetGame();
  }else{
    time = 0;
    world.resetGame();   //Se resetea el juego si es necesario
    currentLevel = currentLevel + 1;
    println("Now in level: " + currentLevel);
  }
}

//Funcion auxiliar para moastrar un mensaje en pantalla
void MsgBox( String Msg, String Titel ){
 javax.swing.JOptionPane.showMessageDialog ( null, Msg, Titel, javax.swing.JOptionPane.INFORMATION_MESSAGE  );
}

//Se activa/desactiva la pausa con el teclado
void keyReleased() {
  world.setIsPaused( !world.isPaused() );
}


//Agrega asteroides aleatoriamente de acuerdo a cada nivel
void randomlyAddEnemies(){
  Random rand = new Random();
  for(int i=0; i<asteroidsPerLevel[currentLevel]; i++)
    if( rand.nextFloat() <= probabilityPerLevel[currentLevel] ) //Se utiliza la probabilidad de acuerdo al nivel actual
      createRandomEnemies(1);
}


//Crea n asteroides aleatorios
void createRandomEnemies(int n){
  Random rand = new Random();
  for(int i=0; i<n; i++){
    float dir = 1.0;
    if( rand.nextBoolean() == true)
      dir = -1.0; //Se estalece la posicion
    Asteroid asteroid = new Asteroid(velocityYPerLevel[currentLevel] * dir ,rand.nextFloat()*velocityXPerLevel[currentLevel] + 1.0);
    asteroid.setPosition(rand.nextFloat()*600.0,10); //Lo coloca en la parte de arriba de la pantalla
    world.addShip(asteroid); //Se agrega al mundo el asteroide
  }
}