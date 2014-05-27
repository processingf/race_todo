Minim minim = new Minim(this);
PImage BackImg, RoadImg;
uicamera CamP1;

void Init()
{
  textSize(24);
  Input.Load();
  Option.Load();
  UiMap.Load("map\\map0.xml");
  UiMap.Sound.get("bckmusic").play();
  CamP1 = new uicamera(100, 100, 500, 500);
  CamP1.Absolute = true;
  BackImg = loadImage("image\\background\\CatFight.jpg");
}

void LoadPlayers()
{
//  Player1 = new car("Rinku", CarImg[0]);
//  Player2 = new car("Rony", CarImg[1]);
}

