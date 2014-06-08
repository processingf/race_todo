/*
 * RACEMAG - First Car game
 */
// Cars (Angle), Track, Items, Pickups, Particles, Attacks, Zombies, ...
import ddf.minim.*;

void setup()
{
  size(800, 600, P2D);
  Init();
}

void draw()
{
  Update();
  Cursor.Text = ""+Option.Get("radius");
  Cursor.Draw();
}

