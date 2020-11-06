void reset() {
  //score
  if (score > 0 || lives < 3) {
    score = 0;
    lives = 3;
    timer = 100;
  }

  //paddle
  px = width/2;
  

  //ball
  bx = width/2;
  by = 540;
  vx = 5; 
  vy = 5;
  
  intro.rewind();
  win.rewind();
  fail.rewind();
  
  
  //bricks
  
  x = new int[n];
  y = new int[n];
  alive = new boolean[n];
  tempx = 100;
  tempy = 100;
  
  
    int i = 0;
  while (i < n) {
    x[i] = tempx;
    y[i] = tempy;
    alive[i] = true;
    tempx = tempx + 75;
    if (tempx >= width-75) {
      tempx = 100;
      tempy = tempy + 75;
    }

    i++;
  }
}
