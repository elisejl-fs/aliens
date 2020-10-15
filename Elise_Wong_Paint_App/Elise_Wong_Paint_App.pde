//Elise Wong
//1-1A

//pallette of colors
color pearl          = #EFEEDB; 
color clementine     = #FBB829;
color bubblegum      = #FF0066; 
color chartreuse     = #DDDE25; 
color seafoam        = #ADD8C7;
color olive          = #57600A; 
color slate          = #556270;
color chocolate      = #795C4A;

//slider
float sliderX;
float thickness;

//stamps
PImage bass;
PImage synth;
PImage vinyl;

//font
PFont font;


//boolean arguments
boolean bassOn;
boolean synthOn;
boolean vinylOn;


//variables for color selection
color selectedColor;

void setup () { //================================================================
  background(pearl);
  
font = createFont("font.ttf", 15);  


  //bass
  bass = loadImage("bass.png");
  bassOn = false;
  //synth
  synth = loadImage("synth.png");
  synthOn = false;
  //vinyl
  vinyl = loadImage("vinyl.png");
  vinylOn = false;


  //color selection
  size(800, 600);
  strokeWeight(3);
  selectedColor = bubblegum;

  sliderX = 100;
  thickness = 0;
}

void draw() { //=================================================================

  //toolbar
  fill(slate);
  stroke(slate);
  rect (0, 0, 200, 600); 

  //buttons
  strokeWeight(3);

  tactile(35, 50, 50);
  fill(bubblegum);
  circle(35, 50, 50);

  tactile(100, 50, 50);
  fill(chartreuse);
  circle(100, 50, 50);

  tactile(35, 125, 50);
  fill(clementine);
  circle(35, 125, 50);

  tactile(100, 125, 50);
  fill(seafoam);
  circle(100, 125, 50);

  tactile(35, 200, 50);
  fill(olive);
  circle(35, 200, 50);

  tactile(100, 200, 50);
  fill(chocolate);
  circle(100, 200, 50);

  //new
  if (mouseX > 15 && mouseX < 185 && mouseY > 523 && mouseY < 543) {
    stroke(slate);
  } else {
    stroke(pearl);
  }
  fill(pearl);
  rect (15, 523, 170, 18);  
  textSize(13);
  fill (slate);
  textAlign(CENTER, CENTER);
  textFont(font);
  text("new", 100, 533);
  
  //load
  if (mouseX > 15 && mouseX < 185 && mouseY > 543 && mouseY < 560) {
    stroke(slate);
  } else {
    stroke(pearl);
  }
  fill(pearl);
  rect (15, 543, 170, 18);
  textSize(13);
  fill (slate);
  textAlign(CENTER, CENTER);
  textFont(font);
  text("load", 100, 553);
  
  //save
  if (mouseX > 15 && mouseX < 185 && mouseY > 563 && mouseY < 583) {
    stroke(slate);
  } else {
    stroke(pearl);
  }
  fill(pearl);
  rect (15, 563, 170, 20);
  textSize(13);
  fill (slate);
  textAlign(CENTER, CENTER);
  textFont(font);
  text("save", 100, 573);


  //indicator
  stroke(pearl);
  strokeWeight (3);
  fill(selectedColor);
  rect(165, 35, 10, 180);

  //slider
  thickness = map(sliderX, 10, 270, 0, 15);
  strokeWeight(thickness);
  stroke(pearl);
  line(10, 270, 190, 270);
  fill(selectedColor);
  //slider knob
        //make it tactile!!
          if (dist(mouseX, 270, mouseX, mouseY) < 25) {
               stroke(selectedColor);
               } else {
               stroke (pearl);
               }
  strokeWeight(3);
  circle(sliderX, 270, 25);
  //control draw
  strokeWeight(thickness);
  


  //stamps
  //bass
  tactile(30, 300, 138, 50);
  bassOnOff();
  rect(30, 300, 138, 50);
  image(bass, 30, 300, 138, 50);

  //synth
  tactile (70, 360, 75, 75);
  synthOnOff();
  rect(70, 360, 75, 75);
  image(synth, 70, 360, 75, 75);

  //vinyl
  tactile (70, 440, 75, 75);
  vinylOnOff();
  rect(70, 440, 75, 75);
  image(vinyl, 70, 440, 75, 75);
} // end draw ==============================================================



void tactile (int x, int y, int r) { //=====================================
  if (dist(x, y, mouseX, mouseY) < r) {
    stroke(slate);
  } else {
    stroke(pearl);
  }
} // =======================================================================

void tactile (int x, int y, int w, int h) { // =============================
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    fill(pearl);
  } else {
    fill(slate);
  }
} // =======================================================================



// end tactile =============================================================

void mouseReleased() {
  //bubblegum button
  if (dist (35, 50, mouseX, mouseY ) < 25) {
    selectedColor = bubblegum;
  }

  //chartreuse button
  if (dist (100, 50, mouseX, mouseY ) < 25) {
    selectedColor = chartreuse;
  }

  //clementine button
  if (dist (35, 125, mouseX, mouseY ) < 25) {
    selectedColor = clementine;
  }

  //seafoam button
  if (dist (100, 125, mouseX, mouseY ) < 25) {
    selectedColor = seafoam;
  }

  //olive button
  if (dist (35, 200, mouseX, mouseY ) < 25) {
    selectedColor = olive;
  }

  //chocolate button
  if (dist (100, 200, mouseX, mouseY ) < 25) {
    selectedColor = chocolate;
  }

         //slider
  controlSlider();

        //stamps
  //bass
  if (mouseX > 30 && mouseX < 168 && mouseY > 300 && mouseY < 350) {
    bassOn = !bassOn;
  }
  //synth
  if (mouseX > 70 && mouseX < 145 && mouseY > 360 && mouseY < 435) {
    synthOn = !synthOn;
  }
  //vinyl
  if (mouseX > 70 && mouseX <145 && mouseY > 440 && mouseY < 515) {
    vinylOn = !vinylOn;
  }
  
  //new button
  if (mouseX > 15 && mouseX < 185 && mouseY > 523 && mouseY < 543) {
    background(pearl);
  }

  //load button
    if (mouseX > 15 && mouseX < 185 && mouseY > 543 && mouseY < 560) {
    selectInput("select an image to load", "loadImage");
    }
  //save button
    if (mouseX > 15 && mouseX < 185 && mouseY > 563 && mouseY < 583) {
    selectOutput("name your image", "saveImage");
    }  
  
} // end of mouseReleased =========================================================

void saveImage(File f) { // =======================================================
  if (f != null) {
    PImage canvas = get(71, 1, width-71, height-1);
    canvas.save(f.getAbsolutePath());
  }
} // ==============================================================================

void loadImage(File f) { // =======================================================
  if (f != null) {
    //KLUDGE
    int n = 0;
    while (n < 100) {
      PImage pic = loadImage(f.getPath());
      image(pic, 0, 0);
      n = n+1;
    }
  }
} // ==============================================================================


void mouseDragged() { //===========================================================

  //drawing
  // stroke(selectedColor);
  // line(pmouseX, pmouseY, mouseX, mouseY);

  //slider
  controlSlider();


  if (bassOn == true) {
    image(bass, mouseX, mouseY, 275, 100);
  }

  if (synthOn == true) {
    image(synth, mouseX, mouseY, 200, 200);
  }
  
  if (vinylOn == true) {
    image(vinyl, mouseX, mouseY, 200, 200);
  }

  if (bassOn == false && synthOn == false && vinylOn == false) {
    stroke(selectedColor);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
} //===============================================================================

void controlSlider() {
  if (mouseX > 10 && mouseX < 190 && mouseY > 257 && mouseY < 283) {
    sliderX = mouseX;
  }
  thickness = map(sliderX, 10, 270, 0, 12);
} // ==============================================================================


void bassOnOff () { //==============================================================
  if (bassOn == true) {
    stroke (pearl);
    strokeWeight (3);
  } else {
    stroke (slate);
  }
} // ===============================================================================



void synthOnOff () { //==============================================================
  if (synthOn == true) {
    stroke (pearl);
    strokeWeight (3);
  } else {
    stroke (slate);
  }
} // ===============================================================================

void vinylOnOff () { //=============================================================
  if (vinylOn == true) {
    stroke(pearl);
    strokeWeight(3);
  } else {
    stroke(slate);
  }
} // ===============================================================================
