class tag
{
  XML Xml;
  
  tag(XML xml)
  { Xml = xml; }
  
  Integer GetInt(String attr)
  { return (xml.hasAttribute(attr))? new Integer(xml.getInt(attr)) : null; }
  
  Float GetFloat(String attr)
  { return (xml.hasAttribute(attr))? new Float(xml.getFloat(attr)) : null; }
  
  String GetString(String attr)
  { return (xml.hasAttribute(attr))? xml.getString(attr) : null; }
  
  Boolean GetBoolean(String attr)
  { return (xml.hasAttribute(attr))? new Boolean(xml.getString(attr).equalsIgnoreCase("true")) : null; }
  
  Integer GetHexInt(String attr)
  { return (xml.hasAttribute(attr))? new Integer((int)Long.parseLong(xml.getString(attr), 16)) : null; }
}

