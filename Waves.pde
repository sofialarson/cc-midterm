class Waves {
  SoundFile waves;

  int speed; //Speed at which water drop falls
  int dropStartYPos; //Y Positions for the water drop
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
  int centerX; //Center of frame (X-Axis)
  int centerY; //Center of frame (Y-Axis)
  int increasedWater; //Height of increasing water 
  int splashY; //Y Position of water droplet splash
  boolean startSparkle; //Boolean that indicates when the water should sarkle

  Waves(PApplet p) {
    this.increasedWater = 0;
    this.speed = 10;
    this.dropStartYPos = 300;
    this.dropYPos2 = 400;
    this.dropYPos3 = 430;
    this.dropYPos4 = 450;
    this.dropYPos5 = 460;
    this.dropYPos6 = 475;
    this.dropYPos7 = 480;
    this.dropYPos8 = 490;
    this.dropYPos9 = 510;
    this.dropYPos10 = 530;
    this.dropYPos11 = 540;
    this.centerX = width / 2;
    this.centerY = height / 2;
    this.splashY = 0;
    this.startSparkle = false;
    waves = new SoundFile(p, "waves.wav");
  }

  void play() {
  waves.amp(0.5);
  waves.loop();
  }

  void waterdropDisplay() {
    fill(4, 196, 211);
    noStroke();

    //Waterdrop
    beginShape();
    vertex(centerX, dropStartYPos);
    vertex(650, dropYPos2);
    vertex(640, dropYPos3);
    vertex(635, dropYPos4);
    vertex(635, dropYPos5);
    vertex(638, dropYPos6);
    vertex(640, dropYPos7);
    vertex(645, dropYPos8);
    vertex(655, dropYPos9);
    vertex(670, dropYPos10);
    vertex(690, dropYPos11);
    
    vertex(710, dropYPos11);
    vertex(730, dropYPos10);
    vertex(745, dropYPos9);
    vertex(755, dropYPos8);
    vertex(760, dropYPos7);
    vertex(762, dropYPos6);
    vertex(765, dropYPos5);
    vertex(765, dropYPos4);
    vertex(760, dropYPos3);
    vertex(750, dropYPos2);
    vertex(centerX, dropStartYPos);
    endShape();
  }

  //Water drop falling
  void waterdropFall() {
    dropStartYPos += speed;
    dropYPos2 += speed;
    dropYPos3 += speed;
    dropYPos4 += speed;
    dropYPos5 += speed;
    dropYPos6 += speed;
    dropYPos7 += speed;
    dropYPos8 += speed;
    dropYPos9 += speed;
    dropYPos10 += speed;
    dropYPos11 += speed;
  }
  
  //Splash of the water droplet into the water
  void splash() {
    if(increasedWater < centerY && dropStartYPos >= height) {
      pushMatrix();
      splashDisappear();
      translate(centerX, height);
      int degreeDifference = 45; //Different angles for each ellipse calculated using this variable
      float angle = -45;
      for (int i = 0; i < 3; i++) {
        angle += (degreeDifference * i);
        rotate(radians(angle));
        ellipse(0, splashY, 100, 400);
      }
      popMatrix(); 
    }
  }
  
  //Moves splash effect offscreen
  void splashDisappear() {
    splashY += 5;
  }
  
  //Water filling the screen
  void waterFill() {
      fill(4, 196, 211);
      rect(centerX, height, width, increasedWater); 
      if(increasedWater <= centerY && dropStartYPos >= centerY) {
         increasedWater += 3;
      } if (increasedWater >= centerY) {
        startSparkle = true;
      }
    }
 
    
  //Sparkles for the water  
  void waterSparkles() {
      stroke(255); 
      strokeWeight(2);
      for (int i = 0; i < 15; i++) { 
        if (i >= 8) { //Changes colors of some of the sparkles
          stroke(129, 237, 255);  
        }
        float randomX = random(width);
        float randomY = random((height * 3) / 4, height);
        line(randomX - 4, randomY, randomX + 4, randomY);
        line(randomX, randomY - 4, randomX, randomY + 4);
      }
 
  }
    


}
