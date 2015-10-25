void mount() {

  p2 += 0.005;
  //hue -= 0.005;
  //bright -= 0.005;

  fill(hue+30, 80, bright+20);
  ellipse(width/2, y, 220, 220);
  
  y += 0.8;
  hue -= 0.002;
  bright -= 0.002;

  for (float i = 0; i < 4; i++) {
    fill(80-i*20);

    beginShape();
    vertex(0, height);
    for (float j = 0; j < width+20; j +=10) {

      float time = p2 * (i + 0.05);
      n = noise(i+time+j/300)*(height-40*i);
      vertex(j, height-n);
    }
    vertex(width, height);
    endShape();
  }
}
