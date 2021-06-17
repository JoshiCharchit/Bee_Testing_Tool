/*Display all Text Fields for Bee Configuration*/


void console(String msg)
{
  //pointion at bottom displaying device messages updating that part on each message
  fill(7,10,7);
  text("console:",5,height-60);
  fill(10,18,15);
  rect(0,height-50,width,50);
  fill(247,247,247);
  text(msg, 10,height-35);
  //display state
  fill(33,91,117);
  text(explainState(state),10, height-20);
}
String explainState(int state)
{
  switch(state)
  {
    case(state_SERIAL_NOT_CONNECTED):
      return "Serial not connected";
   // break;
    case(state_RBRES_WAIT):
      return "Waiting for RBRES";
    //break;
    case(state_DISCONNECT_WAIT):
      return "waiting for \"Disconnect\"";
    case(state_CLEAR_SEND):
      return "clearing device";
   // break;
    case(state_CLEAR_DONE):
      return "clear Done";
   // break;
  }
  return "";
}
/*
void showSerial()
{
   fill(255);
   rect(0,height-190,width,70);
   fill(0);
   text("Select the number for serial Port your device is connected to:",15, height-175);
   int i = Serial.list().length;
   if(i>10)//no more than 10 ports supported
     i=10;
   for(int k =0;k<i;k++)
   {
     
     text("[", 10, height-150+k*12); text(k, 17, height-150+k*12); text("]", 25, height-150+k*12);
     text(Serial.list()[k], 35, height-150+k*12);
   }
}
*/
void displayMenu()
{
  
  fill(192,232,250);
  rect(0,1,100,17);
  fill(0);
  text(" Testing Tool",10,15);
 
}
