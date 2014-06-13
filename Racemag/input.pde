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
 * input.pde - Input management class with single access object
 * This file is part of the Racemag game using Processing.
 */


// Input management class
// ----------------------
// A single access object of this class is to be created
class input
{

  
  // Data
  // ----
  boolean[]    On;       // Get if key if active (pressed)
  String []    Name;     // Get key name [from key code]
  int    []    Control;  // Get control [from key code]
  boolean      AutoOff;  // Set automatic deactivation of key on release
  inputhandler Handler;  // Set inputhandler object that can receive events
  
  
  // Key Code Constants
  // ------------------
  final int MOUSE_LEFT   = 1;  // Mouse button left
  final int MOUSE_RIGHT  = 2;  // Mouse button right
  final int MOUSE_MIDDLE = 3;  // Mouse button middle
  final int MOUSE_WHEELP = 4;  // Mouse wheel + 
  final int MOUSE_WHEELN = 5;  // Mouse wheel -
  
  
  // Control Constants
  // -----------------
  final int MENU    = 01;  // Open menu
  final int UP      = 10;  // Scroll up
  final int DOWN    = 11;  // Scroll down
  final int LEFT    = 12;  // Scroll left
  final int RIGHT   = 13;  // Scroll right
  final int TURNP   = 14;  // Turn clockwise
  final int TURNN   = 15;  // Turn anti-clockwise
  final int ZOOMP   = 16;  // Zoom in
  final int ZOOMN   = 20;  // Zoom out
  final int SELECT  = 21;  // Select object
  final int CONTEXT = 22;  // Context options
  
  
  // Input Setting Files
  // -------------------
  final String NamesFile    = "key_names.xml";
  final String ControlsFile = "key_controls.xml";
  
  
  // Constructor
  // -----------
  // Create a new input class object.
  // Note: Only one object is (to be) created
  input()
  {
    On      = new boolean[64];
    Name    = new String [256];
    Control = new int    [256];
  }
  
  
  // Load Names (xmlObject)
  // ----------------------
  // Loads Key Names from an XML object
  void LoadNames (XML xml)
  {
    XML[] tag = xml.getChildren("keyname");
    for(int i=0; i<tag.length; i++)
    {
      int    id    = tag[i].getInt   ("id");
      String value = tag[i].getString("value");
      Name[id] = value;
    }
  }
  
  
  // Load Controls (xmlObject)
  // -------------------------
  // Loads Controls from an XML object
  void LoadControls(XML xml)
  {
    XML[] tag = xml.getChildren("keycontrol");
    for(int i=0; i<tag.length; i++)
    {
      int id    = tag[i].getInt("id");
      int value = tag[i].getInt("value");
      Control[id] = value;
    }
  }
  
  
  // Load (xmlObject)
  // ----------------
  // Loads Key Names and Controls from specified XML files
  void Load()
  {
    LoadNames   (loadXML(NamesFile));
    LoadControls(loadXML(ControlsFile));
  }
  
  
  // Save Controls (xmlObject)
  // -------------------------
  // Save Controls to an XML object
  void SaveControls(XML xml)
  {
    for(int i=0; i<Control.length; i++)
    {
      if(Control[i] == 0) continue;
      XML tag = xml.addChild("keycontrol");
      tag.setInt("id"   , i);
      tag.setInt("value", Control[i]);
    }
  }
  
  
  // Save (xmlObject)
  // ----------------
  // Save Controls to specified XML file
  void Save()
  {
    String xmlStr = "<?xml version=\"1.0\"?>\n"+
                    "<key_controls>\n"+
                    "</key_controls>\n";
    XML xml = parseXML(xmlStr);
    SaveControls(xml);
    saveXML(xml, "data\\"+ControlsFile);
  }


} // end class input


// Input: Single Access Object
// ---------------------------
// All input related actions must be performed on this object
input Input = new input();


// Key Press Handler
// -----------------
// Sets the control associated with a key and calls the event handler
void keyPressed()
{
  Input.On[Input.Control[keyCode]] = true;
  if(Input.Handler != null)
  {  Input.Handler.OnKeyPress(keyCode, Input.Control[keyCode], key);  }
}


// Key Release Handler
// -------------------
// Clears the control associated with a key and calls the event handler
void keyReleased()
{
  Input.On[Input.Control[keyCode]] = false;
  if(Input.Handler != null)
  {  Input.Handler.OnKeyRelease(keyCode, Input.Control[keyCode], key);  }
}


// Mouse Press Handler
// -------------------
// Sets the control associated with a mouse button and calls the event handler
void mousePressed()
{
  int code = 0;
  switch(mouseButton)
  {
    case LEFT:   code = Input.MOUSE_LEFT;   break;
    case RIGHT:  code = Input.MOUSE_RIGHT;  break;
    case CENTER: code = Input.MOUSE_MIDDLE; break;
  }
  Input.On[Input.Control[code]] = true;
  if(Input.Handler != null)
  {  Input.Handler.OnMousePress(code, Input.Control[code]);  }
}


// Mouse Release Handler
// -------------------
// Clears the control associated with a mouse button and calls the event handler
void mouseReleased()
{
  int code = 0;
  switch(mouseButton)
  {
    case LEFT:   code = Input.MOUSE_LEFT;   break;
    case RIGHT:  code = Input.MOUSE_RIGHT;  break;
    case CENTER: code = Input.MOUSE_MIDDLE; break;
  }
  Input.On[Input.Control[code]] = false;
  if(Input.Handler != null)
  {  Input.Handler.OnMouseRelease(code, Input.Control[code]);  }
}


// Mouse Wheel Handler
// -------------------
// Sets the control associated with mouse wheel +/- and calls the event handler
void mouseWheel(MouseEvent event)
{
  float roll = event.getCount();
  int   code = (roll >= 0)? Input.MOUSE_WHEELP : Input.MOUSE_WHEELN;
  Input.On[Input.Control[code]] = true;
  if(Input.Handler != null)
  {  Input.Handler.OnMouseWheel(code, Input.Control[code], roll);  }
}


// Input Update ()
// ---------------
// Clears control associated with mouse wheel +/- per call (frame)
void InputUpdate()
{
  Input.On[Input.Control[Input.MOUSE_WHEELP]] = false;
  Input.On[Input.Control[Input.MOUSE_WHEELN]] = false;
}


// Input handler class
// -------------------
// Extend this class to create an input (event) handler object
// Set Input.Handler = input handler object to receive events
// Set Input.Handler = null to stop receiving events
class inputhandler
{
  void OnKeyPress     (int code, int control, char key)   {}
  void OnKeyRelease   (int code, int control, char key)   {}
  void OnMousePress   (int code, int control)             {}
  void OnMouseRelease (int code, int control)             {}
  void OnMouseWheel   (int code, int control, float roll) {}
}


