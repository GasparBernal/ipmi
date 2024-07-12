//Bernal Gaspar 91499/4
//Con la letra T alejas cuadrados
//Con la letra G acercas cuadrados
//Con la letra R cambias colores ramdom del centro
//Con la letra S reseteas todo
//https://youtu.be/6gervYTMwbs
PImage cuadrado;
int posX = 600, posY = 200;
float cua = 20;
boolean cambiarColor = false;
boolean siguiendoMouse = false; 
color[] paleta;

void setup() {
  size(800, 400);
  cuadrado = loadImage("cuadrado.jpg");
  
  paleta = new color[10];
  paleta[0] = color(27, 26, 32); 
  paleta[1] = color(21, 21, 21); 
  paleta[2] = color(35, 53, 67); 
  paleta[3] = color(56, 79, 93); 
  paleta[4] = color(83, 101, 111); 
  paleta[5] = color(132, 145, 153);
  paleta[6] = color(69, 78, 199); 
  paleta[7] = color(58, 52, 187); 
  paleta[8] = color(42, 36, 168); 
  paleta[9] = color(27, 26, 32); 
}

void draw() {
  background(255);

  if (siguiendoMouse) {
    posX = mouseX;
    posY = mouseY;
    Ilusion();
  }
  
  for (int i = 0; i < 10; i++) {
    float x = map(i, 0, 9, 600, posX);
    float y = map(i, 0, 9, 200, posY);
    float tam = map(i, 0, 9, 400, 150);
    color tono = paleta[i]; 
    dibujarCuadrado(x, y, tam, tono);
  }


  for (int x = 125; x > 80; x -= 7) {
    if (cambiarColor) { 
      fill(random(255), random(255), random(255));
    } else {
      fill(128, 0, 128); 
    }
    rect(posX - cua / 2, posY - cua / 2, x, x); 
  }
  
  for (int x = 60; x > 1 - 5; x -= 8) {
    if (cambiarColor) {
      fill(random(0), random(0), random(255));
    } else {
      fill(75, 0, 130);
    }
    rect(posX + cua / 2, posY + cua / 2, x, x); 
  }
  

  image(cuadrado, 0, 0, width / 2, height);
}

void dibujarCuadrado(float x, float y, float tam, color col) {
  fill(col);
  rectMode(CENTER);
  rect(x, y, tam, tam);
}

void Ilusion() {
  posX += random(-1, 2);
  posY += random(-1, 2);
}

float alejarCuadrado(float tamañoActual, float distancia) {
  return tamañoActual + distancia;
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    cambiarColor = !cambiarColor;
  } else if (key == 'g' || key == 'G') {
    alejarCuadrados(-10); 
  } else if (key == 's' || key == 'S') {
    resetearCuadrados();
  } else if (key == 't' || key == 'T') {
    alejarCuadrados(10); 
  }
}

void resetearCuadrados() {
  posX = 600;
  posY = 200;
  cambiarColor = false;
  cua = 20;
}


void mousePressed() {
  siguiendoMouse = true;
}


void mouseReleased() {
  siguiendoMouse = false;
}

void alejarCuadrados(float distancia) {
  cua = alejarCuadrado(cua, distancia);
}
