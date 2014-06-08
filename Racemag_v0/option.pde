class option
{
  IntDict Map;
  
  // option setting file
  final String OptionsFile = "options.xml";
  
  option()
  { Map = new IntDict(); }
  
  void Load(XML xml)
  {
    XML[] t = xml.getChildren("option");
    for(int i=0; i<t.length; i++)
    {
      String id = t[i].getString("id");
      int value = t[i].getInt("value");
      Map.set(id, value);
    }
  }
  
  void Load()
  {
    XML xml = loadXML(OptionsFile);
    Load(xml);
  }
  
  int Get(String id)
  { return Map.get(id); }  
}

option Option = new option();

