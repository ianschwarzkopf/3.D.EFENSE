class Button {
  int x;
  int y;
  int size;
  color c;
  color otherC;
  color realC;
  
  String text;
  PFont font;
  int textSize;
  
  boolean changeButtonColor;
  
  Button(int x1, int y1, int size1, color c1, color otherC1, color realC1, String text1, PFont font1, int textSize1){
    x = x1;
    y = y1;
    size = size1;
    c = c1;
    otherC = otherC1;
    realC = realC1;
    
    text = text1;
    textSize = textSize1;
    font = font1;
    
    changeButtonColor = false;
  }
  //draws the button
  void render(){
    fill(c);
    stroke(c);
    rect(x, y, size*3, size, 50);
    textFont(font);
    textAlign(CENTER, CENTER);
    textSize(textSize);
    fill(color(0,0,0));
    text(text, x, y-10, size*3, size);
  }
  //checks if the mouse is pressed and the mouse is in the button area, returns true or false
  boolean isPressed(){
    if(mousePressed == true && isInButton() == true){
      return true;
    }
    else {
      return false; 
    }
  }
  //a simple boolean function to return true or false if a number is in between two numbers
  boolean isBetween(int num, int min, int max){
    if(num >= min && num <= max){
      return true;
    }
    else{
      return false;
    }
  }
  //checks to see if the mouse is in between the button's area and returns true or false
  boolean isInButton(){
    int left = x;
    int right = x + size*3;
    int top = y;
    int bottom = y + size;
    if(isBetween(mouseX, left, right) == true && isBetween(mouseY, top, bottom) == true){
      return true; 
    }
    else{
      return false; 
    }
  }
  void inButtonColor(){
    if(isInButton() == true){
      changeButtonColor = true;
    }
    else{
      changeButtonColor = false; 
    }
  }
  void colorChange(){
    if(changeButtonColor == true){
        c = otherC;
      }
      else{
        c = realC;
      }
  }
}
