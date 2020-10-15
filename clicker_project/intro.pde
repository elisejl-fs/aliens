void intro() {
  theme.play();

  background(0);
  stroke (0);
  strokeWeight(2);

  //target
  image (selectedufo, x, y, d*1.5, d); 
  
  //ALIEN INVASION
  fill(175, 232, 103);
  textFont(spaceage);
  textAlign(CENTER, CENTER);
  textSize(100);
    text("alien \n invasion", 400, 250);


  //save your planet!!
  if (mouseX > 250 && mouseX < 550 && mouseY > 470 && mouseY < 570) {
    fill (13, 49, 139);
  } else {
    fill(255);
  }
  textFont(nasa);
  textSize(40);
  text ("save your planet!!", 400, 510); 
  //click here
  textSize (12);
  text ("[click here]", 400, 550);



  //OPTIONS
      if (dist(650, 75, mouseX, mouseY) < 63) {
    fill(13, 49, 139);
  } else {
    fill(255);
  }

  textSize (25);
  text("OPTIONS", 650, 70);
  textSize (15);
  text("[click here]", 650, 95);

}


void introClicks() {
  if (mouseX > 250 && mouseX< 550 && mouseY> 470 && mouseY< 570) {
    mode = GAME;
  }
  //options
  if (dist(650, 75, mouseX, mouseY) <125) {
    mode = OPTIONS;
  }
}
