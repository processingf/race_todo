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
 * gfxcamera.pde - Graphics camera class which can be used to control the display of a scene
 * This file is part of the Racemag game using Processing.
 */


// Global Constants
// ----------------
PVector ViewSz    = new PVector(width/2, height/2);  // Gives the 1/2 size of display
float   ViewRange = ViewSz.mag();                    // Gevs the length of 1/2 diagonal of display


// Graphics Camera class
// ---------------------
// Use this class to control the view of a scene
class gfxcamera extends gfxelem
{
  PVector Ref;       // Relative position of camera position (new) wrt position (old)
  PVector Dir;       // Direction vector pointed by the camera position (new) wrt position (old) * scaling factor
  PVector Abs;       // Absolute position of camera position (old)
  float   RefAngle;  // Relative angle of camera position (new) wrt position (old)
  float   AbsAngle;  // Absolute angle of camera position (old)
  
  
  // Constructor (position, angle, scale)
  // ------------------------------------
  // Creates a new gfxcamera class object at specified position, angle and scale
  // Camera can be attached to any viselem object that supports attachment
  // In such a case, the camera will automatically follow the viselem object
  gfxcamera(PVector p, float a, float s)
  {
    super(p, a, s);
    Ref = new PVector();
    Dir = new PVector();
    Abs = new PVector();
  }
  
  
  // Draw This ()
  // ------------
  // Captures camera location (used if camera is attached to a viselem object)
  void DrawThis()
  {
    Ref.x = modelX(0, 0, 0) - ViewSz.x;
    Ref.y = modelY(0, 0, 0) - ViewSz.y;
    Dir.x = modelX(1, 0, 0) - ViewSz.x - Ref.x;
    Dir.y = modelY(1, 0, 0) - ViewSz.y - Ref.y;
    RefAngle = Dir.heading();
    AbsAngle += RefAngle;
    Abs.add(Ref);
  }
  
  
  // Begin View ()
  // -------------
  // Use this before drawing a scene, when using camera
  void BeginView()
  {
    pushMatrix();
    translate(ViewSz.x, ViewSz.y);
    scale(Scale);
    rotate(-AbsAngle);
    translate(-Abs.x, -Abs.y);
  }
  
  
  // End View ()
  // -----------
  // Use this after drawing a scene, when using camera
  void EndView() {}


} // end class gfxcamera


