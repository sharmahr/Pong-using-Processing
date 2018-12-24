import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


Minim minim = new Minim(this);

class Ball {
  PVector position;
  PVector velocity;
  PVector acceleration;
  AudioSample groove;
  float size = 0;

Ball(float size){
  this.size = size;
 
  groove = minim.loadSample("boing.wav");
  position = new PVector(200,500);
  velocity = new PVector(2,2);
  acceleration = new PVector(0.001,0.001);
  }

void move(){
  if(position.x>(width-(size/2))|| position.x<(size/2) ){
    
  velocity.x = velocity.x*(-1);
  acceleration.x = acceleration.x*(-1);
  this.groove.trigger();
  }
  
  if(position.y>(height-(size/2)) || position.y<(size/2) ){
   
  velocity.y = velocity.y*(-1);
  acceleration.y = acceleration.y*(-1);
  this.groove.trigger();
  }
  
  position = position.add(velocity);
  velocity = velocity.add(acceleration);
}

void resetVelocity(){
  velocity.x=2;
  velocity.y=2;
}

void addAcceleration(float x,float y){
  acceleration = new PVector(x,y);
}

void display(){
 noStroke();
 fill(0);
 ellipse(position.x,position.y,size,size);
}
}
