void StoryScreen() {
  
  noTint();
  
  if (millis() > storyA + 200) {
    fireIndex ++;
    storyA = millis();
  }
  if ( fireIndex == 14) {
    fireIndex = 2;
  }
  // fire animation
  image(img2[fireIndex], width/2, 190);
  image(img2[fireIndex], width/2 +280, 190);
  image(img2[fireIndex], width/2-280, 190);

  m = fft.getBand(1); // getting the fft and saving it into the variable m
  pushMatrix();
  translate(m*0.5-m*0.6, 10); // translating the dialoge box to the fft for the shake effect
  stroke(360);
  strokeWeight(10);
  textSize(25);
  noFill();
  rect(width/2, 530, width- 100, 300);
  image(img3[textIndex], width/2, 550); // text image
  //println(spaceIndex, click);

  if (click) {
    fill(20, 80, 60);
    noStroke();
    rect(195, 527, 200, 235);
    image(img2[0], 195, 527, 200, 240); // jack image
    
  } else if (!click) {
    
    fill(20, 80, 60);
    noStroke();
    rect(1112, 533, 176, 215);
    image(img2[1], 1100, 520, 200, 240); // old man image
  }
  popMatrix();
  image(img3[7], width/2, 650); // "press space to continue
  
  
}
