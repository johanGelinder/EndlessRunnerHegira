class platform
{
  int num, x, y;
  int timer = 0;
  boolean off = false;
  boolean tower = false;
  boolean trap = false;
  boolean power = false;
  PVector trapPos = new PVector(0, 0);
  PVector towerPos = new PVector(0, 0);
  PVector powerPos = new PVector(0, 0);
  int fireTrap = 0;


  platform(int y, int num)
  {
    this.x = num*1800; // works out the x position of the platform
    this.y = y; //inputs the y position
    this.num = num; //the platforms number
    if (num != 0) { //makes sure nothing special spawns on the first platform
      if (random(0, 8) >=5) //random chance of tower or trap
      {
        trap = true;
        trapPos.x = int(random(this.x, this.x+1300)); //randomizes position of trap on platform
        trapPos.y = this.y-25;
      } else {
        tower = true;
        towerPos.x = int(random(this.x, this.x+1300)); //randomizes position of tower on platform
        towerPos.y = this.y - 200;
      }

      if ((num%2) == 0) // every 2 platforms a power up spawns
      {
        power = true;
        powerPos.x = int(random(this.x+100, this.x+1400)); //randomizes position of powerup on platform
        powerPos.y = this.y - 56;
      }
    }
  }

  void animate()
  {
    if (millis() > timeFire + 130) //uses millis to animate the fire
    {
      fireTrap ++;
      println(fireTrap);
      timeFire = millis();
      if ( fireTrap > 9) 
      {
        fireTrap = 0;
      }
    }
  }

  void display()
  {
    imageMode(CORNER);
    animate();
    strokeWeight(0);
    image(Texture, x, y); //shows the image of the platform
    if (trap) //checks what is on the platform and then displays it
    {
      image(fire[fireTrap], trapPos.x, trapPos.y-15);
      image(fire[fireTrap], trapPos.x+100, trapPos.y-15);
    }
    if (tower)
    {
      image(towerImg, towerPos.x, towerPos.y);
    }
    if (power)
    {
      image(powerUp, powerPos.x, powerPos.y);
    }
  }
}
