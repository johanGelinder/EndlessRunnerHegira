void restart()
{
  // this function resets all the variables values to what they are when the program starts
  p.Vel.y = 0;
  p.Vel.x = 6;
  p.Pos.x = 200;
  p.Pos.y = 400;

  plats.clear();
  plats.add(new platform(400, 0));
  nextY = int(random(225, 575));
  if (nextY > 720)
  {
    nextY = int(random(500, 650));
  } else if (nextY < 200) {
    nextY = int(random(300, 500));
  }
  plats.add(new platform(nextY, 1));
  
  bats.clear();
  bats.add(new Bats(p.Pos.y, 1));
  bats.add(new Bats(p.Pos.y, 2));
 
  TotalPlats = 1;
  TotalBats = 2;
  state = 2;
  current = 0;
  darkness = 0;
}
