import controlP5.*;

ControlP5 cp5;
boolean isEraser = false;
void setup() {
  size(800,800);

  cp5 = new ControlP5(this);

  cp5.addSlider("red")
     .setPosition(20, 20)
     .setRange(0, 255);

  cp5.addSlider("green")
     .setPosition(20, 50)
     .setRange(0, 255);

  cp5.addSlider("blue")
     .setPosition(20, 80)
     .setRange(0, 255);
  cp5.addSlider("thick")
     .setPosition(20, 110)
     .setRange(0, 50);

  cp5.addButton("clear")
     .setPosition(20, 130)
     .setSize(50, 20);
   cp5.addButton("eraser")
     .setPosition(80, 130)
     .setSize(50, 20);
   background(255);
}

void draw() {
  
}
void mouseDragged()
{
  if(mouseButton==RIGHT){
  int r = (int) cp5.getController("red").getValue();
  int g = (int) cp5.getController("green").getValue();
  int b = (int) cp5.getController("blue").getValue();
  if(!isEraser)
  {
  stroke(r, g, b);
  ellipse(mouseX,mouseY,(int) cp5.getController("thick").getValue(),(int) cp5.getController("thick").getValue());
  fill(r,g,b);
  }
  else
  {
   stroke(255, 255, 255);
  ellipse(mouseX,mouseY,(int) cp5.getController("thick").getValue(),(int) cp5.getController("thick").getValue());
  fill(255,255,255);
  }
  }
}
void clear() {
  background(255);
}
void eraser(){
  isEraser=!isEraser;
}
