class phyhandler
{
}

class phycollcirhandler extends phyhandler
{
  void OnCollision(phycollcir p1, phycollcir p2) {}
}

class abc extends phycollcirhandler
{
  void OnCollision(phycollcir phy1, phycollcir phy2)
  {
    ((gfxrect)phy1.BelongsTo).EdgeColor ^= 0xFFFFFF;
  }
}

