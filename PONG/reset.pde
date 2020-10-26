void reset() {

  //score
  if (rightscore >0 || leftscore >0 ) {
    rightscore = leftscore = 0;
    timer = 100;
  }

  //paddles
  lefty = height/2;
  righty = height/2;
  //ball

  ballx = width/2;
  bally = height/2;
  vballx = random(-5, 5);
  vbally = random(-5, 5);
  timer = 100;
}
