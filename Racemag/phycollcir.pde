class phycollcir extends phyelem
{
  // data
  final int Flags = 0x0201; 
  
  // functions
  phycollcir(PVector p, float r, viselem b, phyhandler h)
  { super(p, r, b, h); }
  
  void ProcessThis(phyelem phy)
  {
    ArrayList<viselem> ch=Children, ch2=phy.Children;
    if(ch.size() == 0 && ch2.size() == 0)
    { ((phycollcirhandler)Handler).OnCollision(this, (phycollcir)phy); }
    else if(ch.size() == 0) Process(ch2);
    else if(ch2.size() == 0) phy.Process(ch);
    else for(int j=0; j<ch.size(); j++)
    { ((phyelem)ch.get(j)).Process(ch2); }
  }
  
} // end class phycollcir

