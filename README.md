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


11/28/2022
homework2

void setup()
{
  size(800,800);
  background(255,255,255);
}
void draw(){
  int i=((int)random(1,5));
  rect(random(0,800),random(0,800),random(10,800),random(10,800));
  stroke(0,0,0);
  strokeWeight(10);
  
  switch(i)
 {
    case 1: fill(0,0,255);
    break;
    case 2: fill(255,0,0);
    break;
    case 3: fill(255,255,0);
    break;
    case 4: fill(255,255,255);
    break;
   
  }   
  frameRate(24);
  saveFrame();

}
