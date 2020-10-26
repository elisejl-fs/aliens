void gameover () {
  clapping.play();
  //WIN
  //left
  if (leftscore > rightscore) {
    fill(lagoon);
    textFont (title);
    textSize(90);
    text("BLUE WINS", width/2, height/2);
  } else {
    //right
    fill(mulberry);
    textSize(130);
    text("PINK WINS", width/2, height/2);
  }

  //exit
  fill(0);
  rect(320, 420, 160, 70);
  
  if (mouseX > 320 && mouseX < 480 && mouseY > 420 && mouseY < 490) {
      fill(pea);
  } else {
    fill (lilac);
  }
  textFont(mc2);
  textSize(25);
  text("CLICK HERE\nTO EXIT", 400, 450);

  //click anywhere else to play again
  textAlign(CENTER, CENTER);
  textSize(25);
  fill(pea);
  text("CLICK ANYWHERE TO PLAY AGAIN", 400, 150);
}

void gameoverClicks() {

  intro.rewind();

  if (mouseX > 320 && mouseX < 480 && mouseY > 420 && mouseY < 490) {
    exit();
  } else {
    reset();
    mode = INTRO; 
    intro.rewind();
  }
}
