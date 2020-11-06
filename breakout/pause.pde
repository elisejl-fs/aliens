void pause () {
  intro.pause();
  //GIF
  image (gif[f], 0, 0, width, height);
  f = f + 1;
  if ( f == numberOfFrames) f = 0;
  //PAUSED
  fill(255);
  textFont(sun);
    textSize(100);
  text("PAUSED", width/2, height/2);
  //click to continue
  textFont(sun);
    textSize(15);
  fill(255);
  text("click anywhere to resume", 700, 585);
}

void pauseClicks () {
  mode = GAME;
}
