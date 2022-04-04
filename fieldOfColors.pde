
colorField cf;

void setup() {
  size(800,800);
  cf = new colorField(this, width, height, color(0,0,0));
}

void draw() {
  cf.draw();
}
