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
 * gfxbasic.pde - Basic Graphics element classes which can be used to display basic graphics
 * This file is part of the Racemag game using Processing.
 */


// Graphics Rectangle class
// ------------------------
// Use this class to draw rectangles
class gfxrect extends gfxelem
{


  // Data
  // ----
  float Width;      // X size of the rectangle
  float Height;     // Y size of the rectangle
  float EdgeWidth;  // Width of rectangle sides
  color EdgeColor;  // Color of rectangle sides
  color FillColor;  // Color of rectangle inside
  
  
  // Constructor (position, angle, scale, width, height, edge width, edge color, fill color)
  // ---------------------------------------------------------------------------------------
  // Creates a new gfxrect class object with specified parameters
  gfxrect(PVector p, float a, float s, float w, float h, float ew, color ec, color fc)
  {
    super(p, a, s);
    Width     = w;
    Height    = h;
    EdgeWidth = ew;
    EdgeColor = ec;
    FillColor = fc;
  }
  
  
  // Draw Shape ()
  // -------------
  // Draws the rectangle (shape)
  void DrawShape()
  { rect(0, 0, Width, Height); }
  
  
  // Draw This ()
  // ------------
  // Draws this object
  void DrawThis()
  {
    if(EdgeColor == 0) noStroke();
    else
    {
      strokeWeight(EdgeWidth);
      stroke      (EdgeColor);
    }
    if(FillColor == 0) noFill();
    else               fill(FillColor);
    DrawShape();
  }


} // end class gfxrect




// Graphics Ellipse class
// ----------------------
// Use this class to draw ellipses
class gfxellipse extends gfxrect
{
  
  
  // Constructor (position, angle, scale, width, height, edge width, edge color, fill color)
  // ---------------------------------------------------------------------------------------
  // Creates a new gfxellipse class object with specified parameters
  gfxellipse(PVector p, float a, float s, float w, float h, float ew, color ec, color fc)
  { super(p, a, s, w, h, ew, ec, fc); }
  
  
  // Draw Shape ()
  // -------------
  // Draws the ellipse (shape)
  void DrawShape()
  { ellipse(0, 0, Width, Height); }


} // end class gfxellipse




// Graphics Arc class
// ------------------
// Use this class to draw arcs
class gfxarc extends gfxrect
{


  // Data
  // ----
  float StartAngle;  // Angle at which the arc begins
  float StopAngle;   // Angle at which the arc ends
  int   Mode;        // Arc draw mode (PIE / OPEN / CHORD)
  
  
  // Constructor (position, angle, scale, width, height, edge width, edge color, fill color, start angle, stop angle, mode)
  // ----------------------------------------------------------------------------------------------------------------------
  // Creates a new gfxarc class object with specified parameters
  gfxarc(PVector p, float a, float s, float w, float h, float ew, color ec, color fc, float st, float sp, int m)
  {
    super(p, a, s, w, h, ew, ec, fc);
    StartAngle = st;
    StopAngle  = sp;
    Mode       = m; 
  }
  
  
  // Draw Shape ()
  // -------------
  // Draws the arc (shape)
  void DrawShape()
  { arc(0, 0, Width, Height, StartAngle, StopAngle, Mode); }


} // end class gfxarc




// Graphics Text class
// -------------------
// Use this class to draw texts
class gfxtext extends gfxelem
{


  // Data
  // ----
  String  Text;    // Text to be displayed
  PFont   Font;    // Font to be used (load using loadFont / createFont)
  float   Size;    // Size of the text
  color   Color;   // Color used to display text
  float   Width;   // Width of the text area
  float   Height;  // Height of the text area
  int     AlignX;  // Text alignment in x direction 
  int     AlignY;  // Text alignment in y direction
  boolean Boxed;   // Tells if text is fixed into the text area or not
  
  
  // Constructor (position, angle, scale, width, height, color, edge color, fill color, start angle, stop angle, mode)
  // ----------------------------------------------------------------------------------------------------------------------
  // Creates a new gfxtext class object with specified parameters
  gfxtext(PVector p, float a, float s, String t, PFont f, float sz, color c, float w, float h, int ax, int ay, boolean b)
  {
    super(p, a, s);
    Text   = t;  Width  = w;
    Font   = f;  Height = h;
    Size   = sz; Color  = c;
    AlignX = ax; AlignY = ay;
    Boxed  = b;
  }
  
  
  // Draw This ()
  // ------------
  // Draws this object
  void DrawThis()
  {
    fill(Color);
    textFont (Font,   Size);
    textAlign(AlignX, AlignY);
    if(Boxed) text(Text, 0, 0, Width, Height);
    else      text(Text, 0, 0);
  }


} // end class gfxtext




// Graphics Shape class
// --------------------
// Use this class to draw shapes
class gfxshape extends gfxelem
{


  // Data
  // ----
  PShape Shape;  // Shape to be drawn (load using loadShape / create using points, image)
  
  
  // Constructor (position, angle, scale, shape)
  // -------------------------------------------
  // Creates a new gfxshape class object with specified parameters
  gfxshape(PVector p, float a, float s, PShape sh)
  {
    super(p, a, s);
    Shape = sh;
  }
  
  
  // Draw This ()
  // ------------
  // Draws this object
  void DrawThis()
  { shape(Shape, 0, 0); }


} // end class gfxshape




// Graphics Image class
// --------------------
// Use this class to draw images
class gfximage extends gfxelem
{


  // Data
  // ----
  PImage Image;      // Image to be drawn (load using loadImage)
  color  TintColor;  // Tint color to be applied to the image (0 for no tint)
  int    Mode;       // Blend mode to be used with the background (0 for no blend)
  
  
  // Constructor (position, angle, scale, image, tint color, mode)
  // -------------------------------------------
  // Creates a new gfximage class object with specified parameters
  gfximage(PVector p, float a, float s, PImage i, color t, int m)
  {
    super(p, a, s);
    Image     = i;
    TintColor = t;
    Mode      = m;
  }
  
  
  // Draw This ()
  // ------------
  // Draws this object
  void DrawThis()
  {
    if(TintColor == 0) noTint();
    else               tint(TintColor);
    if(Mode == 0) image(Image, 0, 0);
    else          blend(Image, 0, 0, Image.width, Image.height, 0, 0, Image.width, Image.height, Mode);
  }


} // end class gfximage

