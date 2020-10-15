void reset() {
  
  //score
  if (score > 0) {
    score = 0;
  }
  
  //target speed
  if ((x = x + vx) > 0) {
   vx = 1; 
  }
  if ((y = y - vy) > 0) {
   vy = 1; 
  }
  
}
