import processing.sound.*;

// Audio
SoundFile audioRoger;

// Images
PImage imageRoger;

// Character
Fox fox = new Fox();

// Ambient
Hujan[] hujan = new Hujan[100];

// Scene
menu Menu = new menu();
Taman taman = new Taman(fox, hujan);
Danau danau = new Danau(fox, hujan);

void setup() {
  size(1280, 720, P3D);
  smooth();
  textMode(SHAPE);
  
  for (int i = 0; i < 100; i++) {
    hujan[i] = new Hujan(int(random(0, width)),
      int(random(0, height)),
      int(random(6, 10)));
  }
  
  fox.posX = width / 2;
  fox.posY = height / 2;
  
  // Audio initialization
  audioRoger = new SoundFile(this, "./audio/roger.mp3");
  audioRoger.amp(0.5);
  taman.audioRoger = audioRoger;
  
  // Image initializaion
  imageRoger = loadImage("./images/roger.jpg");
  taman.imageRoger = imageRoger;
}

void draw() {
  //danau.begin();
  taman.begin();
  fox.control();
  fox.display();

  fill(0);
  text( "x: " + mouseX + " y: " + mouseY, mouseX, mouseY);
  textSize(20);
}
