// Bernal Gaspar 91499/4
//Con la R los cuadrados internos cambian de color constamente, apretar de nuevo r para que deje de hacer ese efecto
//Con la G los cuadrados se separan
// Con la S los cuadrados vuelven a su posicon original
PImage cuadrado;
int posX = 600, posY = 200;
float cua = 20;
boolean changeColor = false;

void setup() {
  size(800, 400);
  cuadrado = loadImage("cuadrado.jpg");
}

void draw() {
  background(255);
  for (int i = 0; i < 10; i++) {
    rectMode(CENTER);
    float x = map(i, 0, 9, 600, mouseX);
    float y = map(i, 0, 9, 200, mouseY);
    float tam = map(i, 0, 9, 400, 150);
    float tono = map(i, 0, 9, 0, 255);
    fill(0, 0, tono);
    rect(x, y, tam, tam);
  }
  if (posX > 400 && posX < 800) {
    Ilusion();
  }
  for (int x = 125; x > 80; x -= 7) {
    rectMode(CENTER);
    float col = map(x, 125, 80, 255, 50);
    if (changeColor) { 
      fill(random(255), random(255), random(255));
    } else {
      fill(0, 0, col);
    }
    rect(posX - cua, posY - cua, x, x);
  }
  for (int x = 60; x > 1 - 5; x -= 8) {
    rectMode(CENTER);
    float col = map(x, 60, 1 - 5, 30, 255);
    if (changeColor) {
      fill(random(255), random(255), random(255));
    } else {
      fill(0, 0, col);
    }
    rect(posX + cua, posY + cua, x, x);
  }
 // Aca decido poner la imagen ultima para que se sobreponga a todo
  image(cuadrado, 0, 0, width / 2, height);
}
void Ilusion() {
  posX += random(-1, 2);
  posY += random(-1, 2);
}
float alejarCuadrado(float tamañoActual, float sumar) {
  return tamañoActual + sumar;
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    changeColor = !changeColor;
  } else if (key == 'g' || key == 'G') {
    cua = alejarCuadrado(cua, 5);
  } else if (key == 's' || key == 'S') {
    ResetearCuadrados();
  }
}
void ResetearCuadrados() {
  posX = 600;
  posY = 200;
  changeColor = false;
  cua = 20;
}
