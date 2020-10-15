void game() {
    theme.play();

  //visuals
  background (13, 49, 139); //blue!
  

  //pause button
  tactile(75, 75, 60);
  strokeWeight(3);
  fill(13, 49, 139);
  circle(75, 75, 60);
  strokeWeight(8);
  line(65, 60, 65, 90);
  line(85, 60, 85, 90);  
  textSize (30);

  //display target
  image (selectedufo, x, y, d*1.5, d); 
  stroke (255);
  fill(0);
  textSize(30);
  text("High Score: " + highscore, width/2, 50);
  text("Lives: " + lives, width/2, 100);
  text("Score: " + score, width/2, 150);
  

  if (score > highscore) {
    highscore = score;
  }
  

  
}

void gameClicks() {
  if (dist(mouseX, mouseY, x, y) < d) {
    score = score +1; 

    //acceleration due to clicks

    vx = vx * 1.2;
    vy = vy * 1.2;

    coin.rewind();
    coin.play();

    //Pause
  } else if (dist(mouseX, mouseY, 75, 75) < 30) {
    mode = PAUSE;
  } else {
    lives = lives - 1;
    if (lives == 0) mode = GAMEOVER;
    bump.rewind();
    bump.play();
  }
}


void tactile (int x, int y, int r) { 
  if (dist(x, y, mouseX, mouseY) < r) {
    stroke(255);
    fill(255);
  } else {
    stroke(0);
    fill(0);
  }
}
