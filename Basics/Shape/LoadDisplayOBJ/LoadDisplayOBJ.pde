/**
 * Load and Display an OBJ Shape. 
 * 
 * The loadShape() command is used to read simple SVG (Scalable Vector Graphics)
 * files and OBJ (Object) files into a Processing sketch. This example loads an
 * OBJ file of a rocket and displays it to the screen. 
 */


/**
 * Load and Display an OBJ Shape with animated stars background. 
 */

PShape rocket;
float ry;

// Twinkling star properties
int[] starX = new int[1000];
int[] starY = new int[1000];
color[] starColor = new color[1000];
int starSize = 3;

// Shooting star properties
int[] shootX = new int[30];
int[] shootY = new int[30];
int METEOR_SIZE = 10;
float meteorSize = METEOR_SIZE;
float ssDeltaX, ssDeltaY;
int ssTimer = -1;
int startX, startY;

public void setup() {
  size(640, 640, P3D);
  rocket = loadShape("rocket.obj");
  
  // Initialize star locations
  for (int i = 0; i < starX.length; i++) {
    starX[i] = (int)random(width);
    starY[i] = (int)random(height);

  }
}

public void draw() {
  background(0, 0, 50); // Dark blue night sky
  lights();
  
  drawTwinklingStars();
  drawShootingStars();
  drawRocket();
  updateShootingStars();
}

void drawTwinklingStars() {
  stroke(0);
  strokeWeight(1);
  for (int i = 0; i < starX.length; i++) {
    // Makes stars twinkle
    if (random(10) < 1) {
      starColor[i] = (int)random(100,255);
    }
    fill(starColor[i]);
    ellipse(starX[i], starY[i], starSize, starSize);
  }
}

void drawShootingStars() {
  for (int i = 0; i < shootX.length-1; i++) {
    int shooterSize = max(0, int(meteorSize * i/shootX.length));
    if (shooterSize > 0) {
      strokeWeight(shooterSize);
      stroke(255);
    } else {
      noStroke();
    }
    line(shootX[i], shootY[i], shootX[i+1], shootY[i+1]);
  }
}

void drawRocket() {
  pushMatrix();
  translate(width/2, height/2);
  rotateZ(PI);
  rotateY(ry);
  shape(rocket);
  popMatrix();
  
  ry += 0.02;
}

void updateShootingStars() {
  meteorSize *= 0.9;
  
  // Move shooting star along path
  for (int i = 0; i < shootX.length-1; i++) {
    shootX[i] = shootX[i+1];
    shootY[i] = shootY[i+1];
  }
  
  if (ssTimer >= 0 && ssTimer < shootX.length) {
    shootX[shootX.length-1] = int(startX + ssDeltaX*(ssTimer));
    shootY[shootY.length-1] = int(startY + ssDeltaY*(ssTimer));
    ssTimer++;
    if (ssTimer >= shootX.length) {
      ssTimer = -1;
    }
  }

  // Randomly create new shooting stars
  if (random(5) < 1 && ssTimer == -1) {
    newShootingStar();
  }
}

void newShootingStar() {
  int endX, endY;
  startX = (int)random(width);
  startY = (int)random(height);
  endX = (int)random(width);
  endY = (int)random(height);
  
  ssDeltaX = (endX - startX)/(float)(shootX.length);
  ssDeltaY = (endY - startY)/(float)(shootY.length);
  ssTimer = 0;
  meteorSize = METEOR_SIZE;
  
  // Initialize shooting star position
  for (int i = 0; i < shootX.length; i++) {
    shootX[i] = startX;
    shootY[i] = startY;
  }
}
