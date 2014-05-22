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
}

