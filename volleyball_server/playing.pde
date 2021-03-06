String input;
float[] data = new float[2];

void playing() {
  background(background);
  image(netpic, width/2-10, height-188);

  player1();
  //player2();
  p2.setPosition(data[0],data[1]);

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
  for (FContact c : cball) {
    if (c.contains(p1)) {
      ball.addImpulse( (p1.getX()-ball.getX()) * -20, -500);
    }
    if (c.contains(p2)) {
      ball.addImpulse( (p2.getX()-ball.getX()) * -20, -500);
    }

    if (c.contains(p0) && ball.getX()<width/2) {
      rscore++;
      if (rscore==5) {
        winner=2;
        mode=2;
      }
      lastscore=2;
      reset();
    } else if (c.contains(p0) && ball.getX()>width/2) {
      lscore++;
      if (lscore==5) {
        winner=1;
        mode=2;
      }
      lastscore=1;
      reset();
    }
  }

  if (p1.getX()>=width/2-47) p1.setPosition(width/2-48, p1.getY());
  if (p2.getX()<=width/2+47) p2.setPosition(width/2+48, p2.getY());

  world.step();
  world.draw();
  
  c = server.available();
  if (c != null) {
    input = c.readString(); 
    input = input.substring(0, input.indexOf("\n")); 
    println(input);
    if(complete(input)){
      data = float(split(input, ' '));
      println(data);
    }
  }
}
boolean complete(String input){
   int spaces = 0;
   for (int i = 0; i < input.length(); i++){
      if (input.charAt(i)==' ') spaces++;
   }
   if (spaces==1) return true;
   else return false;
}
