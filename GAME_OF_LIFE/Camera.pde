class Cam
{
  float mx;
  float my;
  float staticX;
  float staticY;
  float zoom;
  float zoomspeed;
  float rotationY;
  float rotationX;
  float rotspeed;
  Cam()
  {
    rotspeed = 5;
    zoomspeed = 10;
  }
  
  void runCam()
  {
    
    if(mousePressed && mouseButton == LEFT)
    {
      mx = mouseX;
      my = mouseY;
      staticX = mx;
      staticY = my;
      camera(mouseX, mouseY, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
    }
    
    else
      camera(staticX,staticY,(height/2)/tan(PI/6)+zoom,width/2.0,height/2.0,0,0,1,0);
    
    
    
    
    
    if(keyPressed)
    {
      if(keyCode == UP)rotationX  += rotspeed;
      else if(keyCode == DOWN)rotationX  -= rotspeed;
      else if(keyCode == LEFT)rotationY  += rotspeed;
      else if(keyCode == RIGHT)rotationY  -= rotspeed;
      else if(key == 'z')zoom-=zoomspeed;
      else if(key == 'x')zoom+=zoomspeed;
      else if(key == 'r')
      {
        rotationY = 0;
        rotationX = 0;
      }
    }
    translate(width/2,height/2,0);
    rotateY(radians(rotationY));
    rotateX(radians(rotationX));
    translate(-width/2,-height/2,0);
      
  }
}
