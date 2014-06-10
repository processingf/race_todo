class viselem
{
  // data
  PVector Pos;
  ArrayList<viselem> Children;
  viselem Parent;
  final int Flags = 0x0000; 
  
  
  // functions
  viselem(PVector p)
  { Pos = p; Children = new ArrayList(); }

  void AddChild(viselem child)
  { child.Parent = this; Children.add(child); }
  
  void DrawThis() {}
  
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
