void pause () {
  background  (100);
  theme.pause();

  //PAUSE button
  
  fill(100);

  if (dist(75, 75, mouseX, mouseY) < 60) {
    stroke(255);
  } else {
    stroke(0);
  }

  fill(0);
  textSize (100);
  text ("PAUSED GAME", 400, 400);
  //circle
  strokeWeight(3);
  fill(100);
  circle(75, 75, 60);
  //triangle
  strokeWeight(3);
  triangle (65, 60, 90, 75, 65, 90);
}


void pauseClicks() {
  if (dist(mouseX, mouseY, 75, 75) < 30) {
    mode = GAME;
  }
}
