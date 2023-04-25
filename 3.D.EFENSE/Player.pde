class Player {
  //PLAYER VISUALS//
  int x;
  int y;
  int z;
  color c;
  int w;
  int h;
  int d;
  int s;  
  //HITBOX//
  int top;
  int bottom;
  int left;
  int right;
  //PLAYER IS HIT BY ENEMY//
  boolean youDead;
  //PLAYER PICKS UP ITEM//
  boolean getItem;
  
  //CONSTRUCTOR//
  Player(int x1, int y1, int z1, color c1, int w1, int h1, int d1, int s1){
    //PLAYER VISUALS//
    x = x1;
    y = y1;
    z = z1;
    c = c1;
    w = w1;
    h = h1;
    d = d1;
    s = s1;
    //HITBOX//
    top = z - w;
    bottom = z;
    left = x;
    right = x + w;
    //PLAYER IS HIT BY ENEMY//
    youDead = false;
    //PLAYER PICKS UP ITEM//
    getItem = false;
  }
  
  void render(){
    //PLAYER VISUALS//
    pushMatrix();
    strokeWeight(5);
    stroke(0,0,0);
    fill(c);
    translate(x,y,z);
    box(w,h,d);
    popMatrix();
    //HITBOX UPDATE//
    top = z - w;
    bottom = z;
    left = x;
    right = x + w;
  }
  
  void moveUp(){
    //MOVE UP subtract from z coord
    z = z - s;
  }
  void moveLeft(){
    //MOVE LEFT subtract from x coord
    x = x - s;
  }
  void moveDown(){
    //MOVE DOWN add to z coord
    z = z + s;
  }
  void moveRight(){
    //MOVE RIGHT add to x coord
    x = x + s;
  } 
  
  void hit(){
    //PLAYER HIT
      p1.h = p1.h - 100;
      if (enemyDeath.isPlaying() == false){
          enemyDeath.play();
        }
    }
}
