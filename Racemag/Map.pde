

void Map()
{
  beginShape();
  texture(roadImg);
  vertex(0, 0, 0, 0);
  vertex(10, 0, 0, 40);
  vertex(20, 10, 0, 120);
  vertex(70, 60, 0, 320);
  vertex(90, 60, 0, 400);
  vertex(90, 100, 400, 400);
  vertex(70, 100, 400, 320);
  vertex(20, 50, 400, 120);
  vertex(10, 40, 400, 40);
  vertex(0, 40, 400, 0);
  endShape(CLOSE);
  image(1, mouseX, mouseY);
}

