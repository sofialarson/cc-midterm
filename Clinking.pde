class Clinking {
  SoundFile clinking;
  float rotationSpeed; //Speed at which the wine glass rotates
  int startFrame; //Number of frames at which the animation begins at
  int dropSpeed; //Speed at which the wine drop falls
  int dropStartYPos; //Drop Y Positions for when the wine drop moves down the screen
  int dropYPos2;
  int dropYPos3;
  int dropYPos4;
  int dropYPos5;
  int dropYPos6;
  int dropYPos7;
  int dropYPos8;
  int dropYPos9;
  int dropYPos10;
  int dropYPos11;
  float angleInDegrees;
  
  Clinking(PApplet p) {
    clinking = new SoundFile(p, "Clinking.wav");
    rotationSpeed = -2;
    this.dropSpeed = 40;
    this.dropStartYPos = 250;
    this.dropYPos2 = 350;
    this.dropYPos3 = 380;
    this.dropYPos4 = 400;
    this.dropYPos5 = 410;
    this.dropYPos6 = 425;
    this.dropYPos7 = 430;
    this.dropYPos8 = 440;
    this.dropYPos9 = 460;
    this.dropYPos10 = 480;
    this.dropYPos11 = 490;
    this.angleInDegrees = 0;
  }
  
  void play() {
    clinking.play();
    startFrame = frameCount;
  } 
  
  //Display the wine glass
  void display() {
    
    //Wine
    noFill();
    strokeWeight(5);
    noStroke();
    fill(232, 73, 33);
    beginShape();
    vertex(63, -120);
    vertex(-62, -120);
    vertex(-62, -50);
    vertex(-7, -5);
    vertex(7, -5);
    vertex(63, -50);
    endShape(CLOSE);
    
    //Wine glass top (left side)
    noFill();
    stroke(113, 113, 113, 150);
    beginShape();
    vertex(63, -150);
    vertex(-62, -150);
    vertex(-62, -50);
    //Stem of glass (left side)
    vertex(-7, -5);
    vertex(-7, 125);
    //Base of glass
    vertex(-47, 125);
    vertex(-67, 130);
    vertex(-67, 140);
    vertex(-47, 150);
    vertex(48, 150);
    vertex(68, 140);
    vertex(68, 130);
    vertex(48, 125);
    //Stem of glass (right side)
    vertex(7, 125);
    vertex(7, -5);
    //Wine glass top (right side)
    vertex(63, -50);
    endShape(CLOSE);
  } 
  
  //Rotates the wine glass
  void rotateWineGlass() {
    pushMatrix();
    translate(1212, 350);
    int framesElapsed = frameCount - startFrame;
    angleInDegrees = constrain(map(framesElapsed, 0, 60, 0, -75), -75, 0); 
    angleInDegrees = constrain(angleInDegrees, -75, 0);
    float angle = radians(angleInDegrees);
    rotate(angle);
    display();
    popMatrix();
  }
  
  //Displays wine drop
  void wineSpill() {
  if (angleInDegrees <= -75) { //When wine glass fully tilts over
    pushMatrix();
    fill(232, 73, 33);
    scale(0.25); 
    int xIncrement = 3400; //Variable to adjust for x positioning when scaling drop
    int yIncrement = 1300; //Variable to adjust for y positioning when scaling drop
    beginShape();
    vertex((width/2) + xIncrement, dropStartYPos + yIncrement);
    vertex(650 + xIncrement, dropYPos2 + yIncrement);
    vertex(640 + xIncrement, dropYPos3 + yIncrement);
    vertex(635 + xIncrement , dropYPos4 + yIncrement);
    vertex(635 + xIncrement, dropYPos5 + yIncrement);
    vertex(638 + xIncrement, dropYPos6 + yIncrement);
    vertex(640 + xIncrement, dropYPos7 + yIncrement);
    vertex(645 + xIncrement, dropYPos8 + yIncrement);
    vertex(655 + xIncrement, dropYPos9 + yIncrement);
    vertex(670 + xIncrement, dropYPos10 + yIncrement);
    vertex(690 + xIncrement, dropYPos11 + yIncrement);
    
    vertex(710 + xIncrement, dropYPos11 + yIncrement);
    vertex(730 + xIncrement, dropYPos10 + yIncrement);
    vertex(745 + xIncrement, dropYPos9 + yIncrement);
    vertex(755 + xIncrement, dropYPos8 + yIncrement);
    vertex(760 + xIncrement, dropYPos7 + yIncrement);
    vertex(762 + xIncrement, dropYPos6 + yIncrement);
    vertex(765 + xIncrement, dropYPos5 + yIncrement);
    vertex(765 + xIncrement, dropYPos4 + yIncrement);
    vertex(760 + xIncrement, dropYPos3 + yIncrement);
    vertex(750 + xIncrement, dropYPos2 + yIncrement);
    endShape(CLOSE);
    popMatrix();
  }
 }
  
  //Wine drop falling 
  void wineDropFall() {
    if (angleInDegrees <= -75) { //When wine glass fully tilts
      dropStartYPos += dropSpeed;
      dropYPos2 += dropSpeed;
      dropYPos3 += dropSpeed;
      dropYPos4 += dropSpeed;
      dropYPos5 += dropSpeed;
      dropYPos6 += dropSpeed;
      dropYPos7 += dropSpeed;
      dropYPos8 += dropSpeed;
      dropYPos9 += dropSpeed;
      dropYPos10 += dropSpeed;
      dropYPos11 += dropSpeed;
    }
  }
}
