//pong
//elise wong
//1-1A
//oct 15, 2020

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//sound variables
Minim minim;
AudioPlayer intro, wall, clapping,score, rightpaddle, leftpaddle;


int mode;
final int INTRO =1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

//entity variables
float leftx, lefty, leftd, rightx, righty, rightd; //paddles
float ballx, bally, balld; //ball
float vballx, vbally;
boolean AI;

//scoring
int leftscore, rightscore, timer;

//keyboard variables
boolean wkey, skey, upkey, downkey;

//colours
color lilac = #EBE5FB;
color pea = #F2F26F;
color mulberry = #AB3E5B;
color lagoon = #1693A7;

//custom font
PFont title;
PFont instructions;
PFont mc2;


void setup() {
  size(800, 600);
  mode = INTRO;
  
  //font
  title = createFont("minecrafter.ttf", 100);
  instructions = createFont("unbutton.ttf", 100);
  mc2 = createFont("minecraftory.ttf", 50);

  //intialize paddles
  leftx = 0;
  lefty = height/2;
  leftd = 200;
  rightx = width;
  righty = height/2;
  rightd = 200;

  //initialize ball
  ballx = width/2;
  bally = height/2;
  balld = 100;
  vballx = random(-5, 5);
  vbally = random(-5, 5);

  //initialize score
  rightscore = leftscore = 0;
  timer = 100;

  //intialize keyboard vars
  wkey = skey = upkey = downkey = false;
  
  //minim
  minim = new Minim(this);
 intro = minim.loadFile("intro.wav");
 clapping = minim.loadFile("clapping.wav");
  wall = minim.loadFile("wall.wav");
 score = minim.loadFile("score.wav");
 rightpaddle = minim.loadFile("rightpaddle.wav");
  leftpaddle = minim.loadFile("leftpaddle.wav");
}




void draw () {

  background(0);
  strokeWeight(3);

  //switch between game modes
  if (mode == INTRO) {  
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode error: " + mode);
  }
}
