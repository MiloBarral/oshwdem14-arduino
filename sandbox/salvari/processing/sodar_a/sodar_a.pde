/*
Version: 0.1
This code was written by Grook.net
Please feel free to edit/add any thing to the code but email it back to us for sharing it 
www.grook.net
http://www.youtube.com/GROOKnet
https://www.facebook.com/GROOKnet
*/

import processing.serial.*;
Serial port;
//Serial port2;
String data = "";
String Radius = "";
String Theta = "";
int index = 0;
float distance = 0;
float angle = 0;
float pi = 22.0/7;

void setup() 
{
 
 size(1000,1000);
 background(255,255,255);
  ellipse(500,500,1000,1000);
 line(500,0,500,1000);
 line(0,500,1000,500);
 line(500,500,1000,0);
 line(500,500,0,0);

port = new Serial(this, Serial.list()[0] , 9600);
port.bufferUntil('.');
}

void draw()

{


}

void serialEvent(Serial port)
{
  data = port.readStringUntil('.');
  data = data.substring(0, data.length() - 1);  // pasamos del punto al final
  index = data.indexOf(",");                    // calculamos la posición de la coma
  Radius = data.substring(0, index);            // leemos el radio
  Theta = data.substring (index+1 , data.length()); // y el angulo
  

   translate(500,500); 
   point (0,0);
   
      distance = float(Radius) *3; 
      angle = float(Theta) /180 * pi; 
      fill(30,200,30);
      ellipse(distance * cos(angle) ,  -1 * distance * sin(angle) , 5,5);

 
}

