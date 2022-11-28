
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
