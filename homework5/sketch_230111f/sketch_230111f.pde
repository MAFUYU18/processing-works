Shape[] shapes = new Shape[0];

void setup() {
  size(900, 900);
  rectMode(CENTER);
  int c = 8;
  float w = width / c;
  for (int i = 0; i < c; i++) {
    for (int j = 0; j < c; j++) {
      float x = i * w + w / 2;
      float y = j * w + w / 2;
      shapes = (Shape[])append(shapes, new Shape(x, y, w * (int)(random(2) + 1)));
      if (random(1) < 0.5) shapes = (Shape[])append(shapes, new Shape(x, y, w * (int)(random(2) + 1)));
      if (random(1) < 0.5) shapes = (Shape[])append(shapes, new Shape(x, y, w * (int)(random(2) + 1)));
    }
  }
  //shuffle(shapes, true);
  translate(width / 2, height / 2);
  scale(0.75f);
  translate(-width / 2, -height / 2);
  background(255);
  for (Shape i : shapes) {
    randomShape(i.x, i.y, i.w);
  }
}

void draw() {

}

void randomShape(float x, float y, float w) {
  int rnd = (int)(random(5));
  push();
  translate(x, y);
  scale(pom(), 1);
  rotate((int)(random(4)) * (TAU / 4));
  noFill();
  stroke(0);
  if (rnd == 0) {
    rect(0, 0, w, w);
  } else if (rnd == 1) {
    arc(0, w / 2, w, w, 0, PI);
  } else if (rnd == 2) {
    ellipse(w / 4, w / 4, w / 2, w / 2);
    fill(0);
    ellipse(w / 4, w / 4, width * 0.01, width * 0.01);
  } else if (rnd == 3) {
    line(w / 2, w / 2, -w / 2, -w / 2);
  } else if (rnd == 4) {
    fill(0);
    ellipse(w / 2, w / 2, width * 0.01, width * 0.01);
  }
  pop();
}

float pom() {
  return random(1) < 0.5 ? -1 : 1;
}

class Shape {
  float x;
  float y;
  float w;

  Shape(float x, float y, float w) {
    this.x = x;
    this.y = y;
    this.w = w;
  }
}
