class Healthbar {
  int x;
  int y;
  int z;
  int w;
  int h;
  color c1;
  color c2;
  int health;
  
  Healthbar(int x1, int y1, int z1, int w1, int h1, color c4, color c3, int health1){
    x = x1;
    y = y1;
    z = z1;
    w = w1;
    h = h1;
    c1 = c4;
    c2 = c3;
    health = health1;
  }
  
  void render(){
    //RENDER HEALTHBAR
    pushMatrix();
    translate(0,0,z);  
    strokeWeight(2);
    stroke(c1);
    fill(c2);
    rect(x,y,w,health);
    popMatrix();
  }
  
}
