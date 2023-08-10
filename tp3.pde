// VARIABLES DE IMAGEN
PImage[] images = new PImage[11];
PImage[] option3Images = new PImage[4];
PImage[] option3_3Images = new PImage[8];
PImage imgGoBack;
PImage imgGo;

// VARIABLES DE TEXTO
String[] texts = new String[11];
String[] option3Texts = new String[4];
String[] option3_3Texts = new String[8];

// VARIABLES DE TAMAÑO DE TEXTO
float[] textPositionsX = new float[11];
float[] textPositionsY = new float[11];
float[] option3TextPositionsX = new float[4];
float[] option3TextPositionsY = new float[4];
float[] option3_3TextPositionsX = new float[8];
float[] option3_3TextPositionsY = new float[8];

// VARIABLES DE BOTONES
boolean goBack = false;
boolean go = false;

// OTROS
boolean[] diapos = new boolean[12];
boolean[] option3Diapos = new boolean[4];
boolean[] option3_3Diapos = new boolean[8];
boolean[] option3_3_ImagesDiapos = new boolean[8];
float tiempoDiapositiva = 0;
float duracionDiapositiva = 5;

boolean nextRama1 = false;
boolean nextRama2 = false;
boolean credits = false;

public void settings() {
  size(600, 600);
}

void setup() {
  // INICIALIZACIÓN DE VARIABLES RAMA 0
  for (int i = 0; i < 11; i++) {
    images[i] = loadImage("rama0/imagenes/p" + (i+1) + ".jpg");
    textPositionsX[i] = width / 2;
    textPositionsY[i] = height / 2;
    texts[i] = join(loadStrings("rama0/texto/p" + (i+1) + ".txt"), "\n");
  }

  // INICIALIZACIÓN DE VARIABLES RAMA 1
  for (int i = 0; i < 4; i++) {
    option3Images[i] = loadImage("rama1/imagenes/p" + (i+3) + "r1.jpg");
    option3TextPositionsX[i] = width / 2;
    option3TextPositionsY[i] = height / 2;
    option3Texts[i] = join(loadStrings("rama1/texto/p" + (i+3) + "r1.txt"), "\n");
  }

  // INICIALIZACIÓN DE VARIABLES RAMA 2
  for (int i = 0; i < 8; i++) {
    option3_3Images[i] = loadImage("rama2/imagenes/p" + (i+5) + "r3.jpeg");
    option3_3TextPositionsX[i] = width / 2;
    option3_3TextPositionsY[i] = height / 2;
    option3_3Texts[i] = join(loadStrings("rama2/texto/p" + (i+5) + "r3.txt"), "\n");
  }

  // INICIALIZACIÓN DE VARIABLES DE INICIO
  imgGoBack = loadImage("volver.jpg");
  imgGo = loadImage("go.png");
}

void draw() {
  // println("La posición actual del mouse es: (" + mouseX + ", " + mouseY + ")");

  if (!go) {
    background(255, 255, 255);
    image(imgGo, 170, 145, 260, 260);
  } else {

    if (credits) {
      fill(255);
      text("Créditos", 10, 20);
      textSize(16);
      textAlign(CENTER, CENTER);
      image(imgGoBack, 518, 522, 46, 77);
    } else {
      for (int i = 0; i < 11; i++) {
        if (diapos[i]) {
          image(images[i], 0, 0, 600, 600);
          fill(0, 0, 0, 200);
          rect(textPositionsX[i], textPositionsY[i], 570, 150);
          fill(255);
          textSize(16);
          text(texts[i], textPositionsX[i], textPositionsY[i]);
          if (i == 0 || i == 1 || i == 3 || i == 4 || i == 5 || i == 6 || i == 7 || i == 8 || i == 9 || i == 10) {
            drawNextButton();
          } else if (i == 2) {
            drawOptionalButtons();
          }
        }
      }

      for (int i = 0; i < 4; i++) {
        if (option3Diapos[i]) {
          image(option3Images[i], 0, 0, 600, 600);
          fill(0, 0, 0, 200);
          rect(option3TextPositionsX[i], option3TextPositionsY[i], 570, 150);
          fill(255);
          textSize(16);
          text(option3Texts[i], option3TextPositionsX[i], option3TextPositionsY[i]);
          if (i == 0 || i == 1) {
            drawNextButton();
          } else if (i == 2) {
            drawOptionalButtons();
          }
        }
      }

      for (int i = 0; i < 8; i++) {
        if (option3_3Diapos[i]) {
          image(option3_3Images[i], 0, 0, 600, 600);
          fill(0, 0, 0, 200);
          rect(option3_3TextPositionsX[i], option3_3TextPositionsY[i], 570, 150);
          fill(255);
          textSize(16);
          text(option3_3Texts[i], option3_3TextPositionsX[i], option3_3TextPositionsY[i]);
          if (i < 7) {
            drawNextButton();
          }
        }
      }
    }
  }
}

//Avanzando todas las diapositivas
void avanzarDiapositiva() {

  // Validación rama 0
  if (diapos[0]) {
    diapos[0] = false;
    diapos[1] = true;
  } else if (diapos[1]) {
    diapos[1] = false;
    diapos[2] = true;
  } else if (diapos[3]) {
    diapos[3] = false;
    diapos[4] = true;
  } else if (diapos[4]) {
    diapos[4] = false;
    diapos[5] = true;
  } else if (diapos[5]) {
    diapos[5] = false;
    diapos[6] = true;
  } else if (diapos[6]) {
    diapos[6] = false;
    diapos[7] = true;
  } else if (diapos[7]) {
    diapos[7] = false;
    diapos[8] = true;
  } else if (diapos[8]) {
    diapos[8] = false;
    diapos[9] = true;
  } else if (diapos[9]) {
    diapos[9] = false;
    diapos[10] = true;
  } else if (diapos[10]) {
    diapos[10] = false;
    credits = true;
  } else if (credits) {
    credits = false;
  }

  // Validación rama 1
  if (option3Diapos[0]) {
    option3Diapos[0] = false;
    option3Diapos[1] = true;
  } else if (option3Diapos[1]) {
    option3Diapos[1] = false;
    option3Diapos[2] = true;
  }  else if (option3Diapos[3]) {
    option3Diapos[3] = false;
    credits = true;
  } else if (credits) {
    credits = false;
  }

  // Validación rama 2
  if (option3_3Diapos[0]) {
    option3_3Diapos[0] = false;
    option3_3Diapos[1] = true;
  } else if (option3_3Diapos[1]) {
    option3_3Diapos[1] = false;
    option3_3Diapos[2] = true;
  } else if (option3_3Diapos[2]) {
    option3_3Diapos[2] = false;
    option3_3Diapos[3] = true;
  } else if (option3_3Diapos[3]) {
    option3_3Diapos[3] = false;
    option3_3Diapos[4] = true;
  } else if (option3_3Diapos[4]) {
    option3_3Diapos[4] = false;
    option3_3Diapos[5] = true;
  } else if (option3_3Diapos[5]) {
    option3_3Diapos[5] = false;
    option3_3Diapos[6] = true;
  } else if (option3_3Diapos[6]) {
    option3_3Diapos[6] = false;
    option3_3Diapos[7] = true;
  } else if (option3_3Diapos[7]) {
    option3_3Diapos[7] = false;
    credits = true;
  } else if (credits) {
    credits = false;
  }
}

void mouseClicked() {
  //BOTON DE INICIO 
  if (!go && mouseX >= 170 && mouseX <= 430 && mouseY >= 145 && mouseY <= 405) {
    go = true;
    diapos[0] = true;
  }
  
  // Botón de avanzar diapositiva
  if ( (diapos[0] || diapos[1] || diapos[3] || diapos[4] || diapos[5] || diapos[6] || diapos[7] || diapos[8] || diapos[9] || diapos[10] ||
    option3Diapos[0] || option3Diapos[1] || option3Diapos[3] ||
    option3_3Diapos[0] || option3_3Diapos[1] || option3_3Diapos[2] || option3_3Diapos[3] || option3_3Diapos[4] || option3_3Diapos[5] || option3_3Diapos[6] || option3_3Diapos[7] || credits)
    && go && mouseX >= 220 && mouseX <= 340 && mouseY >= 540 && mouseY <= 577)
  {
    avanzarDiapositiva();
  }

  int buttonWidth = 100;
  int buttonHeight = 40;
  int buttonX1 = 30; // Coordenada X del botón 1
  int buttonX2 = width - buttonWidth - 30; // Coordenada X del botón 2
  int buttonY = height - buttonHeight - 30; // Coordenada Y de ambos botones

  // Botón de Opción 1 de Rama 1
  if ( (diapos[2] || option3Diapos[2]) && mouseX >= buttonX1 && mouseX <= buttonX1 + buttonWidth && mouseY >= buttonY && mouseY <= buttonY + buttonHeight) {

    if (diapos[2]) {
      diapos[2] = false;
      diapos[3] = true;
    }

    if (option3Diapos[2]) {
      option3Diapos[2] = false;
      option3Diapos[3] = true;
    }
  }

  // Botón de Opción 2 de Rama 1
  if ((diapos[2] || option3Diapos[2]) && mouseX >= buttonX2 && mouseX <= buttonX2 + buttonWidth && mouseY >= buttonY && mouseY <= buttonY + buttonHeight) {

    if (diapos[2]) {
      diapos[2] = false;
      option3Diapos[0] = true;
    }

    if (option3Diapos[2]) {
      option3Diapos[2] = false;
      option3_3Diapos[0] = true;
    }
  }

  //BOTON DE REINICIO 
  if ((credits) && go && mouseX >= 518 && mouseX <= 564 && mouseY >= 522 && mouseY <= 599) {
    go = false;
    credits = false;
  }
}

void drawNextButton() {
  // Estilos del botón
  rectMode(CENTER);
  stroke(255);
  strokeWeight(2);
  fill(0);

  // Dimensiones del botón
  float buttonWidth = 100;
  float buttonHeight = 40;

  // Posición del botón (parte inferior centrada)
  float buttonX = width / 2;
  float buttonY = height - buttonHeight / 2 - 30; // 30 es el espacio desde el borde inferior

  // Dibujar el botón de avanzar diapositiva
  rect(buttonX, buttonY, buttonWidth, buttonHeight);
  textAlign(CENTER, CENTER);
  textSize(18);
  fill(255);
  text("Avanzar", buttonX, buttonY);
}

void drawOptionalButtons() {
  // Obtener las dimensiones de los botones
  int buttonWidth = 100;
  int buttonHeight = 40;

  // Calcular las coordenadas para los botones
  int buttonX1 = 100; // Coordenada X del botón 1 (esquina izquierda)
  int buttonX2 = width - buttonWidth - 10; // Coordenada X del botón 2 (esquina derecha)
  int buttonY = height - buttonHeight - 30; // Coordenada Y de ambos botones (esquina inferior)

  // Dibujar el botón de Opción 1
  fill(255);
  stroke(0);
  rect(buttonX1, buttonY, buttonWidth, buttonHeight);
  fill(0);
  textSize(16);
  textAlign(CENTER, CENTER);
  text("Opción 1", buttonX1, buttonY, buttonWidth, buttonHeight);

  // Dibujar el botón de Opción 2
  fill(255);
  stroke(0);
  rect(buttonX2, buttonY, buttonWidth, buttonHeight);
  fill(0);
  textSize(16);
  textAlign(CENTER, CENTER);
  text("Opción 2", buttonX2, buttonY, buttonWidth, buttonHeight);
}
