//oct 6
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


//use command + k to search
//use command + t to help w errors (indents)
//first tab should be name of folder 
//error message may show up in diff tab


//target variables
float x, y, d; // target info
float vx, vy; // velocity
int score, lives, highscore;

//custom font
PFont spaceage;
PFont nasa;

//selected target
PImage selectedufo;
PImage ufo1;
PImage ufo2;
PImage ufo3;


//MODE VARIABLES
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER= 3;
final int OPTIONS = 4;

//sound variables
Minim minim;
AudioPlayer theme, coin, bump, gameover;



void setup() {
  size (800, 800);

  //font!
  spaceage = createFont("spaceage.ttf", 100);
  nasa = createFont("nasalization.ttf", 200);

  //imageMode(CENTER); to change orientation
  //imageMode (CORNER); to switch back to original coordinate fxn

  mode = INTRO;
  //changing the mode "switches between the tabs"
  textAlign(CENTER, CENTER);

  //ufo1
  ufo1 = loadImage("ufo1.png");

  //ufo2
  ufo2 = loadImage("ufo2.png");

  //ufo3
  ufo3 = loadImage("ufo3.png");

  selectedufo = ufo2;


  //initialize target
  x = width/2; //width of screen
  y = height/2; //height of screen
  d = 150;
  vx = random(-5, 5); //give range to randomize within (includes floats)
  vy = random(-5, 5);

  score = 0;
  lives = 3;


  //minim
  minim = new Minim(this);
  theme = minim.loadFile("mario bros theme.mp3");
  coin = minim.loadFile("coin.wav");
  bump = minim.loadFile("bump.wav");
  gameover = minim.loadFile("gameover.wav");
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == OPTIONS) {
    options();
  } else {
    println("Error: Mode = " + mode);
  }
  println(mode);


  //movement
  x = x + vx;
  y = y - vy;

  //bouncing
  if (x >= 595 || x <= 0)
  {  //>= is greater/equal
    //   || = "or"
    vx = vx * -1;
  }

  if (y >= 670 || y <= 0)
    ////subtract/add radius of circle to bounce on edge not centre point
  { //>= is greater/equal
    //   || = "or"
    vy = vy * -1;
  }
}
