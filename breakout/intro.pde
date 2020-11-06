 void intro () {
     intro.play();
     win.pause();
     fail.pause();
   //GIF BACKGROUND
  image (gif[f], 0, 0, width, height);
  f = f + 1;
  if ( f == numberOfFrames) f = 0;
  
  //TITLE
  fill(255);
  textAlign(CENTER, CENTER);
  textFont(sun);
  textSize(150);
  text("breakout", width/2, 250);
  
  //"start" tactile
  if (mouseX > 325 && mouseY > 380 && mouseX < 475 && mouseY < 440) {
    fill (yellow);
  } else {
    fill(255);
  }
  textFont(sun);
  textSize(50);
  text ("start", width/2, 400);


  
}

void introClicks () {
  
  if (mouseX > 325 && mouseY > 380 && mouseX < 475 && mouseY < 440) {
  mode = GAME;
    }
}
