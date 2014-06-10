interface phycollcirhandler
{
  void OnCollision(phycollcir p1, phycollcir p2);
}

class abc implements phycollcirhandler
{
  void OnCollision(phycollcir phy1, phycollcir phy2){} 
}

