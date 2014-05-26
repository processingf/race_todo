class const
{
  IntDict Map;
  
  const()
  { Map = new IntDict(); }
  
  void Load(XML xml)
  {
    XML[] t = xml.getChildren("const");
    for(int i=0; i<t.length; i++)
    {
      String id = t[i].getString("id");
      int value = t[i].getInt("value");
      Map.set(id, value);
    }
  }
  
  void Get(String id)
  { return Map.get(id); }  
}

const Const = new const();

