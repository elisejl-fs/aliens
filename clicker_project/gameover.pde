void gameover() {
  background(0);
  theme.pause();
  gameover.play();

  //your planet was invaded :(
  if (mouseX > 200 && mouseX < 600 && mouseY > 475 && mouseY < 550) {
    fill (13, 49, 139);
  } else {
    fill(255);
  }
  textSize(30);
  text ("your planet was invaded :(", 400, 500); 
  //click here to start over
  textSize (15);
  text ("[click here to start over]", 400, 530);
  strokeWeight(2);
  textSize(100);
  fill(203, 37, 59);
  text("GAME OVER", 400, 200);


  //exit
  if (dist(650, 700, mouseX, mouseY) < 40) {
    fill(13, 49, 139);
  } else {
    fill (255);
  }
  textSize (30);
  text ("exit", 650, 695);
  textSize(12);
  text ("[click here]", 650, 720);

//highscore
  if (score > highscore) {
    highscore = score;
  }
  if (lives == 0) {
    lives = lives + 3;
  }
     textSize (40);
    text("High Score: " + highscore, width/2, 100);
}

void gameoverClicks() {
  mode = INTRO; 
  theme.rewind();

  //FIGURE OUT reset & exit function (quit)
  reset();
  if (dist(650, 700, mouseX, mouseY) < 40) {
    exit();
  } else {
    mode = INTRO;
  }
}
