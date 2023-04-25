class Item {
  //ITEM VISUALS//
  int x;
  int y;
  int z;
  int w;
  int h;
  color c;
  //HITBOX//
  int top;
  int bottom;
  int left;
  int right;
  //IS PICKED UP?//
  boolean isPickedUp;
  //ID//
  int iId;
  
  //CONSTRUCTOR//
  Item(int x1, int y1, int z1, int w1, int h1, color c1, int iId1){
    x = x1;
    y = y1;
    z = z1;
    w = w1;
    h = h1;
    c = c1;
    iId = iId1;
    
    //HITBOX//
    top = z - w;
    bottom = z;
    left = x;
    right = x + w; 
    
    isPickedUp = false;
  }
  
  void render(){
    //PLAYER VISUALS//
    pushMatrix();
    strokeWeight(5);
    stroke(0,0,0);
    fill(c);
    translate(x,y,z);
    box(w,h,w);
    popMatrix();
    //HITBOX UPDATE//
    top = z - w;
    bottom = z;
    left = x;
    right = x + w; 
  }
  
   void collision(Player aPlayer) {
    //COLLISION WITH PLAYER
    if (top <= aPlayer.bottom && bottom >= aPlayer.top && left <= aPlayer.right && right >= aPlayer.left) {
      p1.getItem = true;
      isPickedUp = true;
    }
    else{
      p1.getItem = false;
      isPickedUp = false;
    }
  }
  
  void itemPower(){
    //ITEM POWERUP TYPES
    if (iId == 1){
      p1.s = p1.s+5;
    }
    if (iId == 2){
      p1.h = p1.h*2;
    }
    if (iId == 3){
      bulletSpeed = bulletSpeed+5;
    }
    if (iId == 4){
      enemySpeed = enemySpeed+5;
    }
    if (iId == 5){
      p1.h = p1.h/2;
    }
  }
}
