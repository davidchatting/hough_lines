//Adaptation of Olly Oechsle's Hough Transform algorithm - http://vase.essex.ac.uk/software/HoughTransform/
//David Chatting - 4th March 2013
//david@davidchatting.com
//---

import java.awt.image.BufferedImage; 
import java.util.Vector; 
import java.awt.Color;

PImage inputImage;

void setup() {
  inputImage=loadImage("vase.png");
  size(inputImage.width, inputImage.height);
}

void draw() {
  image(inputImage, 0, 0);

  //As the image is static we don't really need to do this on every frame...
  HoughTransform h=new HoughTransform(inputImage);
  Vector<HoughLine> lines=h.getLines(4);  //get the top scoring 4 lines

  drawHoughLines(lines);
}

void drawHoughLines(Vector<HoughLine> lines) {
  if (lines!=null) {
    stroke(255, 0, 0);

    for (int j = 0; j < lines.size(); j++) { 
      HoughLine l = lines.elementAt(j);
      line(l.x1, l.y1, l.x2, l.y2);
      //println(j+ " " + l.score);
    }
  }
}

