String input;
float[] data = new float[6];

void playing() {
  background(background);
  image(netpic, width/2-10, height-188);

  //player1();
  p1.setPosition(data[0], data[1]);
  player2();
  ball.setPosition(data[2], data[3]);
  lscore=int(data[4]);
  rscore=int(data[5]);

  textSize(100);
  textAlign(CENTER);
  fill(0);
  text(lscore, 70, 100);
  text(rscore, width-70, 100);

  c1=p1.getContacts();
  c2=p2.getContacts();
  cball=ball.getContacts();

  lcanjump=false;
  rcanjump=false;

  for (FContact c : c1) {
    if (c.contains(p0)) lcanjump=true;
    else lcanjump=false;
  }
  for (FContact c : c2) {
    if (c.contains(p0)) rcanjump=true;
    else rcanjump=false;
  }

  if (rscore==5) {
    winner=2;
    mode=2;
    lastscore=2;
    reset();
  }

  if (lscore==5) {
    winner=1;
    mode=2;
    lastscore=1;
    reset();
  }

  if (p1.getX()>=width/2-47) p1.setPosition(width/2-48, p1.getY());
  if (p2.getX()<=width/2+47) p2.setPosition(width/2+48, p2.getY());

  world.step();
  world.draw();

  if (c.available() > 0) { 
    input = c.readString(); 
    input = input.substring(0, input.indexOf("\n"));  

    data = float(split(input, ' '));
    println(data);
  }
}
