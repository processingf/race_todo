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
 * gfxcamera.pde - Define graphics camera for viewing the scene
 * This file is part of the Racemag game using Processing.
 */


class gfxcamera extends gfxelem
{
  PGraphics View;
  float AbsX, AbsY, AbsAngle;
  int ViewX, ViewY, ViewWidth, ViewHeight;
  
  
  gfxcamera(float x, float y, float a, float s, float r, int vx, int vy, int vw, int vh)
  {
    super(x, y, a, s, r);
    ViewX = vx; ViewY = vy;
    ViewWidth = vw; ViewHeight = vh;
    AbsX = 0; AbsY = 0; AbsAngle = 0;
    View = createGraphics(Width, Height, P2D);
  }
  
  gfxcamera(XML xml, uielem parent)
  {
    super(xml, parent);
    Absolute = false;
    ViewX = xml.getInt("viewx");
    ViewY = xml.getInt("viewy");
    Width = xml.getInt("width");
    Height = xml.getInt("height");
    AbsX = 0; AbsY = 0; AbsAngle = 0;
    View = createGraphics(Width, Height, P2D);
  }
  
  void DrawThis(PGraphics v)
  {
    AbsX = modelX(0, 0, 0);
    AbsY = modelY(0, 0, 0);
    AbsAngle = atan2(modelY(1, 0, 0), modelX(1, 0, 0));
  }
  
  void BeginView()
  {
    PGraphics v = View;
    if(Absolute)
    { AbsX = X; AbsY = Y; AbsAngle = Angle; }
    v.beginDraw();
    v.translate(Width/2, Height/2);
    v.scale(Scale);
    v.rotate(-AbsAngle);
    v.translate(-AbsX, -AbsY);
    v.rectMode(CENTER);
    v.imageMode(CENTER);
    v.textureWrap(REPEAT);
  }
  
  void EndView()
  {
    PGraphics v = View;
    v.endDraw();
  }
  
  void DrawView()
  { image(View, ViewX, ViewY); }
}

