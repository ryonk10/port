/*@pjs preload="enemyzako.png";*/
PImage enemyzako;
void setup() {
  size(640, 640);
  background(0);
  enemyzako=loadImage("enemyzako.png");
  stroke(255);
  fill(150);
  strokeWeight(5);
}

void draw() {
}

void mouseClicked() {
  ellipse(mouseX, mouseY, 50, 50);
}
