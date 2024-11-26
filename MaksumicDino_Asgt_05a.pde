/*
* Creates a small representation of the solar system using 3D objects and angle rotations
* 
* @author Dino Maksumic
* @version 1.0 10/27/2025 
*/ 

float earth = 0;
float moon = 0;
float mars = 0;
float jupiter = 0;
PVector[] stars = new PVector[200]; // Array for star positions

void setup() {
  size(800, 800, P3D);
  
  //Create random stars
  for (int i = 0; i < stars.length; i++) {
    float x = random(width);
    float y = random(height);
    float z = random(-500, 500);
    stars[i] = new PVector(x, y, z);
  }
}

void draw() {
  background(0);
  lights();

  //Create stars
  fill(255);
  noStroke();
  for (PVector star : stars) {
    pushMatrix();
    translate(star.x, star.y, star.z);
    sphere(1); //Creating a small sphere to represent stars since pixels cant work
    popMatrix();
  }

  //Draw Sun
  pushMatrix();
  fill(255, 204, 0);
  translate(width/2, height/2);
  noStroke();
  sphere(50);
  popMatrix();

  //Earth
  pushMatrix();
  translate(width/2, height/2);
  rotateY(earth);
  translate(150, 0);
  fill(0, 102, 255); // add color to earth
  noStroke(); // remove wireframe
  sphere(20);
  text("Earth", -10, -25);
  popMatrix();

  //The Moon
  pushMatrix();
  translate(width/2, height/2);
  rotateY(earth);
  translate(150, 0);
  rotateY(moon);
  translate(30, 0);
  fill(200); // Grey moon
  noStroke();
  sphere(8);
  text("Moon", -10, -10);
  popMatrix();

  //Mars
  pushMatrix();
  translate(width/2, height/2);
  rotateY(mars);
  translate(200, 0);
  fill(255, 102, 102); // Color of mars
  noStroke();
  sphere(15);
  text("Mars", -10, -20);
  popMatrix();

  //Jupiter
  pushMatrix();
  translate(width/2, height/2);
  rotateY(jupiter);
  translate(250, 0);
  fill(204, 153, 102); // brownish color of jupiter
  noStroke();
  sphere(30);
  text("Jupiter", -15, -25);
  popMatrix();

  //Update angles
  earth += 0.01;
  moon += 0.03;
  mars += 0.007;
  jupiter += 0.005;
}
