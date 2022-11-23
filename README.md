# processing-works
homewowrk

24/11/2022
introduction:
A circle running on any continuous path, random color

float x, y;


void setup() {

size(700, 100);
x = 0;
background(0);
}


void draw() {
  
int a;
a=int(random(0,300));

int b;
b=int(random(0,300));

int c;
c=int(random(0,300));



x += 1;
y = noise(frameCount/100.0)*100;
noStroke();
ellipse(x, y, 10, 10);
fill(a,b,c);

}
