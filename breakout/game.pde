void game () {
  background(0);
  intro.pause();
  //pause
  textFont(sun);
  textSize(15);
  fill(255);
  text("click anywhere to pause", 700, 585);

  //lives
  textFont(sun);
  textSize(20);
  fill(255);
  text("score:", 250, 15);
  text(score, 300, 15);
  text("lives:", 500, 15);
  text(lives, 550, 15);
  timer = timer - 1;

  if (by > height) {
    lives = lives - 1;
  }


  fill(255);
  textSize (80);
  // 3-2-1
  if (timer >= 67) {
    text("3", 200, 440);
  } else if (timer >= 34) {
    text("2", width/2, 440);
  } else if (timer >= 0) {
    text("1", 600, 440);
  }

  //paddle
  fill(blue);
  circle(px, py, pd);
  //keys
  if (leftkey == true) px = px - 6;
  if (rightkey == true) px = px + 6;

  //paddle limits
  if (px > width - pd/2) {
    px = width - pd/2;
  }
  if (px < 0 + pd/2) {
    px = 0 + pd/2;
  }

  //bounce off paddle
  if (dist(px, py, bx, by) <= pd/2 + bd/2 && timer<0) {
    vx = (bx - px)/10; 
    vy = (by - py)/10;
        beep.play();
beep.rewind();
  }

  //ball
  fill(210);
  stroke(0);
  circle(bx, by, bd);

  //scoring
  if (by > height-bd) {
    lives = lives - 1;
    bx = width/2;
    by = 540;
    px = width/2;
    //timer = 100;
  }
  //mvmt
  if (timer < 0) {
    bx = bx + vx;
    by = by + vy;
  }

  //limit ball mvmt
  if (by <= 0+bd/2 || by >= height-bd/2) {
    vy = vy * -1;
    boop.rewind();
    boop.play();
  }

  if (bx >= width-bd/2 || bx <= 0+bd/2) {
    vx = vx * -1;
    boop.rewind();
    boop.play();
  }

  //gameover
  if (lives < 1 || score == 36) {
    mode = GAMEOVER;
  }


  //bricks ---------------------------------------------------

  int i = 0;
  while (i < n) {
    if (alive[i] == true) {
      manageBrick(i);
    }
    i++;
  }
}

void gameClicks () {
  mode = PAUSE;
}

void manageBrick (int i) {
  if (y[i] == 100) fill(red);
  if (y[i] == 175) fill(orange);
  if (y[i] == 250) fill(yellow);
  if (y[i] == 325) fill(green);
  circle(x[i], y[i], brickd);
  if (dist(bx, by, x[i], y[i]) < bd/2 + brickd/2) { //brick collisions
    vx = (bx - x[i])/10;
    vy = (by - y[i])/10;
    alive[i] = false;
    score= score + 1;
    broken.rewind();
    broken.play();
  }
}
