//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                              //
//    ///////       ///    //     //   //   //////            ///////       ///    ////      ////   ////////    //
//      //         /////   ////   //   //  //    //          //            /////   // //    // //   //          //
//      //        //  //   // //  //       ////             //            //  //   //  //  //  //   //////      //
//      //       ///////   //  // //          ////          //    ///    ///////   //   ////   //   //          //
//      //      //    //   //   ////      //     //         //     //   //    //   //    //    //   //          //
//    //////   //     //   //    ///       ///////           ///////   //     //   //    //    //   ////////    //
//                                                                                                              //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////
//Player Declarations//
///////////////////////
Player p1;
boolean isMovingUp;
boolean isMovingDown;
boolean isMovingRight;
boolean isMovingLeft;
int killCount;

//////////////////////////
//Healthbar Declarations//
//////////////////////////
Healthbar bar;

///////////////////////
//Button Declarations//
///////////////////////
Button b1;
Button b2;
Button b3;
Button b4;
color buttonColor;

//////////////////////////
//ArrayList Declarations//
//////////////////////////
ArrayList<Bullet> bullets;
ArrayList<Enemy> enemies;
ArrayList<Item> items;

//////////////////////
//Image Declarations//
//////////////////////
PImage floor;
PImage scene1;
PImage scene2;
PImage scene3;
PImage scene4;
PImage scene0;

//////////////////////////
//Scene Declarations//
//////////////////////////
int sceneStartTime;
int sceneInterval;
int sceneEndTime;

//////////////////////
//Enemy Declarations//
//////////////////////
int enemyStartTime;
int enemyEndTime;
int enemyInterval;
int enemySpeed;
int levelStartTime;
int levelEndTime;

//////////////////////
//Sound Declarations//
//////////////////////
import processing.sound.*;
SoundFile enemyDeath;
SoundFile gunshot;
SoundFile background;
SoundFile pickUp;

//////////////////////
//State Declarations//
//////////////////////
int state = 0;

/////////////////////
//Item Declarations//
/////////////////////
int itemStartTime;
int itemEndTime;
int itemInterval;

/////////////////////
//Font Declarations//
/////////////////////
PFont lettersii;

/////////////////////////
//Variable Declarations//
/////////////////////////
int bulletSpeed;
color itemColor;

void setup(){
  //CANVAS SETUP//
  size(1280,720,P3D); 

  //FONT SETUP//
  lettersii = createFont("font.ttf", 128);
  
  //IMAGE SETUP//
  floor = loadImage("floor.png");
  scene1 = loadImage("scene1.png");
  scene2 = loadImage("scene2.png");
  scene3 = loadImage("scene3.png");
  scene4 = loadImage("scene4.png");
  scene0 = loadImage("scene0.png");

  //CLASS SETUP//
  p1 = new Player(0,800,-100,color(0,255,0),100,200,100,50);
  bullets = new ArrayList<Bullet>();
  enemies = new ArrayList<Enemy>();
  items = new ArrayList<Item>();
  bar = new Healthbar(1300,height-200,-1400,50,400,color(0,0,0),color(0,255,0),p1.h*2);
    //BUTTONS//
    b1 = new Button(950, 100, 75, color(0,255,0), color(0,150,0), color(0,255,0), "PLAY", lettersii, 60);
    b2 = new Button(950, 250, 75, color(255,255,255), color(150,150,150), color(255,255,255), "STORY", lettersii, 60);
    b3 = new Button(950, 400, 75, color(0,0,255), color(0,0,150), color(0,0,255), "EDIT", lettersii, 60);
    b4 = new Button(950, 550, 75, color(255,0,0), color(150,0,0), color(255,0,0), "EXIT", lettersii, 60);
  
  //TIMER SETUP//
  enemyStartTime = millis();
  enemyInterval = 3000;
  itemStartTime = millis();
  itemInterval = 3000;
  sceneStartTime = millis();
  sceneInterval = 4000;
  
  //SOUND SETUP//
  enemyDeath = new SoundFile(this, "enemyDeath.wav");
  gunshot = new SoundFile(this, "gunshot.wav");
  background = new SoundFile(this, "background.wav");
  pickUp = new SoundFile(this, "pickUp.wav");
  background.amp(.1);
  gunshot.amp(.05);
  enemyDeath.amp(.03);
  pickUp.amp(.03);
  
  //ENEMY SETUP//
  enemySpeed = 15;
  killCount = 0;
  
  //VARIABLE SETUP//
  bulletSpeed = 40;
  itemColor = color(255,0,0);
  
}

void draw(){
  
  switch(state){
    //////////////
    //STATE 0   //
    //CUTSCENE 1//
    //////////////
    case 0:     //
      ////////////
      
      //SCENE TIMER//
      sceneEndTime = millis();
      
      //MUSIC PLAY//
      if (background.isPlaying() == false){
        background.play();
      }
      
      //CUTSCENE IMAGES//
      imageMode(CORNER);
      image(scene1, 0, 0, width, height);
      if (sceneEndTime - sceneStartTime >= sceneInterval){
        image(scene2, 0, 0, width, height);
      }
      if (sceneEndTime - sceneStartTime >= sceneInterval*2){
        state = 1;
      }
      
      break;
    //////////////
    //STATE 1   //
    //START MENU//
    //////////////
    case 1:     //
      ////////////
      background(color(0,0,0));
      
      //VARIABLE RESETS//
      killCount = 0;
      p1.h = 200;
      enemyInterval = 3000;
      enemySpeed = 15;
      bulletSpeed = 40;
      p1.s = 50;
      //
      
      //CAMERA SETTINGS//
      camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
      
      //MUSIC PLAY//
      if (background.isPlaying() == false){
        background.play();
      }
      
      //BACKGROUND IMAGE//
      image(scene0, 0, 0, width, height);
      
      //TITLE TEXT//
      textAlign(CENTER);
      fill(color(0,255,0));
      textSize(150);
      text("3.D.EFENSE", 470, 185);
      
      //MOUSE CURSOR//
      pushMatrix();
      strokeWeight(1);
      stroke(255,0,0);
      noFill();
      line(mouseX-25, mouseY, mouseX+25, mouseY);
      line(mouseX, mouseY+25, mouseX, mouseY-25);
      circle(mouseX, mouseY, 50);
      
      //MOUSE PRESSED GUNSHOT SOUND//
      if(mousePressed == true){
        gunshot.play(); 
        noStroke();
        fill(150,150,100);
        circle(mouseX, mouseY, 60);
      }
      popMatrix();
      
      //Button 1//
      b1.render();
      b1.inButtonColor();
      b1.colorChange();
      if(b1.isPressed() == true){
        state = 2;
        levelEndTime = millis();
       }
       
      //Button 2//
      b2.render();
      b2.inButtonColor();
      b2.colorChange();
      if(b2.isPressed() == true){
        state = 0;
        sceneStartTime = millis();
        levelEndTime = millis();
       }
       
      //Button 4//
      b4.render();
      b4.inButtonColor();
      b4.colorChange();
      if(b4.isPressed() == true){
        exit();
       }
      
      break;
    /////////////
    //STATE 2  //
    //MAIN GAME//
    /////////////
    case 2:    //
      ///////////
      background(0);
      
      //FLOOR IMAGE//
      pushMatrix();
      fill(150,250,255);
      rotateX(PI/2);
      translate(0,0,-1200);
      imageMode(CORNER);
      image(floor,-515,-1550,2300,2200);
      popMatrix();
  
      //3D BOX BOUNDARY//
      beginShape();
      noFill();
      translate(width/2,height/2,-300);
      box(width*2-500, width, width*2-500);
      endShape();
          
      //CAMERA SETTINGS//
      camera(width/2.0, -height, (height/2.0) / tan(PI*30.0 / 180.0), 
      width/2.0, height/2.0, 0, 0, 1, 0);
      
      //MUSIC PLAY//
      if (background.isPlaying() == false){
        background.play();
      }
      
      //KILLCOUNT DISPLAY//
      textSize(200);
      text("Kills:" + " " + killCount, -300, height, -1350);
      
      //HEALTH BAR//
      bar.render();
      bar.health = p1.h*2;
      
      //TIMER DISPLAY//
      levelStartTime = millis() - levelEndTime;
      textSize(500);
      text(levelStartTime/1000, 630, height, -1350);
      
      //PLAYER RENDER AND MOVE//
      p1.render();
      move();
      //////////////////////////
      
      //END TIMERS//////////////
      enemyEndTime = millis();
      itemEndTime = millis();
      //////////////////////////
      
      //LEVEL TIMER/////////////////////////////////
      if (levelStartTime/1000 >= 30){
        enemyInterval = 2000;
      }
      if (levelStartTime/1000 >= 60){
        enemyInterval = 1000;
      }
      if (levelStartTime/1000 >= 90){
        enemyInterval = 500;
      }
      if (levelStartTime/1000 >= 120){
        enemyInterval = 250;
      }
      if (levelStartTime/1000 >= 150){
        enemyInterval = 0;
      }
      //////////////////////////////////////////////
      
      //ITEM COLOR AND SPAWN//
      if(itemEndTime-itemStartTime >= itemInterval){
        int randomId = int(random(1,6));
        if (randomId == 1){
          itemColor = color(0,255,0);
        }
        if (randomId == 2){
          itemColor = color(0,255,0);
        }
        if (randomId == 3){
          itemColor = color(0,255,0);
        }
        if (randomId == 4){
          itemColor = color(255,0,0);
        }
        if (randomId == 5){
          itemColor = color(255,0,0);
        }
        items.add(new Item(int(random(-200,1500)),1100,int(random(-1000,600)),25,25,itemColor,randomId));
        itemStartTime = millis();
      }
      
      //ITEM RENDER AND COLLISION//
      for (Item i1 : items){
        println(i1.iId);
        i1.render();
        i1.collision(p1);
      }

      //TIME INTERVAL CHANGE ENEMY DIRECTION//
      if(enemyEndTime-enemyStartTime >= enemyInterval){
        int dirId = 1;
        dirId = int(random(1,5));
        if (dirId == 1){
          enemies.add(new Enemy(int(random(-515,1385)),800,1500,enemySpeed,400,600,dirId));
        }
        if (dirId == 2){
          enemies.add(new Enemy(int(random(-515,1385)),800,-2500,enemySpeed,400,600,dirId));
        }
        if (dirId == 3){
          enemies.add(new Enemy(-1500,800,int(random(-1300,600)),enemySpeed,400,600,dirId));
        }
        if (dirId == 4){
          enemies.add(new Enemy(2500,800,int(random(-1300,600)),enemySpeed,400,600,dirId));
        }
        enemyStartTime = millis();
      }
  
      //ENEMY RENDER AND MOVE AND COLLISION//
      for (Enemy aEnemy : enemies){
        aEnemy.collision(p1);
        if(aEnemy.id == 1){
          aEnemy.render();
          aEnemy.moveUp();
        }
        if(aEnemy.id == 2){
          aEnemy.render();
          aEnemy.moveDown();
        }
        if(aEnemy.id == 3){
          aEnemy.render();
          aEnemy.moveRight();
        }
        if(aEnemy.id == 4){
          aEnemy.render();
          aEnemy.moveLeft();
        }
      }
  
      //BULLET RENDER AND MOVE AND COLLISION//
      for (Bullet aBullet : bullets){
        for (Enemy aEnemy : enemies){
          aBullet.collision(aEnemy);
        }
        if (aBullet.id == 1){
          aBullet.render();
          aBullet.moveUp();
        }
        if (aBullet.id == 2){
          aBullet.render();
          aBullet.moveDown();
        }
        if (aBullet.id == 3){
          aBullet.render();
          aBullet.moveRight();
        }
        if (aBullet.id == 4){
          aBullet.render();
          aBullet.moveLeft();
        } 
        aBullet.checkOut();
      }
      
      //ENEMY REMOVE LOOP//
      for (int i = enemies.size()-1; i >= 0; i -= 1){
        Enemy aEnemy = enemies.get(i);
        if (aEnemy.playerHit == true){
          p1.hit();
        }   
        if (aEnemy.isDead == true){
          enemies.remove(aEnemy);
          enemyDeath.play();
          killCount = killCount + 1;
        }  
      }
      
      //UNWANTED BULLET LOOP//
      for (int i = bullets.size()-1; i >= 0; i -= 1){
        Bullet aBullet = bullets.get(i);
    
        if (aBullet.isOut == true){
          bullets.remove(aBullet);
        }
      }
      
      //YOU WIN//
      if (killCount >= 100){
        state = 4; 
      }
      
      //REMOVE ITEM LOOP//
      for (int i = items.size()-1; i >= 0; i -= 1){
        Item i1 = items.get(i);
        if (i1.isPickedUp == true){
          items.remove(i1);
          i1.itemPower();
          pickUp.play();
        }  
        if (p1.h <= 0){
          items.remove(i);
        }
        if (killCount >= 100){
          items.remove(i);
        }
      }
      
      //YOU DIE//
      if (p1.h <= 0){
        state = 3;
        p1.h = 200;
        enemyInterval = 5000;
      }

      break;
    /////////////
    //STATE 3  //
    //LOSE     //
    /////////////
    case 3:    //
      ///////////
      background(color(0,0,0));
      
      //VARIABLE RESETS//
      killCount = 0;
      p1.h = 200;
      enemyInterval = 3000;
      enemySpeed = 15;
      bulletSpeed = 40;
      p1.s = 50;
      //
      
      //CAMERA SETTINGS//
      camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
      
      //MUSIC PLAY//
      if (background.isPlaying() == false){
        background.play();
      }
      
      //BACKGROUND IMAGE//
      image(scene3, 0, 0, width, height);
      
      //YOU DIED TEXT//
      textAlign(CENTER);
      fill(color(255,0,0));
      textSize(100);
      text("YOU DIED", 1000, height/2+50);
      
      //MOUSE CURSOR//
      pushMatrix();
      strokeWeight(1);
      stroke(255,0,0);
      noFill();
      line(mouseX-25, mouseY, mouseX+25, mouseY);
      line(mouseX, mouseY+25, mouseX, mouseY-25);
      circle(mouseX, mouseY, 50);
      
      //MOUSE PRESSED GUNSHOT SOUND//
      if(mousePressed == true){
        gunshot.play();
        noStroke();
        fill(150,150,100);
        circle(mouseX, mouseY, 60);
      }
      popMatrix();
      
      //Button 1//
      b1.render();
      b1.inButtonColor();
      b1.colorChange();
      if(b1.isPressed() == true){
        state = 2;
        levelEndTime = millis();
       }
       
      //Button 4//
      b4.render();
      b4.inButtonColor();
      b4.colorChange();
      if(b4.isPressed() == true){
        exit();
      }
       
      break;
    /////////////
    //STATE 4  //
    //WIN      //
    /////////////
    case 4:    //
      ///////////
      background(color(0,0,0));
      
      //VARIABLE RESETS//
      killCount = 0;
      p1.h = 200;
      enemyInterval = 3000;
      enemySpeed = 15;
      bulletSpeed = 40;
      p1.s = 50;
      //
      
      //CAMERA SETTINGS//
      camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
      
      //MUSIC PLAY//
      if (background.isPlaying() == false){
        background.play();
      }
      
      //BACKGROUND IMAGE//
      image(scene4, 0, 0, width, height);
      
      //YOU WON TEXT//
      textAlign(CENTER);
      fill(color(0,255,0));
      textSize(100);
      text("YOU WON", 1000, height/2+50);
      
      //MOUSE CURSOR//
      pushMatrix();
      strokeWeight(1);
      stroke(255,0,0);
      noFill();
      line(mouseX-25, mouseY, mouseX+25, mouseY);
      line(mouseX, mouseY+25, mouseX, mouseY-25);
      circle(mouseX, mouseY, 50);
      
      //MOUSE PRESSED GUNSHOT SOUND//
      if(mousePressed == true){
        gunshot.play(); 
        noStroke();
        fill(150,150,100);
        circle(mouseX, mouseY, 60);
      }
      popMatrix();
      
      //Button 1 - PLAY//
      b1.render();
      b1.inButtonColor();
      b1.colorChange();
      if(b1.isPressed() == true){
        state = 2;
        levelEndTime = millis();
       }
       
      //Button 4 - EXIT//
      b4.render();
      b4.inButtonColor();
      b4.colorChange();
      if(b4.isPressed() == true){
        exit();
      }
       
      break;
  }
}
/*
MOVE FUNCTION FOR PLAYER
  - PLAYER BOUNDARY
  - MOVE PLAYER
*/
void move(){
  if (isMovingUp == true && p1.z > -1051){
    p1.moveUp();
  }
  if (isMovingDown == true && p1.z < 580){
    p1.moveDown();
  }
  if (isMovingRight == true && p1.x < 1500){
    p1.moveRight();
  }
  if (isMovingLeft == true && p1.x > -205){
    p1.moveLeft();
  }
}

/*
KEY PRESSED FUNCTION
  - PLAYER MOVEMENT
  - SHOOT GUN
*/
void keyPressed(){
  if (key == 'w') {
    isMovingUp = true;
  }
  if (key == 'a') {
    isMovingLeft = true;
  }
  if (key == 's') {
    isMovingDown = true;
  }
  if (key == 'd') {
    isMovingRight = true;
  }
  if (keyCode == UP){
    bullets.add(new Bullet(p1.x, p1.y, p1.z, color(25,25,25), 50, bulletSpeed, 0, 50, 1));
    gunshot.play();
    if (p1.z < 580){
      p1.z = p1.z + 100;
    }
  }
  if (keyCode == DOWN){
    bullets.add(new Bullet(p1.x, p1.y, p1.z, color(25,25,25), 50, bulletSpeed, 0, -50, 2));
    gunshot.play();
    if (p1.z > -1051){
      p1.z = p1.z - 100;
    }
  }
  if (keyCode == RIGHT){
    bullets.add(new Bullet(p1.x, p1.y, p1.z, color(25,25,25), 50, bulletSpeed, -50, 0, 3));
    gunshot.play();
    if (p1.x > -205){
      p1.x = p1.x - 100;
    }
  }
  if (keyCode == LEFT){
    bullets.add(new Bullet(p1.x, p1.y, p1.z, color(25,25,25), 50, bulletSpeed, 50, 0, 4));
    gunshot.play();
    if (p1.x < 1500){ 
      p1.x = p1.x + 100;
    }
  }
}

/*
KEY RELEASED FUNCTION
  - PLAYER MOVEMENT
*/
void keyReleased(){
  if (key == 'w') {
    isMovingUp = false;
  }
  if (key == 'a') {
    isMovingLeft = false;
  }
  if (key == 's') {
    isMovingDown = false;
  }
  if (key == 'd') {
    isMovingRight = false;
  }
}
