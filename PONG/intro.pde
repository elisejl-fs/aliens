void intro() {
  background(0);
  intro.play();
  clapping.pause();

  //title
  textFont(title);
  textAlign(CENTER, CENTER);
  textSize(180);
  fill(lilac);
  text("P  NG", 485, 290);

  //pong ball in title
  fill (255);
  stroke (0);
  circle(ballx, bally, balld);
  timer = timer-1;

  if (timer < 0) {
    ballx = ballx + vballx;
    bally = bally - vbally;
  }

  if (bally >= height-balld/2 || bally <= 0+balld/2) {
    vbally = vbally * -1;
  }
  if (ballx >= width-balld/2 || ballx <= 0+balld/2) {
    vballx = vballx * -1;
  }
  //# players
  stroke(lilac);
  fill(0);
  //boxes
  rect (235, 470, 250, 100);
  rect (485, 470, 250, 100);

  //choose game mode
  textFont(mc2);
  fill (pea);
  textSize(20);
  text("-CHOOSE- \n GAME MODE", 100, 520);


  if (mouseX > 235 && mouseX < 485 && mouseY > 470 && mouseY < 570) {
    fill (pea);
  } else {
    fill (lilac);
  }
  textFont(mc2);
  textSize(30);
  text("one player", 360, 520);

  if (mouseX > 485 && mouseX< 735 && mouseY > 470 && mouseY < 570) {
    fill (pea);
  } else {
    fill (lilac);
  }
  text("two players", 610, 520);
}


void introClicks() {
  reset();

  //one player
  if (mouseX > 235 && mouseX< 485 && mouseY> 470 && mouseY< 570) {
    mode = GAME;
    intro.pause();
    intro.rewind();
    AI = true;
  }



  //two players
  if (mouseX > 485 && mouseX< 735 && mouseY> 470 && mouseY< 570) {
    mode = GAME;
    intro.pause();
    intro.rewind();
    AI = false;
  }
}
