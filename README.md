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

introduction:Mondrian style, random color blocks

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

homework3

introduction:picture

class Agent {

  //Local Variables
  PVector pos;
  PVector speed;
  float rad;
  int pixID;
  float bright;
  boolean alive;
  float agentDist;
  float offset;
  PVector diff;
  PVector center;
  color col;

  //Constructor
  Agent(PVector _pos, float _rad) {
    rad = _rad;
    pos = _pos; //new PVector(random(0+rad, width-rad), random(0+rad, height-rad));
    speed = new PVector(random(-1, 1), random(-1, 1));
    alive = true;
    col = color(255);
  }

  //Subfunctions
  void run() {
    if (alive) {
      move();
      bounce();
      //asBrightasBig();
      checkOther();
      asBrightasBig();
    }
    //asBrightasBig();
    display();
  }

  void move() {
    pos.add(speed);
  }

  void bounce() {
    if (pos.x < rad || pos.x > width-rad) {
      speed.x *= -1;
    }
    if (pos.y < rad || pos.y > height-rad) {
      speed.y *= -1;
    }
  }

  void asBrightasBig() {
    pixID = floor(pos.x) + floor(pos.y) * width;
    if (pixID >= 0 && pixID < width * height) {
      bright = brightness(color(img.pixels[pixID]));
      rad = 2 * (9 * bright /255);
      //col = color(255);
    }
  }

  void checkOther() {
    for (int i = 0; i < agentList.size(); i ++) {
      Agent other = (Agent)agentList.get(i);
      agentDist = dist(pos.x, pos.y, other.pos.x, other.pos.y);
      offset = 2+(rad + other.rad)/2;
      if (agentDist != 0) {
        if (agentDist == offset) {
          speed.set(0, 0);
          other.speed.set(0, 0);
          alive = false;
        }
        else if(agentDist < offset){
          diff = PVector.sub(pos, other.pos);
          center = PVector.add(pos, other.pos);//center
          center.div(2);
          diff.normalize();
          pos = PVector.add(center, PVector.mult(diff, offset/2));
          speed.set(0, 0);
          other.speed.set(0, 0);
          if(agentDist < offset - 1 ){
          col = color(230);
          }
        }
        else{
          col = color(255);
        }
      }
    }
    //  else {
    //  speed.x *= -1;
    //  speed.y *= -1;
    //}
  }


  void display() {
    noStroke();
    if (rad > 1) {
      fill(0, 20);
      ellipse(pos.x, pos.y, rad+7, rad+7);
      fill(0, 50);
      ellipse(pos.x, pos.y, rad+3, rad+3);
      fill(col);
      ellipse(pos.x, pos.y, rad, rad);
    }
  }
}



import processing.svg.*;

//Global Variables

PImage img;
int maxAgents;
ArrayList agentList;

boolean saveSVG = false;

float rad;

//Initialize
void setup(){
  size(600,818);
  img = loadImage("OIP-C.jpg");
  img.resize(width, height);
  
  maxAgents = 100000;
  agentList = new ArrayList();
  rad = 5;
}

//Update
void draw(){
  background(255);
  //image(img, 0, 0);
  
  if(agentList.size() < maxAgents){
    //Agent myAgent = new Agent(new PVector(random(0+rad, width-rad), random(0+rad, height-rad)), rad);
    Agent myAgent = new Agent(new PVector(random(width/2-30, width/2+30), random(height/2-30, height/2+30)), rad);
    agentList.add(myAgent);
  }
  
  if (saveSVG) {
    beginRecord(SVG, "output/circlePark.svg");
  }
  
  for(int i = 0; i < agentList.size(); i ++){
    Agent tempAgent = (Agent)agentList.get(i);
    tempAgent.run();
  }
  
  if (saveSVG) {
    endRecord();
    saveSVG = false;
  }
}

void keyPressed() {
  if (key == 's') {
    save("output/HodginCirclePark.png");
  }
  if(key == 'p'){
    saveSVG = true;
    frameRate(100000);
  }
}


