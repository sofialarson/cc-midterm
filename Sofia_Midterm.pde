import processing.sound.*;

//Arrays for the classes 
Waves[] waves = new Waves[1];
Clinking[] clinking = new Clinking[1];
Boats[] boats = new Boats[1];
People[] people = new People[1];

boolean sPressed = false;
boolean aPressed = false;
boolean wPressed = false;
boolean dPressed = false;
int talkingFrameCount = 0; //Counts the number of frames the people talking animation is up for
int wineGlassFrameCount = 0; //Counts the number of frames the clinking noise from the wine glass animation is up for
int wineWaterOpacity = 0; //The opacity of the rectangle that draws on the water when a wine drop is added
int centerX; //Center of x-axis of frame
int centerY; //Center of y-axis of frame
int oneThirdX; //Third of x-axis of frame
int oneThirdY; //Third of y-axis of frame

void setup() {
  size(1400, 900);
  centerX = width / 2;
  centerY = height / 2;
  oneThirdX = width / 3;
  oneThirdY = height / 3;
  rectMode(CENTER);
  ellipseMode(CENTER);
  strokeWeight(10);
}

void draw() {
  background(255, 245, 209);
  
  //Rays of the sun
  noStroke();
  fill(255, 182, 121, 75);
  triangle(centerX, 0, 0, 0, 0, oneThirdY);
  triangle(centerX, 0, 0, 2 * oneThirdY, 0, height);
  triangle(centerX, 0, oneThirdX, height, 2 * oneThirdX, height);
  triangle(centerX, 0, width, height, width, 2 * oneThirdY);
  triangle(centerX, 0, width, oneThirdY, width, 0);

  //The sun itself
  noStroke();
  fill(255, 211, 49);
  ellipse(centerX, 50, 1000, 1000);


  //Activates the animation of the water
  if (sPressed) {
    waves[0].waterdropDisplay();
    waves[0].waterdropFall();
    waves[0].splash();
    waves[0].waterFill();
    if (waves[0].startSparkle == true) { 
      waves[0].waterSparkles();
    }
  }

  //Activates the animation of the wine glass
  if (aPressed) {
    if (wineGlassFrameCount <= 120) {
      clinking[0].rotateWineGlass();
      clinking[0].wineSpill();
      clinking[0].wineDropFall();
      wineGlassFrameCount += 1;
    }
    if (waves[0] != null) { //Makes the wine glass animation occur even if the water animation is not present 
      noStroke();
      fill(232, 73, 33, 50 + wineWaterOpacity); 
      if (waves[0].increasedWater >= centerY) {
        rect( centerX, height, width, centerY);
      }
    }
  }

  //Activates the animation of the boat
  if (wPressed) {
    boats[0].display();
    boats[0].boatMove();
  }
  
  //Activates the animation of the mouth movement
  if (dPressed) {
    if (talkingFrameCount <= 300) {
      people[0].display();  
      people[0].lipMovement();
      talkingFrameCount += 1;
    }
  }
}


void keyPressed() {
  //Adding to an existing array, helps animations stay on screen after a single key press
  
  if (key == 's') {
    sPressed = true;
    waves[0] = new Waves(this);
    waves[0].play();
    wineWaterOpacity = 0;
  }
  if (key == 'a') {
    aPressed = true;
    clinking[0] = new Clinking(this);
    clinking[0].play();
    wineWaterOpacity += 30;
    wineGlassFrameCount = 0;
  }
  if (key == 'w') {
    wPressed = true;
    boats[0] = new Boats(this);
    boats[0].play();
  }
  if (key == 'd') {
    dPressed = true;
    people[0] = new People(this);
    people[0].play();
    talkingFrameCount = 0;
  }
}
