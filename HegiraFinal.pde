import ddf.minim.spi.*; //<>//
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim; // initalizing Minim
FFT fft; // initializing the fft 
AudioPlayer menuMusic; //
AudioPlayer gameMusic;
AudioPlayer drum;


PImage[] img = new PImage[17]; // 
PImage [] img2 = new PImage[14];
PImage [] img3 = new PImage[8];
int state = 0;
int imgIndex = 0; // character animation
int textIndex = 0; // flipping the text in the dialouge
int spaceIndex = 0; // every time you press the spacebar 
int fireIndex = 2; // burning house animaation
int menuA = millis(); // millis timer for the menu animation
int storyA = millis(); // millis timer for the story animation

float p2, n; 
float hue = 20;
float bright = 60;
float alpha = 0;
float alpha2 = 0;
boolean click = true;
boolean start = false;
boolean introText = true;
boolean highScore = false;
boolean options = false;
boolean mute = true;
boolean newGame = false;
//String[] highs; // highscore
float m;
int y = 0; // the suns start position

// game setup //

ArrayList<platform> plats = new ArrayList<platform>(2);
ArrayList<Bats> bats = new ArrayList<Bats>(2); 
int nextY;

PVector pos;
player p = new player(200, 400, 6, 0);
boolean run = true;
boolean jump = false;
int TotalBats = 2;
int TotalPlats = 1;
float darkness = 0;
int time = millis();
int timeFire = millis();
int batTime = millis();
int playerIndex = 0;
int jumpIndex = 0;
int fireTrap = 0;
int batIndex = 0;
PImage Texture;
PImage towerImg;
PImage powerUp;
PImage[] fire = new PImage[14]; // fire animatiion 
PImage[] bat = new PImage[8]; // bat animation 
PImage[] imgPlayer = new PImage[9]; // the payer runner animation
PImage[] imgJump = new PImage[14]; // the player jumping animation

int current; // Highscre
int[] high = new int[6]; // array to save the highscore
String filename = "highscore.txt";
boolean HighScore;


void setup() {

  size(1280, 720, P3D); // setting the size full screen on the divice you're on
  colorMode(HSB, 360, 100, 100); // setting the colorMode to HSB and matting the Hue to 360, saturation to 100 and brightness to 100
  noStroke();
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER);

  Texture = loadImage("textflat.jpg"); // loading the textures
  towerImg = loadImage("data2/smallPlatform.png"); // loading the small platforms
  minim = new Minim(this);
  menuMusic = minim.loadFile("menu_music.mp3"); // loading the audio files
  gameMusic = minim.loadFile("game_music.mp3");
  drum = minim.loadFile("intro_drum2.mp3");
  fft = new FFT(menuMusic.bufferSize(), menuMusic.sampleRate()); // setting the fft
  fft.logAverages(8, 3); 

  for ( int i = 0; i < img.length; i ++) { // going through and loading my image array
    img[i] = loadImage("img_"+i+".png");
  }
  storySetup(); // calling the function with all the image loops for the story


  /* ----------- Game  ----------------*/


  for ( int i = 0; i < imgPlayer.length; i ++) {  // player image array (running)
    imgPlayer[i] = loadImage("data2/img_"+i+".png");
  }

  for ( int i = 0; i < imgJump.length; i ++) { // player image array (running)
    imgJump[i] = loadImage("data2/img2_"+i+".png");
  }

  for ( int i = 0; i < fire.length; i ++) { // fire image array
    fire[i] = loadImage("data2/fire/img_"+i+".png");
  }

  for ( int i = 0; i < bat.length; i ++) { // bat image array
    bat[i] = loadImage("data2/bats/img_"+i+".png");
  }
  
  powerUp = loadImage("data2/0.png");

  plats.add(new platform(400, 0));
  nextY = int(random(225, 575));

  if (nextY > 720)
  {
    nextY = int(random(500, 650));
  } else if (nextY < 200) {
    nextY = int(random(300, 500));
  }
  plats.add(new platform(nextY, 1));

  bats.add(new Bats(p.Pos.y, 1));
  bats.add(new Bats(p.Pos.y, 2));

  high = loadHighscore(); // loading the highscore
  high = bubbleSort(high); // make the highscore go through the bubble sort
  current = 0; // setting the highscore to 0
  HighScore = true; // setting the highscore boolean to true when the programs stars
}

void draw() {

  background(0); // calling a black background
  // println(mouseX, mouseY);
  fft.forward(menuMusic.mix); 

  /* ------------------ loops & fades ---------------- */

  switch( state ) {
  case 0 :

    imageMode(CENTER);
    if (millis() > menuA + 240) // make something happen every 240 millisecond
    {

      alpha +=10; // adding 10 to alpha 

      if ( alpha == 10) { 
        drum.play(); // playing the  drum audio
      }
      if (alpha == 360) { // when alpha reaches 360 then make start true and start to fade in the title screen

        start = true; //
        menuMusic.play(); // playing and looping the music for the menu
        menuMusic.loop(); // looping the menu music
      }

      imgIndex ++; // looping the character animation
      menuA = millis(); // returning time back to millis 

        if ( imgIndex == 3) { // when imgIndex reaches 3 start reapeating the character animation
        imgIndex = 0;
      }
    }

    /* --------------- Intro Text -------------------   */
    if (introText) {

      tint(360, alpha); 
      image(img[8], width/2, 400); // "can you survive the nigh" text
    }
    /* ------------------------- Title Screen ------------- */


    if (start) { // when the menu starts fading in

      introText = false; // removes the intro text
      alpha2 ++; // when start is true start fading in the title screen
      tint(360, alpha2); // fading in the title screen

      titelScreen(); // drawing the title scren on top of the image
    }

    if ( highScore) { // if highScore is true start displaying the highscore menu
      high(); // calling the function which will display everything in the highscore menu
    }

    break;

    /* ---------------------- New Game ------------------------*/
  case 1:

    StoryScreen(); // when new game is presses you go into the story screen state

    break;

    /* --------------------- Game --------------------------------- */

  case 2:

    if (HighScore) // if highscore is true
    {
      current ++; // add one to highscore for each frame
    }

    gameMusic.play(); // start playing the game music

    background(hue, 80, bright); // calling the new background for the game
    pushMatrix();
    translate(0, (p.Pos.y * -1)+ 400);
    mount(); // calling the mountains for the game
    rectMode(CORNER);
    rect(0, 700, width, 3000);
    popMatrix();

    pushMatrix();
    translate((p.Pos.x*-1)+200, (p.Pos.y*-1)+400);
    p.display(); // displaying and updating the player
    p.update();

    GameOverCheck();

    for (platform r : plats) {
      r.display(); // looping through the arraylist and displaying the platforms
    }

    collision(); // calling the collision function to detect all the collisions
    updatePlatforms(); // updating the platforms

      for (Bats b : bats)
    {
      b.display(); // displaying and updating the bats
      b.update();
    }

    BatCollsion(); // calling the function that detects the collision with the bat
    updateBats(); // updating the bat
    popMatrix();   
    dark();
    fill(360); // making the text white
    textSize(25);
    image(imgPlayer[8], 20, 10, 130, 50); // highscore image left corner
    text(current, 185, 44);// Showing the highscore 

    break;

  case 3 :

    GameOverScreen(); // show the game over screen when you go into state 3

    break;
  }
}

void mousePressed() {

  highscoreMenu(); // if you click on the higscore button  this function will run
  muteClick(); // calling the muteClick function when you click on the mute button in the corner
  if ( mouseX > 515 && mouseY > 525 && mouseX < 760 && mouseY < 575) {
    state = 1; // when you click new game button you go to state 1
  }
}

void keyPressed() {

  if (state == 1) {

    if (key == ' ') // if you're in state 1 and the space bar you will change the images in the dialoge boxes
    {
      spaceIndex ++;
      textIndex ++;
      if ( textIndex == 6) {
        state = 2; // when textIndex gets to 6 you move into the game which is state 2
        menuMusic.pause(); // stop playing the
      }
    }
    click = !click;
  }

  if (state == 2) {
    if (key == ' ')
    {
      p.jump(); // make the player jump when space is pressed in state 2
    }
  }
  if (state == 3) {
    if (key == 'r') { //
      restart();
    }
    if ( key == 'm') {
      state = 0;
      spaceIndex = 0;
      textIndex = 0;
      gameMusic.pause();
      menuMusic.play();
    }
  }
}

int[] loadHighscore()
{
  String[] highscoreString = new String[6];
  highscoreString = loadStrings("highscore.txt");
  for (int i=0; i<highscoreString.length; i++)
  {
    high[i] = int(highscoreString[i]);
  }
  return high;
}


int[] bubbleSort(int[] list)
{
  int n = list.length;
  boolean swapped= true;
  while (swapped)
  {
    swapped = false;
    for (int i=1; i<n; i++)
    {
      if (list[i-1] < list[i])
      {
        int temp = list[i-1];
        list[i-1]=list[i];
        list[i]=temp;
        swapped=true;
      }
    }
  }
  return list;
}

void saveHighScore() {

  String[] highscoreString = new String[6];

  for (int i=0; i<highscoreString.length; i++)
  {
    highscoreString[i] = str(high[i]);
  }

  saveStrings("data/highscore.txt", highscoreString);
}