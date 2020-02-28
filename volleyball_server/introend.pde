float colour1=30, colour2=110, colour3=200;
int co1=1, co2=2, co3=3;

void intro() {
  background(intropic);
  fill(255);
  rectMode(CENTER);
  rect(250, 400, 300, 80);
  fill(0);
  textAlign(CENTER);
  textSize(50);
  text("START", 250, 417);

  fill(colour1, colour2, colour3);
  colour1=colour1+co1;
  if (colour1>=255) {
    colour1=254;
    co1=-co1;
  }
  if (colour1<=0) {
    colour1=1;
    co1=-co1;
  }
  colour2=colour2+co2;
  if (colour2>=255) {
    colour2=254;
    co2=-co2;
  }
  if (colour2<=0) {
    colour2=1;
    co2=-co2;
  }
  colour3=colour3+co3;
  if (colour3>=255) {
    colour3=254;
    co3=-co3;
  }
  if (colour3<=0) {
    colour3=1;
    co3=-co3;
  }
  textSize(100);
  text("Volleyball", 250, 310);
}

void end() {
  background(0);
  textSize(100);
  fill(255);
  text("GAME OVER",500,200);
  if(winner==1){
    textSize(50);
    fill(255);
    text("PLAYER 1 WINS",500,350);
  }
  if(winner==2){
    textSize(50);
    fill(255);
    text("PLAYER 2 WINS",500,350);
  }
  fill(255);
  rect(500,450,150,50);
  fill(0);
  textSize(30);
  text("RESTART",500,460);
}
