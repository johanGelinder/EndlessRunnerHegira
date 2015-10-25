void titelScreen() {


  mouseOver();
  for (int i = 0; i < 100; i ++ ) { 
    m = fft.getBand(i); // getting the fft and saving it into m

    fill(hue, 80, bright-40); //redish background
    rect(width/2, 250, 800, 500); 
    fill(hue+30, 80, bright+m*i/4); // bright+20 // colour of the sun with the brightness beeing affected by the fft
    ellipse(width/2, 240, 160, 160); // sun
  }

  mountMenu(); // calling the mountain function

  image(img[9], width/2, 80); // Hegira image
  image(img[imgIndex], width/2, 340); // character animation 
  
  // ----- Menu Buttons ----- //
  image(img[5], width/2, 550, 300, 100); // new game  
  image(img[6], width/2, 620, 300, 100); // highscore
  //image(img[7], width/2, 690, 300, 100); // options
  
  if (mute == false)  {

    image(img[15], width-50, height-50, 50, 50); // mute button
  }
  
  if (mute) {  
  image(img[16], width-50, height-50, 50, 50);
  menuMusic.play();
  }
}
