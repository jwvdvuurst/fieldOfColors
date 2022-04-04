
colorField cf;

void setup() {
  size(800,800);
  cf = new colorField(this, width, height, color(0,0,0));
}

void draw() {
  cf.draw();
  
  int x = round(random(width));
  int y = round(random(height));
  int w = round(random(140))+10;
  int h = round(random(140))+10;
  long c = color(random(255), random(255), random(255));
  
  square s = new square(x,y,w,h,c);
  cf.add(s);  
}
