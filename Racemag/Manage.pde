void Update()
{
  input i = Input;
  if(i.Active[i.P1_FWD]) CamP1.Y -= 4;
  if(i.Active[i.P1_REAR]) CamP1.Y += 4;
  if(i.Active[i.P1_LEFT]) CamP1.X -= 4;
  if(i.Active[i.P1_RIGHT]) CamP1.X += 4;
  if(i.Active[i.P2_LEFT]) CamP1.Angle += 0.05;
  if(i.Active[i.P2_RIGHT]) CamP1.Angle -= 0.05;
  if(i.Active[i.P2_FWD]) CamP1.Scale += 0.05;
  if(i.Active[i.P2_REAR]) CamP1.Scale -= 0.05;
  CamP1.BeginView();
  Level.Draw(CamP1.View);
  CamP1.EndView();
  CamP1.Draw();
}
