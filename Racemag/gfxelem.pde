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
 * gfxelem.pde - Graphics element class (basic) which can be extended to implement complex graphics classes
 * This file is part of the Racemag game using Processing.
 */


// Graphics element class
// ----------------------
// Use this class to define complex graphics classes
class gfxelem extends viselem
{


  // Data
  // ----
  float Angle;  // Angle relative to origin around position (x, y)
  float Scale;  // Scaling factor of the object relative to origin
  
  
  // Constants
  // ---------
  final int Flags = 0x0100;  // Defines the properties of graphics element class
  
  
  // Constructor (position, angle, scale)
  // ------------------------------------
  // Creates a new gfxelem class object at specified relative position, angle and scale
  gfxelem(PVector pos, float angle, float scale)
  {
    super(pos);
    Angle = angle;
    Scale = scale;
  }
  
  
  // Get Direction (offset)
  // ----------------------
  // Gets a unit vector in the direction of the gfxobject with angle offset
  PVector GetDirection(float off)
  { return PVector.fromAngle(Angle+off); }
  
  
  // Move in a direction (distance, offset)
  // --------------------------------------
  // Moves this gfxelem a specified distance in the pointed direction with angle offset
  void MoveDirection(float d, float off)
  { Pos.add(PVector.mult(GetDirection(off), d)); }
  
  
  // Draw ()
  // -------
  // Draws this object and all its children
  void Draw()
  {
    pushMatrix();
    translate(Pos.x, Pos.y);
    rotate(Angle);
    scale (Scale);
    DrawThis();
    for(int i=0; i<Children.size(); i++)
    { Children.get(i).Draw(); } 
    popMatrix();
  }
  
  
} // end class gfxelem


