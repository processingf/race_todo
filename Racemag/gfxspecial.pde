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
 * gfxspecial.pde - Graphics control classes (special) which can be used to control display of graphics
 * This file is part of the Racemag game using Processing.
 */


// Graphics Range class
// --------------------
// Use this class to display graphics only if it is in display range
class gfxrange extends gfxelem
{


  // Data
  // ----
  PVector Ref;       // Relative position of this object wrt the camera
  PVector Dir;       // Direction vector pointed by this object wrt the camera * scaling factor
  float   Range;     // Display range of this object (if distance to camera > range, then this is not drawn)
  float   RefRange;  // Relative display range of this object wrt the camera
  
  
  // Constructor (position, angle, scale, range)
  // -------------------------------------------
  // Creates a new gfxrange class object at specified position, angle, scale and range
  // This class object can be used to control display of a group of objects
  // It can also be extended to create a ranged display object class
  gfxrange(PVector p, float a, float s, float r)
  {
    super(p, a, s);
    Range = r;
    Ref   = new PVector();
    Dir   = new PVector();
  }
  
  
  // Update Range ()
  // ---------------
  // Updates range of the object wrt the camera
  void UpdateRange()
  {
    Ref.x = modelX(0, 0, 0) - ViewSz.x;
    Ref.y = modelY(0, 0, 0) - ViewSz.y;
    Dir.x = modelX(1, 0, 0) - ViewSz.x - Ref.x;
    Dir.y = modelY(1, 0, 0) - ViewSz.y - Ref.y;
    RefRange = Range * Dir.mag();
  }
  
  
  // Draw ()
  // ------------
  // Draws this object and all its children
  void Draw()
  {
    pushMatrix();
    translate(Pos.x, Pos.y);
    rotate(Angle);
    scale (Scale);
    UpdateRange();
    if(Ref.mag() <= ViewRange + RefRange)
    {
      DrawThis();
      for(int i=0; i<Children.size(); i++)
      { Children.get(i).Draw(); } 
    }
    popMatrix();
  }
  
  
} // end class gfxrange




// Graphics Select Range class
// ---------------------------
// Use this class to display graphics selectively depending on the distance of camera to object
class gfxselrange extends gfxrange
{
  float SelRange, RefSelRange;
  ArrayList<viselem> SelIn, SelOut;
  
  gfxselrange(PVector p, float a, float s, float r, float sr)
  { super(p, a, s, r); SelRange = sr; }
  
  void UpdateRange()
  {
    super.UpdateRange();
    RefSelRange = SelRange * Dir.mag();
  }
  
  void Draw()
  {
    pushMatrix();
    translate(Pos.x, Pos.y);
    rotate(Angle);
    scale(Scale);
    UpdateRange();
    float dist = Ref.mag();
    if(dist <= ViewRange + RefRange)
    {
      DrawThis();
      for(int i=0; i<Children.size(); i++)
      { Children.get(i).Draw(); }
      if(dist <= RefSelRange) for(int i=0; i<SelIn.size(); i++)
      { SelIn.get(i).Draw(); }
      else for(int i=0; i<SelOut.size(); i++)
      { SelOut.get(i).Draw(); }
    }
    popMatrix();
  }
}


class gfxselscale extends gfxrange
{
  float SelScale, RefSelScale;
  ArrayList<viselem> SelCon, SelExp;
  
  gfxselscale(PVector p, float a, float s, float r, float ss)
  { super(p, a, s, r); SelScale = ss; }
  
  void UpdateRange()
  {
    super.UpdateRange();
    RefSelScale = SelScale * Dir.mag();
  }
  
  void Draw()
  {
    pushMatrix();
    translate(Pos.x, Pos.y);
    rotate(Angle);
    scale(Scale);
    UpdateRange();
    if(Ref.mag() <= ViewRange + RefRange)
    {
      DrawThis();
      for(int i=0; i<Children.size(); i++)
      { Children.get(i).Draw(); }
      if(Dir.mag() <= RefSelScale) for(int i=0; i<SelCon.size(); i++)
      { SelCon.get(i).Draw(); }
      else for(int i=0; i<SelExp.size(); i++)
      { SelExp.get(i).Draw(); }
    }
    popMatrix();
  }
}

