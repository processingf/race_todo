class phyelem extends viselem
{
  // data
  PVector Ref, Dir;
  viselem BelongsTo;
  float Range, RefRange;
  phyhandler Handler;
  final int Flags = 0x0200; 
  
  // functions
  phyelem(PVector p, float r, viselem b, phyhandler h)
  {
    super(p); Range = r;
    Ref = new PVector();
    Dir = new PVector();
    BelongsTo = b; Handler = h;
  }
  
  void DrawThis()
  {
    // capture coords
    Ref.x = modelX(0, 0, 0);
    Ref.y = modelY(0, 0, 0);
    Dir.x = modelX(1, 0, 0) - Ref.x;
    Dir.y = modelY(1, 0, 0) - Ref.y;
    RefRange = Range * Dir.mag();
  }
  
  void ProcessThis(phyelem phy) {}
  
  void Process(ArrayList<viselem> phys)
  {
    for(int i=0; i<phys.size(); i++)
    {
      phyelem phy = (phyelem) phys.get(i);
      if(Ref.dist(phy.Ref) <= (RefRange + phy.RefRange))
      { ProcessThis(phy); }
    }
  }
  
} // end class phyelem

