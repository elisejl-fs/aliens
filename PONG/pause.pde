void pause() {
  fill(lilac);
  textFont(instructions);
  textSize(100);
  text("PAUSED", 400, 250);

fill(pea);
  textFont (mc2);
  textSize(25);
  text("CLICK ANYWHERE TO RESUME", 400, 375);
}

void pauseClicks() {
  mode = GAME;
}
