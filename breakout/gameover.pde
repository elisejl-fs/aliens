void gameover () {
  
  //GIF
  image (gif[f], 0, 0, width, height);
  f = f + 1;
  if ( f == numberOfFrames) f = 0;

  fill (yellow);
  textSize(100);
  textFont(sun);
  if (score == 36) {
    text("you win", width/2, height/2);
    win.play();

  } else if (lives < 1) {
    text("you lose", width/2, height/2);
    fail.play();

  }

  //textFont();
  fill(255);
  textSize (35);
  text("click anywhere to play again", width/2, 400);
}

void gameoverClicks () {
  reset();
  mode = INTRO;
}
