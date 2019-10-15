class People {
  SoundFile people;
  int lipYIncrement; //Variable to adjust Y positioning of lips when scaling
  int lipXIncrement; // Variable to adjust X positioning of lips when scaling
  int mouthWidth; 
  int mouthHeight;
  int speed; //Adjust speed at which mouth moves
  boolean shrinkOrGrow; //Grows or shrinks the mouth size
  int maxMinMouthHeight; //Sets the minimum and max mouth height
  
  People(PApplet p) {
    people = new SoundFile(p, "People (2)(5).wav");
    this.lipYIncrement = 320;
    this.lipXIncrement = 160;
    this.mouthWidth = 35;
    this.mouthHeight = 15;
    this.speed = 0;
    this.shrinkOrGrow = true;
    this.maxMinMouthHeight = 20;
  }
  
  void play() {
    people.amp(1);
    people.play(); 
  }
  
  //Displaying mouth
  void display() {
    pushMatrix();
    scale(5);
    int lipLeftX = 270; //Starting x position for left side of mouth
    int lipRightX = 330; //Starting x position for right side of mouth
    int lipY = 365; //Starting y position of mouth
    
    //Mouth
    noStroke();
    fill(255, 117, 67, 230);
    beginShape();
    curveVertex(lipLeftX - lipXIncrement, lipY - lipYIncrement);
    curveVertex(lipLeftX - lipXIncrement, lipY - lipYIncrement);
    curveVertex(300 - lipXIncrement, 350 - lipYIncrement);
    curveVertex(lipRightX - lipXIncrement, lipY - lipYIncrement);
    curveVertex(lipRightX - lipXIncrement, lipY - lipYIncrement);
    endShape();
  
    beginShape();
    curveVertex(lipLeftX - lipXIncrement, lipY - lipYIncrement);
    curveVertex(lipLeftX - lipXIncrement, lipY - lipYIncrement);
    curveVertex(300 - lipXIncrement, 390 - lipYIncrement);
    curveVertex(lipRightX - lipXIncrement, lipY - lipYIncrement);
    curveVertex(lipRightX - lipXIncrement, lipY - lipYIncrement);
    endShape();
    popMatrix();
  
  }
  
  //Makes the mouth move
  void lipMovement() {
    pushMatrix();
    scale(5);
    fill(0); 
    ellipse(300 - lipXIncrement, 370 - lipYIncrement, mouthWidth, mouthHeight); 
    
    //Makes mouth open and close repeatedly
    if (shrinkOrGrow) {
      if (mouthHeight <= maxMinMouthHeight) { //Mouth is open
        speed = 1; //Speed at which mouth grows
      } else {
        shrinkOrGrow = false; //Indicates if the mouth has grown at its largest size.
      }
    } else if (shrinkOrGrow == false) { //Mouth has grown to largest size
      if (mouthHeight >= 20) {
        speed = -1; //Speed at which mouth decreases in size
      } else {
        shrinkOrGrow = true; //Sets it so mouth is in position to grow again
        maxMinMouthHeight = 0; //Allows mouth to close fully instead of fluxuating between height 15-20 
      }
    }
    mouthHeight += speed;
    popMatrix();
  }
}
