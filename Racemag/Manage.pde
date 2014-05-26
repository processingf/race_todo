void Update()
{
  input i = Input;
  image(BackImg, 0, 0, 800, 600);
  if(i.Active[i.P1_FWD]) CamP1.MoveDirection(0, -4); 
  if(i.Active[i.P1_REAR]) CamP1.MoveDirection(0, 4);
  if(i.Active[i.P1_LEFT]) CamP1.MoveDirection(-4, 0);
  if(i.Active[i.P1_RIGHT]) CamP1.MoveDirection(4, 0);
  if(i.Active[i.P2_FWD]) CamP1.Scale += 0.01;
  if(i.Active[i.P2_REAR]) CamP1.Scale -= 0.01;
  if(i.Active[i.P2_LEFT]) CamP1.Angle -= 0.01;
  if(i.Active[i.P2_RIGHT]) CamP1.Angle += 0.01;
  CamP1.BeginView();
  CamP1.View.background(255);
  UiMap.Update();
  UiMap.Draw(CamP1.View);
  CamP1.EndView();
  CamP1.Draw();
}
