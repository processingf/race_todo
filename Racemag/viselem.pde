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
 * viselem.pde - Visual element class (root) which can be extended to implement complex visual classes
 * This file is part of the Racemag game using Processing.
 */


// Visual Element class
// --------------------
// Use this class to define complex visual classes
class viselem
{


  // Data
  // ----
  PVector            Pos;       // Position (relative to current origin) in X, Y
  ArrayList<viselem> Children;  // Visual elements that are drawn (after) relative to this object
  viselem            Parent;    // Visual element relative to which this object is drawn
  
  
  // Constants
  // ---------
  final int Flags = 0x0000;  // Defines the properties of visual element class
  
  
  // Constructor (position)
  // ----------------------
  // Creates a new viselem class object at specified relative position
  viselem(PVector pos)
  {
    Pos      = pos;
    Children = new ArrayList();
  }
  
  
  // Add Child (child)
  // ----------------------
  // Adds a viselem object as a child to this object
  void AddChild(viselem child)
  {
    child.Parent = this;
    Children.add(child);
  }
  
  
  // Draw This ()
  // ------------
  // Draws this object (in extended classes)
  void DrawThis() {}
  
  
  // Draw ()
  // ------------
  // Draws this object and all its children
  void Draw()
  {
    pushMatrix();
    translate(Pos.x, Pos.y);
    DrawThis();
    for(int i=0; i<Children.size(); i++)
    { Children.get(i).Draw(); }
    popMatrix();
  }
  
  
} // end class viselem


