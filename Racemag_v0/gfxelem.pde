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
 * gfxelem.pde - Define a root graphics element with associated functions
 * This file is part of the Racemag game using Processing.
 */


class gfxelem
{


  // data
  float X, Y, Range;
  float Angle, Scale;
  boolean Active, Drawn;
  gfxelem[] Children;
  gfxelem Parent;


  // constants
  final int Flags = 0x1;
  

  // initialization
  gfxelem(float x, float y, float a, float s, float r)
  {
    X = x; Y = y; Range = r;
    Angle = a; Scale = s;
  }
  

  // functions
  float[] GetDirection(float off)
  { return new float[]{cos(Angle+off), sin(Angle+off)}; }
  
  void MoveDirection(float x, float y)
  {
    X += x*cos(Angle) - y*sin(Angle);
    Y += y*cos(Angle) + x*sin(Angle);
  }
  
  float GetFastDistanceTo(float x, float y)
  { return abs(X - x) + abs(Y - y); }
  
  float GetDistanceTo(float x, float y)
  { return sqrt((X-x)*(X-x) + (Y-y)*(Y-y)); }
  
  void AddChild(gfxelem child)
  {
    child.Parent = this;
    if(Children == null) Children = new gfxelem[0];
    Children = (gfxelem[]) append(Children, child);
  }
  
  boolean Supports(int type)
  { return (type & Flags) > 0; }

  
  void PrepareThis() {}
  
  void Prepare()
  {
    if(!Active) return;
    Drawn = false;
    PrepareThis();
    if(Children == null) return;
    for(int i=0; i<Children.length; i++)
    { Children[i].Prepare(); }
  }
  
  void UpdateThis(PGraphics v) {}
  
  void DrawThis(PGraphics v) {}
  
  void Draw(PGraphics v)
  {
    if(!Active || Drawn) return;
    Drawn = true;
    v.pushMatrix();
    v.translate(X, Y);
    v.rotate(Angle);
    v.scale(Scale);
    UpdateThis(v);
    DrawThis(v);
    if(Children != null)
    {
      for(int i=0; i<Children.length; i++)
     { Children[i].Draw(v); } 
    }
    v.popMatrix();
  }


} // end class gfxelem

