class input
{
  int[] KeyMap;
  String[] KeyName; 
  boolean[] Active;
  IntDict KeyCode, InpCode;
  
  // key constants
  final int MENU = 01;
  final int P1_FWD = 10;
  final int P1_REAR = 11;
  final int P1_LEFT = 12;
  final int P1_RIGHT = 13;
  final int P1_NITRO = 14;
  final int P1_POWER1 = 15;
  final int P1_POWER2 = 16;
  final int P2_FWD = 20;
  final int P2_REAR = 21;
  final int P2_LEFT = 22;
  final int P2_RIGHT = 23;
  final int P2_NITRO = 24;
  final int P2_POWER1 = 25;
  final int P2_POWER2 = 26;

  // input setting files
  final String KeyNamesFile = "key_names.xml";
  final String InpNamesFile = "inp_names.xml";
  final String KeyMappingFile = "key_mapping.xml";
  
  input()
  {
    KeyMap = new int[256];
    KeyName = new String[256];
    ClearActive();
    KeyCode = new IntDict();
    InpCode = new IntDict();
  }
  
  void ClearActive()
  { Active = new boolean[256]; }

  void LoadKeyNames(XML xml)
  {
    XML[] keyXml = xml.getChildren("keyname");
    for(int i=0; i<keyXml.length; i++)
    {
      int id = keyXml[i].getInt("id");
      String value = keyXml[i].getString("value");
      KeyName[id] = value;
      KeyCode.set(value, id);
    }
  }
  
  void LoadInpNames(XML xml)
  {
    XML[] inpXml = xml.getChildren("inpname");
    for(int i=0; i<inpXml.length; i++)
    {
      int id = inpXml[i].getInt("id");
      String value = inpXml[i].getString("value");
      InpCode.set(value, id);
    }
  }
    
  void LoadKeyMap(XML xml)
  {
    XML[] mapXml = xml.getChildren("keymap");
    for(int i=0; i<mapXml.length; i++)
    {
      String keyNm = mapXml[i].getString("keyname");
      String inpNm = mapXml[i].getString("inpname");
      KeyMap[KeyCode.get(keyNm)] = InpCode.get(inpNm);
    }
  }
  
  void Load()
  {
    LoadKeyNames(loadXML(KeyNamesFile));
    LoadInpNames(loadXML(InpNamesFile));
    LoadKeyMap(loadXML(KeyMappingFile));
  }
}

input Input = new input();

void keyPressed()
{ /*ActiveKey[KeyMap[keyCode]] = true;*/ Cursor.Text = ""+Input.KeyMap[keyCode]; }

void keyReleased()
{ /*ActiveKey[KeyMap[keyCode]] = false;*/ }

