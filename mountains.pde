void mountMenu() {

  p2 += 0.0005; // adding a small value to p to 

  for (float i = 0; i < 7; i++) { // going through my array of mountain layers

    fill(120-i*20); // filling the shape with a colour that changes with i
    beginShape(); // begining drawing my shapes
    vertex(240, 510);
    for (float j = 240; j < 1040+2; j +=10) {

      float time = p2 * (i + 0.05); // creating the parallax effect
      n = noise(i+time+j/500)*(400-40*i); // saving noise in the variable n
      vertex(j, 400-n); // adding noise to the y-position
    }
    vertex(1040, 510);
    endShape();
  }
}
