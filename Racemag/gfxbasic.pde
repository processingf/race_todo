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
 * gfxbasic.pde - Define basic graphics elements derived from the root gfxelem
 * This file is part of the Racemag game using Processing.
 */


class gfxrect extends gfxelem
{
  float Width, Height;
  color EdgeColor, FillColor;
  float EdgeWidth;
  
  gfxrect(float x, float y, float a, float s, float r, float w, float h, float ew, color ec, color fc)
  {
    super(x, y, a, s, r);
    Width = w; Height = h;
    EdgeWidth = ew;
    EdgeColor = ec;
    FillColor = fc;
  }
  
  void DrawShape(PGraphics v) { v.rect(0, 0, Width, Height); }
  
  @Override
  void DrawThis(PGraphics v)
  {
    if(EdgeColor == 0) v.noStroke();
    else { v.strokeWeight(EdgeWidth); v.stroke(EdgeColor); }
    if(FillColor == 0) v.noFill();
    else v.fill(FillColor);
    DrawShape();
  }
}


class gfxellipse extends gfxrect
{
  gfxellipse(float x, float y, float a, float s, float r, float w, float h, float ew, color ec, color fc)
  { super(x, y, a, s, r, w, h, ew, ec, fc); }
  
  @Override
  void DrawShape(PGraphics v)
  { v.ellipse(0, 0, Width, Height); }
}


class gfxarc extends gfxrect
{
  float StartAngle, StopAngle;
  int Mode;
  
  uirect(float x, float y, float a, float s, float r, float w, float h, float ew, color ec, color fc, float ta, float pa, int m)
  {
    super(x, y, a, s, r, w, h, ew, ec, fc);
    StartAngle = ta;
    StopAngle = pa;
    Mode = m; 
  }
  
  @Override
  void DrawShape(PGraphics v)
  { v.arc(0, 0, Width, Height, StartAngle, StopAngle, Mode); }
}


class gfxtext extends gfxrect
{
  String Text;
  PFont Font; float Size;
  int AlignX, AlignY;
  boolean Boxed;
  
  gfxtext(float x, float y, float a, float s, float r, float w, float h, color c, String t, PFont f, float sz, int ax, int ay, boolean b)
  {
    super(x, y, a, s, r, w, h, 0, 0, c);
    Text = t; Font = f; Size = sz;
    AlignX = ax; AlignY = ay;
    Boxed = b;
  }
  
  @Override
  void DrawShape(PGraphics v)
  {
    v.textFont(Font, Size);
    v.textAlign(AlignX, AlignY);
    if(Boxed) v.text(Text, 0, 0, Width, Height);
    else v.text(Text, 0, 0);
  }
}


class gfxshape extends gfxrect
{
  PShape Shape;
  
  gfxshape(float x, float y, float a, float s, float r, PShape sh)
  {
    super(x, y, a, s, r, sh.width, sh.height, 0, 0, 0);
    Shape = shp;
  }

  gfxshape(float x, float y, float a, float s, float r, PImage i, int m, float[] vx, float[] vy, float[] ix, float[] iy)
  {
    super(x, y, a, s, r, 0, 0, 0, 0, 0);
    Build(i, m, vx, vy, ix, iy);
  }
  
  void Build(PImage txtr, int mode, float[] vx, float[] vy, float[] ix, float[] iy)
  {
    PShape s = createShape();
    s.beginShape();
    s.textureMode(mode);
    s.texture(txtr);
    for(int i=0; i<vx.length; i++)
    { s.vertex(vx[i], vy[i], ix[i], iy[i]); }
    s.endShape(CLOSE);
    Width = s.width;
    Height = s.height;
    Shape = s;
  }

  @Override
  void DrawThis(PGraphics v)
  {
    if(Width == 0 && Height == 0) v.shape(Shape, 0, 0);
    else v.shape(Shape, 0, 0, Width, Height);
  }
}


class gfximage extends gfxrect
{
  PImage Image;
  color TintColor;
  int Mode;
  
  gfximage(float x, float y, float a, float s, float r, float w, float h, PImage i, color t, int m)
  {
    super(x, y, a, s, r, i.width, i.height, 0, 0, 0);
    Image = i;
    TintColor = t;
    Mode = m;
  }
  
  @Override
  void DrawThis(PGraphics v)
  {
    if(TintColor == 0) v.noTint();
    else v.tint(TintColor);
    if(Mode == 0) v.image(Image, 0, 0, Width, Height);
    else v.blend(Image, 0, 0, Image.width, Image.height, 0, 0, (int) Width, (int) Height, Mode);
  }
}

