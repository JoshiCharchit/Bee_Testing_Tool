final int state_SERIAL_NOT_CONNECTED=-1;
final int state_RBRES_WAIT=0;
final int state_DISCONNECT_WAIT=1;
final int state_CLEAR_SEND=2;
final int state_CLEAR_DONE=3;

int state = 0;
void runStateMachine(String msg)
{
 switch(state)
 {
   case(state_SERIAL_NOT_CONNECTED):
    if(serialConnected)
        setState(state_RBRES_WAIT);
   break;
   case(state_RBRES_WAIT):
     if(msg.contains("RBRES:"))
         setState(state_DISCONNECT_WAIT);
   break;
   case(state_DISCONNECT_WAIT):
     if(msg.contains("DISCONNECT") || msg.contains("SLEEPING") )
         setState(state_CLEAR_SEND);
   break;
   case(state_CLEAR_SEND):
         delay(4000);
         myPort.write("RBCFG:VVRMT;PRF,600,NM;00023$");
         setState(state_CLEAR_DONE);
   break;
   case(state_CLEAR_DONE):
         closePort();
        setState(state_SERIAL_NOT_CONNECTED);
   break;
   default:
   break;
 }
  
}

void setState(int _state)
{
  state = _state;
}
