//BREAKOUT
//Elise Wong
//1-1A
//nov 1, 2020

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//sound variables
Minim minim;
AudioPlayer intro, boop, beep, broken, fail, win; 

int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

//arrays
int[] x; 
int[] y;
boolean[] alive;
int brickd;
int n;
int tempx, tempy;


//entity variables
float px, py, pd;
float bx, by, bd; 
float vx, vy;

//fonts
PFont sun;

PImage[] gif;
int numberOfFrames;
int f;

//scoring
int score, lives, timer;

//keyboard variables
boolean rightkey, leftkey;

//colours
color red = #DF151A;
color orange = #FF6136;
color yellow = #F7DB15;
color green = #278524;
color blue = #3A89C9;



void setup () {
  brickd = 70; //----------------------------------------
  n = 36;
  x = new int[n];
  y = new int[n];
  alive = new boolean[n];
  tempx = 100;
  tempy = 100;

  int i = 0;
  while (i < n) {
    x[i] = tempx;
    y[i] = tempy;
    alive[i] = true;
    tempx = tempx + 75;
    if (tempx >= width-75) {
      tempx = 100;
      tempy = tempy + 75;
    }

    i++;
  }
  
  //fonts
  sun = createFont("sun.otf", 100);


  //------------------------------------------------------

  //initialize timer
  timer = 100;

    //general info
    size(800, 600);
    mode = INTRO;

    //initialize paddle
    px = width/2;
    py = height;
    pd = 100;


    //initialize ball
    bx = width/2;
    by = 540;
    bd = 20;
    vx = 5; //random(-5, 5);
    vy = 5; //random(-5, 5);

    //initialize score
    score = 0;
    lives = 3;

    //initialize keyboard vars
    leftkey = rightkey = false;

    //GIF
    numberOfFrames = 72;
    gif = new PImage [numberOfFrames];

    int t = 0;
    while (t < numberOfFrames) {
      gif[t] = loadImage("frame_"+t+"_delay-0.04s.gif");  
      t++;
    }
    
    //minim
    minim = new Minim(this);
    intro = minim.loadFile("intro.wav");
    boop = minim.loadFile("boop.wav");
    beep = minim.loadFile("beep.wav");
    broken = minim.loadFile("broken.wav");
    fail = minim.loadFile("fail.wav");
    win = minim.loadFile("win.wav");
  }



  void draw () {
    background(0);
    strokeWeight(3);

    if (mode == INTRO) {
      intro();
    } else if (mode == GAME) {
      game ();
    } else if (mode == PAUSE) {
      pause();
    } else if (mode == GAMEOVER) {
      gameover();
    } else { 
      println( "Mode error: " + mode);
    }
  }
