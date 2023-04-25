class Bullet {
  //BULLET VISUALS//
  int x;
  int y;
  int z;
  color c;
  int r;
  int s;
  //ROTATION//
  float rotate;
  float rotate2;
  int id = 2;
  //OUT OF BOUNDS//
  boolean isOut;
  //KILL ENEMY//
  boolean isDead;
  //HITBOX//
  int top;
  int bottom;
  int left;
  int right;
  
  //CONSTRUCTOR//
  Bullet(int x1, int y1, int z1, color c1, int r1, int s1, float rotate1, float rotate3, int id1){
    //BULLET VISUALS//
    x = x1;
    y = y1;
    z = z1;
    c = c1;
    r = r1;
    s = s1;
    //ROTATION//
    rotate = rotate1;
    rotate2 = rotate3;
    id = id1;
    //OUT OF BOUNDS//
    isOut = false;
    //KILL ENEMY//
    isDead = false;
    //HITBOX///
    top = z - r/2;
    bottom = z + r/2;
    left = x - r/2;
    right = x + r/2;
  }
  
  void render(){
    //BULLET VISUALS//
    pushMatrix();
    fill(c);
    translate(x,y,z);
    sphere(r);
    popMatrix();
    pushMatrix();
    fill(c);
    translate(x+rotate,y,z+rotate2);
    stroke(c);
    box(r*2-15);
    popMatrix();
    //HITBOX UPDATE//
    top = z - r/2;
    bottom = z + r/2;
    left = x - r/2;
    right = x + r/2;
  }
  
  void moveRight(){
    //MOVE RIGHT add to X coord
    x = x + s;
  }
  void moveLeft(){
    //MOVE LEFT subtract from X coord
    x = x - s;
  }
  void moveUp(){
    //MOVE UP subtract from z coord
    z = z - s;
  }
  void moveDown(){
    //MOVE DOWN add to z coord
    z = z + s;
  }
  
  void checkOut(){
    //CHECK IF LEFT BOUNDARY AREA
    if (x >= 2500){
      isOut = true; 
    }
    if (x <= -2000){
      isOut = true; 
    }
    if (z <= -2200){
      isOut = true; 
    }
    if (z >= 1000){
      isOut = true; 
    }
  }
  void collision(Enemy aEnemy) {
    //COLLISION WITH ENEMY
    if (top <= aEnemy.bottom && bottom >= aEnemy.top && left <= aEnemy.right && right >= aEnemy.left) {
      aEnemy.isDead = true;
    }
  }
}


  
