void options() {  
  theme.pause();

  background (0);
  fill(255);
  textSize(40);
  text("choose your opponent:", 270, 80);

  //ufo1

  if (mouseX > 415 && mouseX < 585 && mouseY > 290 && mouseY < 350) {
    stroke (255, 0, 255);
    fill (13, 49, 139);
  } else {
    fill(255);
  }
  text ("UFO #1", 500, 320);
  image(ufo1, 50, 200, 225, 225);

  //ufo2
  if (mouseX > 415 && mouseX < 585 && mouseY > 470 && mouseY < 530) {
    fill (13, 49, 139);
  } else {
    fill(255);
  }
  text ("UFO #2", 500, 500);
  image(ufo2, 80, 450, 175, 125);

  //ufo3
  if (mouseX > 415 && mouseX < 585 && mouseY > 650 && mouseY < 710) {
    fill (13, 49, 139);
  } else {
    fill(255);
  }
  text ("UFO #3", 500, 680);
  image(ufo3, 50, 610, 200, 175);


  //circle
  //text
  if (dist(650, 75, mouseX, mouseY) < 63) {
    fill(13, 49, 139);
  } else {
    fill(255);
  }
  textSize (25);
  text("CLOSE \n OPTIONS", 650, 70);
}


void optionsClicks () {
  if (dist(650, 75, mouseX, mouseY) <63) {
    mode = INTRO;
  }

  //ufo1
  if (mouseX > 415 && mouseX < 585 && mouseY > 290 && mouseY < 350) {
    selectedufo = ufo1;
  } 

  //ufo2
  if (mouseX > 415 && mouseX < 585 && mouseY > 470 && mouseY < 530) {
    selectedufo = ufo2;
  }

  //ufo3
  if (mouseX > 415 && mouseX < 585 && mouseY > 650 && mouseY < 710) {
    selectedufo = ufo3;
  }
}
