import controlP5.*;

PFont font;
ControlP5 cp5;

Textarea myTextarea;
void setup() {
   size(640, 640);
   cp5 = new ControlP5(this);

   myTextarea = cp5.addTextarea("txt")
     .setPosition(10, 10)
     .setSize(600, 600)
     .setFont(createFont("rubbish.ttf", 32))
     .setLineHeight(36)
     .setColor(color(0, 0, 0))
     .setColorBackground(color(255, 255, 255))
     .setColorForeground(color(255, 255, 255));
}

void draw() {
   background(255);
}

void keyPressed() {
    if(key=='\n'|| key=='\r'){
        myTextarea.append("\n");
    }
    else if(key == 8|| key == 127){
        String curText = myTextarea.getText();
        myTextarea.setText(curText.substring(0,max(0,curText.length()-1)));
    }
    if((key>='a'&&key<='z')||(key>='0'&&key<='9')||(key>='A'&&key<='Z')||(key==32)||(key>=39&&key<=46)){
    myTextarea.append(str(key));}
}
