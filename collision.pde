void collision()
{

  for (platform r : plats) { // goes through the array list of platforms

      //checks if the chracter is on top of the platform
    if (p.Pos.x >= r.x && p.Pos.x <= r.x+1500 && p.Pos.y >= r.y-4 && p.Pos.y <= r.y+20) 
    {
      p.Pos.y = r.y-4; //keep the player on the platform
      p.Vel.y = 0;
      jump = false;
      run = true;
    }
    //checks if the chracter hits the side of the platform
    if (p.Pos.x >= r.x && p.Pos.x <= r.x+1500 && p.Pos.y >= r.y+20) 
    {
      p.Vel.x *= -1;
    }
    if (r.tower == true) //checks if the is a tower on the platform
    {
      if (p.Pos.x >= r.towerPos.x && p.Pos.x <= r.towerPos.x+200 && p.Pos.y >= r.towerPos.y-4 && p.Pos.y <= r.towerPos.y+20) //checks if the player is on the tower
      {
        p.Pos.y = r.towerPos.y-4; //keep the player on the tower
        p.Vel.y = 0;
        run = true;
        jump = false;
      }
    }
    if (r.trap == true) //checks if the is a trap on the platform
    {
      if (p.Pos.x >= r.trapPos.x && p.Pos.x <= r.trapPos.x+200 && p.Pos.y >= r.trapPos.y && p.Pos.y <= r.trapPos.y+25) 
      {
        high[5] = current; // game ends if player hits the trap
        high = bubbleSort(high);
        state = 3;
      }
    }
    if (r.power == true) //checks if the is a power up on the platform
    {
      if (p.Pos.x >= r.powerPos.x && p.Pos.x <= r.powerPos.x+48 && p.Pos.y >= r.powerPos.y && p.Pos.y <= r.powerPos.y+58) 
      {
        r.power = false; 
        darkness =- 10; // when the power up is collected the darkness is reduced
      }
    }
  }
}

void BatCollsion()
{
  for (Bats b : bats) //goes through the array list of bats
  {
    if (p.Pos.x >= b.Pos.x && p.Pos.x <= b.Pos.x+50 && p.Pos.y >= b.Pos.y && p.Pos.y <= b.Pos.y+125) //checks if the player has hit the bat
    {
      high[5] = current; // game ends if player hits the bat
      high = bubbleSort(high);
      state = 3;
    }
  }
}
