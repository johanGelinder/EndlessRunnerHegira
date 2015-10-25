void updatePlatforms()
{
  
  if (p.Pos.x >= plats.get(0).x + 2000) // checks if the player is over 2000 pixels past the platform in slot 0
  {
    nextY = int(random(plats.get(1).y -175, plats.get(1).y + 175));  //if the player is then it removes the old platform and calculates a new one
    if (nextY > 720)
    {
      nextY = int(random(500, 650));
    } else if (nextY < 200) {
      nextY = int(random(300, 500));
    }

    TotalPlats++;

    plats.remove(0);
    plats.add(new platform(nextY, TotalPlats));
  }
}

void updateBats()
{
  if (p.Pos.x >= bats.get(0).Pos.x + 1000) // checks if the player is over 1000 pixels past the bat in slot 0
  {
    TotalBats++;

    bats.remove(0); //if the player is then it removes the old bat and calculates a new one
    bats.add(new Bats(p.Pos.y, TotalBats));
  }
}

void dark()
{
  colorMode(RGB);
  rectMode(CORNER); // applies a black transparent rectangle to the screen
  fill(0,0,0,darkness);
  rect(0,0,width,height);
  darkness += 0.2; // as the darkness variable goes up the rectangle becomes more opaque 
  colorMode(HSB, 360, 100, 100);
}
