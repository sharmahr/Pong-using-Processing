class Game{
  Ball ball;
  Tile tilep1,tilep2;
  int p1score = 0, p2score = 0; 

  Game(){
    ball = new Ball(40);
    tilep1 = new Tile(30,100,15,0);
    tilep2 = new Tile(30,100,width-15,0);
  }

  void calculate(){
    if(ball.position.x < (tilep1.tilewidth*1.5)){
    
      if((tilep1.position.y - (tilep1.tileheight/2)-(ball.size/2)) < ball.position.y && 
            ball.position.y < ((tilep1.position.y + (tilep1.tileheight/2) + ball.size/2))){
        p1score += 1;  

        ball.velocity.x = ball.velocity.x*(-1);
        ball.acceleration.x = ball.acceleration.x*(-1);

        ball.groove.trigger();
    
         }
    }
  
  if(ball.position.x> width-(tilep2.tilewidth*1.5)){
    
    if((tilep2.position.y - (tilep2.tileheight/2)-(ball.size/2)) < ball.position.y && 
          ball.position.y < ((tilep2.position.y + (tilep2.tileheight/2) + ball.size/2))){
        p2score += 1;   

        ball.velocity.x = ball.velocity.x*(-1);
        ball.acceleration.x = ball.acceleration.x*(-1);

        ball.groove.trigger();
    
         }
    }
  
 
  ball.move();
  tilep1.move(int(ball.position.y));
  tilep2.move(int(mouseY));

  }

  void display(){
    fill(0);
    //rect(width/2-3,height/2,6,height);
    fill(0,0,255);
    textSize(30);
    text("Player 2 : "+p2score,width-200,50);

    textSize(30);
    text("Player 1 : "+p1score,25,50);
    
    ball.display();
    tilep1.display();
    tilep2.display();
      if(ball.position.x > width - (ball.size/2) || ball.position.x < (ball.size/2)){

        background(255);
        textSize(40);
        fill(random(255),random(255),random(255));
        text("GAME OVER",width/2-100,height/2);
        noLoop();
       }

    }
}
