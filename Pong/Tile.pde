class Tile{
  PVector position;
  int tilewidth;
  int tileheight;
  
  Tile(int tilewidth,int tileheight, int posX, int posY){
      this.tilewidth = tilewidth;
      this.tileheight = tileheight;
      position = new PVector(posX,posY);
  }

  void move(int y){
      position.y=y;
  }

  void display(){
      noStroke();
      fill(0);
      rectMode(CENTER);
      rect(position.x,position.y,tilewidth,tileheight);
  }
}
