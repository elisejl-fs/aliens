void game() {
  //centre line
  strokeWeight(5);
  stroke(255);
  line(width/2, 0, width/2, height);


  //scoreboard
  textSize(50);
  fill(lagoon);
  text(leftscore, width/4, 100);
  fill(mulberry);
  text(rightscore, 3*width/4, 100);
  //text(timer, 3*width/4, 550); //countdown
  timer = timer - 1;


  //paddles

  //left
  fill(lagoon);
  stroke(lagoon);
  circle(leftx, lefty, leftd);
  //controls
  if (wkey == true) lefty = lefty -6;
  if (skey == true) lefty = lefty + 6;

  //right
  fill(mulberry);
  stroke(mulberry);
  circle(rightx, righty, rightd);
  //controls
  if (AI == false) {
    if (upkey == true) righty = righty - 6;
    if (downkey == true) righty = righty +6;
  } else {
    /*
  if ball is on the right side  
     if ball is above the right paddle, move up
     if ball is below the right paddle, move down
     */

    if (ballx > 400) {
      if (bally > righty) {
        righty = righty + 6;
      } else {
        righty = righty - 6;
      }
    }
  }

  //ball
  fill (255);
  stroke (0);
  circle(ballx, bally, balld);

  //scoring
  if (ballx < -50) {
    //score.play();
    rightscore++; //"var = var+1;" can be written as "var++;"
    ballx = width/2;
    bally = height/2;
    timer = 100;
  }
  if (ballx > 850) {
    //score.play();
    leftscore++;
    ballx = width/2;
    bally = height/2;
    timer = 100;
  }


  //limit ball movement
  if (timer < 0) {
    ballx = ballx + vballx;
    bally = bally - vbally;
  }

  if (bally >= height-balld/2 || bally <= 0+balld/2) {
    vbally = vbally * -1;
    wall.play();
    wall.rewind();
  }

  //ball bouncing off paddles
  //  right
  if (dist(rightx, righty, ballx, bally) <= rightd/2 + balld/2) {
    vballx = (ballx - rightx)/10; //   "/#" decreases velocity
    vbally = (bally - righty)/10;
    rightpaddle.play();
    leftpaddle.rewind();
  }

  //left
  if (dist(leftx, lefty, ballx, bally) <= leftd/2 + balld/2) {
    vbally = (bally - lefty)/10;
    vballx = (ballx - leftx)/10;
    rightpaddle.rewind();
    leftpaddle.play();
  }

  //limiting paddle mvmt
  //left paddle
  if (lefty < 100) {
    lefty = 100;
  }
  if (lefty > 500) {
    lefty = 500;
  }

  //right paddle
  if (righty < 100) {
    righty = 100;
  }
  if (righty > 500) {
    righty = 500;
  }

  if (rightscore >= 3 || leftscore >=3) {
    mode = GAMEOVER;
  }

  //text
  fill(pea);
  textSize(20);
  textAlign(CENTER, CENTER);
  text("CLICK ANYWHERE TO PAUSE", 600, 550);
}

void gameClicks() {
  mode = PAUSE;
}
