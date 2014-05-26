Minim minim = new Minim(this);
PImage BackImg, RoadImg;
uicamera CamP1;
uimap UiMap;

void Init()
{
  textSize(24);
  Input.Load();
  Input.Save();
  CamP1 = new uicamera(100, 100, 500, 500);
  UiMap.Load("map0.xml");
  UiMap.Sound.get("bckmusic").play();
  BackImg = loadImage("CatFight.jpg");
}

void LoadPlayers()
{
//  Player1 = new car("Rinku", CarImg[0]);
//  Player2 = new car("Rony", CarImg[1]);
}

