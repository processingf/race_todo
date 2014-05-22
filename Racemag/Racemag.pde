/*
 * RICOCHET - Car game by Naruto Fan
 */
// Cars (Angle), Track, Items, Pickups, Particles, Attacks, Zombies, ...
import ddf.minim.*;

void setup()
{
  size(800, 600, P2D);
  imageMode(CENTER);
  rectMode(CENTER);
  Init();
  // LoadMainMenu(loadXML("MainMenu.xml"));
}

void draw()
{
  background(180);
  Map();
}

