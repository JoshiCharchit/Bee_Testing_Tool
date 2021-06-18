/*Display all Text Fields for Bee Configuration*/

int LOGS_BOX_HEIGHT =  200;

void console(String msg)
{
  //pointion at bottom displaying device messages updating that part on each message
  
  //GREY Border before logging
  fill(128,128,128);
  rect(0,height-LOGS_BOX_HEIGHT-30,width,LOGS_BOX_HEIGHT-30);

  //display the updated state
  fill(247,247,247);
  text(explainState(state),10, height - LOGS_BOX_HEIGHT - 10);

  //black background
  fill(10,18,15);
  rect(0,height-LOGS_BOX_HEIGHT,width,LOGS_BOX_HEIGHT);
  
  //Device prints
  fill(247,247,247);
  text(msg, 10,height - LOGS_BOX_HEIGHT + 35);
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
      return "Waiting for \"Disconnect\"";
    case(state_CLEAR_SEND):
      return "Clearing the Device";
   // break;
    case(state_CLEAR_DONE):
      return "Device is Cleared! Yeppy";
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
  // to load successfully
}
