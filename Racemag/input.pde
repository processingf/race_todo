class input
{
  int[] Map;
  String[] Name; 
  boolean[] Active;
  
  // key constants
  final int MENU = 01;
  final int UP = 10;
  final int DOWN = 11;
  final int LEFT = 12;
  final int RIGHT = 13;
  final int TURNP = 14;
  final int TURNN = 15;
  final int ZOOMP = 16;
  final int ZOOMN = 20;
  final int SELECT = 21;
  final int CONTEXT = 22;

  // input setting files
  final String NamesFile = "key_names.xml";
  final String MappingFile = "key_mapping.xml";
  
  input()
  {
    Map = new int[256];
    Name = new String[256];
    ClearActive();
  }
  
  void ClearActive()
  { Active = new boolean[64]; }

  void LoadNames(XML xml)
  {
    XML[] keyXml = xml.getChildren("keyname");
    for(int i=0; i<keyXml.length; i++)
    {
      int id = keyXml[i].getInt("id");
      String value = keyXml[i].getString("value");
      Name[id] = value;
    }
  }

  void LoadMapping(XML xml)
  {
    XML[] mapXml = xml.getChildren("keymap");
    for(int i=0; i<mapXml.length; i++)
    {
      int id = mapXml[i].getInt("id");
      int value = mapXml[i].getInt("value");
      Map[id] = value;
    }
  }
  
  void Load()
  {
    LoadNames(loadXML(NamesFile));
    LoadMapping(loadXML(MappingFile));
  }
  
  void SaveMapping(XML xml)
  {
    for(int i=0; i<Map.length; i++)
    {
      if(Map[i] == 0) continue;
      XML mapXml = xml.addChild("keymap");
      mapXml.setInt("id", i);
      mapXml.setInt("value", Map[i]);
    }
  }
  
  void Save()
  {
    String xmlStr = "<?xml version=\"1.0\"?>\n"+"<key_mapping>\n"+"</key_mapping>\n";
    XML xml = parseXML(xmlStr);
    SaveMapping(xml);
    saveXML(xml, "data\\"+MappingFile);
  }
}

input Input = new input();

void keyPressed()
{ Input.Active[Input.Map[keyCode]] = true; }

void keyReleased()
{ Input.Active[Input.Map[keyCode]] = false; }

