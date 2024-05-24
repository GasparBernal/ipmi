//TP2
//Bernal Gaspar
//legajo:91499/4
//Se reinicia con un click en la pantalla en cualquier momento
int estado =0;
int segundos= 0;
PImage  Pantalla1;
PImage  Pantalla2;
PImage Pantalla3;
PImage flecha;

float py = 0;
float px =0;
float opacidad = 255;
float vel = 1;
void setup() {

  size(640, 480);
  textSize(30);
  textAlign(CENTER);
  Pantalla1 =loadImage("pantalla1.jpg");
  Pantalla2=loadImage("pantalla2.jpg");
  Pantalla3=loadImage("pantalla3.jpg");
  flecha=loadImage("Flecha.png");


}
void draw() {
  text(segundos, width/2, 300);
  if (frameCount%60==0) {
    segundos ++;
  }
  opacidad = py*255/height;
  if (frameCount%60==0) {


    vel = vel-0.01;
    ellipse(100, 100, 600, 430);
  }
  if (estado==0) {
    image(Pantalla1, 0, 0);
    textSize(30);
    fill(255,255,0);
    text("The Secret of Monkey Island \n Es una aventura gráfica lanzada por \n LucasFilm Games en 1990.", width/2, py);
    if (py<80) {
      py = py+0.5 * vel;
    }
  }
  if (estado==1) {
    image(Pantalla2, 0, 0);
    textSize(20);
    fill(255,255,0);
    text("En la isla Mêlée, Guybrush Threepwood sueña con ser pirata.\n Para lograrlo, debe superar tres desafíos: vencer en un duelo a Carla,\n robar una estatua y encontrar un tesoro enterrado.", width/2, py);
    if (py<150) {
      py = py+0.2 * vel;
    }
  }
  if (estado==2) {
    image(Pantalla3, 0, 0);
    textSize(15);
    fill(255,255,0);
    text("Guybrush reúne una tripulación y zarpa hacia Monkey Island.\n Enfrenta peligros como caníbales y el ermitaño Herman Toothrot.\n Con un elixir vudú, derrota a LeChuck en Mêlée Island, rescatando a Elaine.\n Juntos disfrutan de un momento romántico, pero aún les aguardan nuevas aventuras.", width/2, py);
    if (py<200) {
      py = py+0.1 * vel;
      fill(255);
      ellipse(600, 450, 50, 50);
      fill(0);
      text("R", 600, 460);
      flecha.resize(30,30);
      image(flecha,520,435);
    }
  }
  if (segundos<=8) {
    estado = 0;
  } else if (segundos>8 && segundos<= 20) {
    estado = 1;
  } else {
    estado = 2;
  }
}

void mousePressed() {
  if (mouseX>=600 && mouseX<=460 && mouseY>=600 && mouseY<=460);
  segundos = 0;
  estado =0;
  py=0;
}
