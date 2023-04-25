class Enemy {
  //ENEMY VISUALS//
  int x;
  int y;
  int z;
  int w;
  int h;
  int s;
  //ANIMATION
  Animation enemyAnimation;
  PImage[] enemyImages = new PImage[4];
  //ENEMY DIRECTION//
  int id = 2;
  //HITBOX//
  int top;
  int bottom;
  int left;
  int right;
  //IS THE ENEMY DEAD?//
  boolean isDead;
  //IS PLAYER HIT?//
  boolean playerHit;
  
  //CONSTRUCTOR//
  Enemy(int x1, int y1, int z1, int s1, int w1, int h1, int id1){
    //ENEMY VISUALS//
    x = x1;
    y = y1;
    z = z1;
    s = s1;
    w = w1;
    h = h1;
    
    imageMode(CORNER);
    rectMode(CORNER);
    //ENEMY DIRECTION//
    id = id1;
    //HITBOX//
    top = z;
    bottom = z;
    left = x;
    right = x + w;
    //IS THE ENEMY DEAD?//
    isDead = false;
    //IS PLAYER HIT?//
    playerHit = false;
    
    //ANIMATION SETUP//
    for (int index=0; index<4; index++){
      enemyImages[index] = loadImage("enemy" + index + ".png"); 
    }
    enemyAnimation = new Animation(enemyImages, .2, 6);
  }
  
  void render(){
    //ENEMY VISUALS//
    pushMatrix();
    //noFill();
    //rect(x,y,w,h);
    translate(0,0,z);
    enemyAnimation.display(x,y);
    enemyAnimation.isAnimating = true;
    popMatrix();
    //HITBOX UPDATE//
    top = z;
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
  
  void collision(Player aPlayer) {
    //COLLISION WITH PLAYER
    if (top <= aPlayer.bottom && bottom >= aPlayer.top && left <= aPlayer.right && right >= aPlayer.left) {
      playerHit = true;
      isDead = true;
    }
    else{
      playerHit = false;
      isDead = false;
    }
  }
  
}
