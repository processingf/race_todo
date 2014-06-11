/* ----------------------------------------------------------------------- *
 *
 *   Copyright (c) 2014, Subhajit Sahu
 *   All rights reserved.
 *
 *   Redistribution and use in source and binary forms, with or without
 *   modification, are permitted provided that the following
 *   conditions are met:
 *
 *   * Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   * Redistributions in binary form must reproduce the above
 *     copyright notice, this list of conditions and the following
 *     disclaimer in the documentation and/or other materials provided
 *     with the distribution.
 *
 *     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
 *     CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
 *     INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 *     MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 *     DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 *     CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 *     SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 *     NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 *     LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 *     HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 *     CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 *     OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * ----------------------------------------------------------------------- */

/* 
 * Racemag.pde - Main source file of my first car game
 * This file is part of the Racemag game using Processing.
 */

// Cars (Angle), Track, Items, Pickups, Particles, Attacks, Zombies, ...


// required libraries
import ddf.minim.*;


PImage map;
gfxrect Rect1, Rect2;
phycollcir Coll1, Coll2;
ArrayList<viselem> ForColl1, ForColl2;

// initialization
void setup()
{
  size(800, 400, P2D);
  rectMode(CENTER);
  imageMode(CENTER);
  textureWrap(REPEAT);
  map = loadImage("map.png");
  Rect1 = new gfxrect(new PVector(), 0, 1, 50, 60, 10, color(0), 0);
  Rect2 = new gfxrect(new PVector(40, 40), 0, 1, 50, 60, 10, color(0), 0);
  abc x = new abc();
  Coll1 = new phycollcir(new PVector(), 50, Rect1, x);
  Coll2 = new phycollcir(new PVector(), 50, Rect2, x);
  Rect1.AddChild(Coll1);
  Rect2.AddChild(Coll2);
  ForColl1 = new ArrayList(); ForColl1.add(Coll2);
  ForColl2 = new ArrayList(); ForColl2.add(Coll1);
}


// main execution
void draw()
{
  image(map, 0, 0);
  for(int i=0; i<20; i++)
  rect(400+20*randomGaussian(), 200 + 20*randomGaussian(), 10, 10);
  Rect1.Pos.x = mouseX;
  Rect1.Pos.y = mouseY;
  Rect1.Draw();
  Rect2.Draw();
  Coll1.Process(ForColl1);
}

