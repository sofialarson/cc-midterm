class Boats {
 SoundFile boats;
 int xMove; //Speed at which the boat moves across the screen

  Boats(PApplet p){
    this.xMove = 0;
    boats = new SoundFile(p, "Boats35(4).wav");
  }
  
  void play(){
    boats.play();
  }
  
  void display() {
    fill(100);
    stroke(255);
    strokeWeight(2);
    beginShape();
    vertex(75 + xMove, 625);
    vertex(100 + xMove, 725);
    vertex(400 + xMove, 725);
    vertex(550 + xMove, 625);
    vertex(400 + xMove, 625);
    vertex(350 + xMove, 575);
    vertex(300 + xMove, 575);
    vertex(275 + xMove, 540);
    vertex(200 + xMove, 540);
    vertex(185 + xMove, 575);
    vertex(150 + xMove, 575);
    vertex(135 + xMove, 625);
    endShape(CLOSE);
  }
  
  void boatMove() {
    xMove += 5;
  } 
}
