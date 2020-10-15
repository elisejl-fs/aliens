// Elise Wong
// Block 1-1A
// Due Sept 27, 2020

float z = 10;
float target = 60;
float angle;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minimTools;
//minimTools = variable
AudioPlayer music;
//song = variable of "AudioPlayer"


PFont firstfont;
PFont secondfont;

//VARIABLES
int bp, s1, s2, s3, s4;
int r;
int bowl;
int pan1;
int pan2;
int plate;

boolean overButton = false;


void setup() { //----------------------------------------------------------------------------------------
 frameRate(100);
 size (800, 510);
 r = -1;
 
  
      minimTools = new Minim(this);
      music = minimTools.loadFile("music.mp3");
      music.play();
 
 firstfont = createFont("firstfont.ttf", 200);

 
//initialize "BLUEBERRY PANCAKES"
   bp = 800;

 
//initialize bowl
  bowl = 60;

      //initialize step 1
       secondfont = createFont("secondfont.ttf", 200);
    s1 = 50;
 
//initialize pan1
   pan1 = 300;
 
     //initialize step 2
   secondfont = createFont("secondfont.ttf", 200);
   s2 = 250;
   
   //spitting butter
   

 
//initialize pan2
   pan2 = 500;
 
     //initialize step 3
   secondfont = createFont("secondfont.ttf", 200);
   s3 = 450;
 
 
//initialize plate
  
  plate = 700;
  
    //initialize step 4
   secondfont = createFont("secondfont.ttf", 200);
   s4 = 675;
  
} //END SETUP //-----------------------------------------------------------------------------------------
void draw() { //-----------------------------------------------------------------------------------------
 
 background(240, 227, 237);
 
 //table
  fill(152, 129,107);
  stroke(152, 129, 107);
  rect (r, 150, 800, 250);
 
 
 
 //"BLUEBERRY PANCAKES"
 textFont (firstfont);
 textSize(110);
 fill(125, 139, 216);
 text("Blueberry Pancake Recipe", bp, 100); 
       //move BP
   bp = bp - 1;
       //loop BP
   if (bp < -700) {
    bp = 800; 
   }
   

  
//bowl
  fill (160);
  stroke (3);
  strokeWeight(1);
  ellipse (bowl, 275, 170, 170);
  ellipse (bowl, 275, 160, 160);
  //fill(255);
  //stroke (255);
  fill (255);
  ellipse (target, 275, 140, 140);
  fill (237, 232, 191);
  ellipse (z, 275, 140, 140);
  
  z= lerp(z, target, 0.025);
  

 
   //spatula (circular mvmt)
   fill(206, 187, 150);
   stroke(206, 187, 150);
   strokeWeight(8);
   line(100, 155, 50, 250);
   
   stroke (0);
   strokeWeight (1);
   fill(255,0,0);
   stroke (255,0,0);
   quad(20, 280, 55, 275, 63, 255, 37, 240);
   fill(237, 232, 191);
   stroke(0);
   quad(20, 280, 53, 280, 61, 260, 28, 260);
   

    //step 1 
     textFont (secondfont);
     textSize(18);
     fill(116, 129, 201);
     text("1. mix dry \n with wet \n ingredients", s1, 425);

        
//pan1

  //handle
    fill (40);
  strokeWeight(1);
  stroke(255);
  quad(340, 215, 360, 235, 420, 185, 395, 160);
  ellipse (pan1, 275, 150, 150);
  ellipse (pan1, 275, 140, 140);

 
       //oil
   fill(195, 196, 150);
   stroke(195, 196, 150);

   ellipse (330, 275, 40, 40);
   ellipse (320, 285, 40, 40);
   ellipse (310, 265, 40, 40);
   ellipse (300, 275, 40, 40); 
   ellipse (300, 305, 40, 40);
   ellipse (290, 255, 40, 40);
   ellipse (280, 300, 40, 40);
   ellipse (275, 285, 40, 40);
   
  //butter
  fill(253,255,175);  
  stroke(253,255,175);  
  rect(285, 265, 25, 25, 8);
    
  //spitting butter + oil (bounce)
  

    //step 2
         textFont (secondfont);
      textSize(18);
      fill(116, 129, 201);
      text("2. on medium \n heat, melt \n butter & oil", s2, 425);
    

  
//pan2
 
 //handle
   fill (40);
  stroke (255);
  strokeWeight(1);
  quad(540, 215, 560, 235, 620, 185, 595, 160);
  ellipse (pan2, 275, 150, 150);
  ellipse (pan2, 275, 140, 140);

  
  //pancake
  fill(237, 232, 191);
  stroke (237, 232, 191);
    strokeWeight(1);
  ellipse (pan2, 275, 100, 100);
  
  //blueberries
fill(125, 139, 216);
  ellipse (460, 255, 10, 10);
  ellipse (480, 295, 10, 10);
  ellipse (490, 265, 10, 10);
  ellipse (505, 300, 10, 10);
  ellipse (510, 245, 10, 10);
  ellipse (530, 250, 10, 10);
  ellipse (530, 270, 10, 10);  
   //step 3
        textFont (secondfont);
      textSize(18);
      fill(116, 129, 201);
      text("3. pour batter, \n add blueberries \n + flip when \n bubbles appear", s3, 425);


//plate
fill (232, 226, 220);
stroke (232, 226, 220);
  strokeWeight(1);
ellipse(plate, 275, 180, 180);
stroke(1);
ellipse(plate, 275, 130, 130);

//top pancake
  fill(237, 221, 191);
  stroke (0);
    strokeWeight(1);
  ellipse (plate, 250, 100, 100);
  
  //top middle pancake
  ellipse (plate, 265, 100, 100);
  
    //bottom middle pancake
  ellipse (plate, 280, 100, 100);
  
  //bottom pancake
  strokeWeight(1);
  ellipse (plate, 295, 100, 100);
  
  //blueberries
  fill(125, 139, 216);
  stroke(125, 139, 216);
  ellipse (660, 280, 10, 10);
  ellipse (680, 320, 10, 10);
  ellipse (690, 290, 10, 10);
  ellipse (705, 325, 10, 10);
  ellipse (710, 270, 10, 10);
  ellipse (730, 270, 10, 10);
  ellipse (730, 295, 10, 10);  


  ellipse (700, 220, 10, 10);  
  ellipse (670, 310, 10, 10);  
  ellipse (760, 232, 10, 10); 
  ellipse (680, 215, 10, 10);  
  ellipse (730, 295, 10, 10);  
  ellipse(635, 275, 10, 10);
  
  //butter
  fill(253,255,175);  
  stroke(240, 242, 152);  
  strokeWeight(2);
  rect(700, 230, 20, 20, 8);
  rect(680, 265, 20, 20, 8);
  rect(705, 295, 20, 20, 8);

    //step 4
         textFont (secondfont);
      textSize(18);
      fill(116, 129, 201);
      text("4. enjoy!", s4, 425);  
      textSize(15);
      text("my favourite \nrecipe below:", s4, 450); 
      
      

      
      
//my favourite blueberry pancake recipe
      if (overButton == true) {
    fill(125, 139, 216);
    stroke (125, 139, 216);
  } else {
    noFill();
  }
  rect(700, 475, 25, 25);
  //diag
  line(700, 500, 725, 475);

}

void mousePressed() {
  if (overButton) { 
    link("https://pinchofyum.com/fluffiest-blueberry-pancakes");
  }
}

void mouseMoved() { 
  checkButtons(); 
}
  
void mouseDragged() {
  checkButtons(); 
}

void checkButtons() {
  if (mouseX > 690 && mouseX < 775 && mouseY > 410 && mouseY <500) {
    overButton = true;   
  } else {
    overButton = false;
  }
}
      


    //credit to "The Coding Train" from https://www.youtube.com/watch?v=8uLVnM36XUc for lerp function.
