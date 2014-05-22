/*
 * RACEMAG - First Car game
 */
// Cars (Angle), Track, Items, Pickups, Particles, Attacks, Zombies, ...
import ddf.minim.*;

PImage backImg;

void setup()
{
  size(800, 600, P2D);
  rectMode(CENTER);
  Init();
  backImg = loadImage("CatFight.jpg");
}

void draw()
{
  image(backImg, 0, 0, 800, 600);
  Cursor.Draw();
  Vwr1.BeginView();
  Vwr1.X = mouseX;
  Vwr1.Y = mouseY;
  ActiveView.background(255);
  ActiveView.fill(255);
  ActiveView.rect(0, 0, 10, 10);
  Vwr1.EndView();
  Vwr1.Draw();
}

