import processing.serial.*;
import interfascia.*;
GUIController c;

IFButton PRF, rConn;
IFButton RST, TMP1, TMP2, AMB, BLESL, BLES2, SHK;

IFButton comB[]=new IFButton[10];
PFont f;

int totalSerial;
int portSelected=-1;
Serial myPort;
String portName=null;
String targetSerialPort="";
boolean serialConnected = false;
String strmsg;
String msg = "";
void setup()
{
  size(800,800,P2D);
  
  
  c = new GUIController (this);
  
  PRF = new IFButton ("PRF", 10, 30, 60, 20);
  RST = new IFButton ("RST", 10, 60, 60, 20);
  rConn = new IFButton ("refresh ports", 105, 0, 120, 20);
  TMP1 = new IFButton ("TMP,1", 10, 90, 60, 20);
  TMP2 = new IFButton ("TMP,2", 10, 120, 60, 20);
  AMB = new IFButton ("AMB", 10, 150, 60, 20);
  BLESL = new IFButton ("BLESL", 10, 180, 60, 20);
  BLES2 = new IFButton ("BLES2", 10, 210, 60, 20);
  SHK = new IFButton ("SHK", 10, 240, 60, 20);
  PRF.addActionListener(this);
  RST.addActionListener(this);
  TMP1.addActionListener(this);
  TMP2.addActionListener(this);
  AMB.addActionListener(this);
  BLESL.addActionListener(this);
  BLES2.addActionListener(this);
  SHK.addActionListener(this);
  //rConn.addActionListener(this);
  
  c.add (PRF);
  c.add (rConn);
  c.add (RST);
  c.add (TMP1);
  c.add (TMP2);
  c.add (AMB);
  c.add (BLESL);
  c.add (BLES2);
  c.add (SHK);
  
  
  f = createFont("SourceCodePro-Regular.vlw", 12);
  textFont(f);
  background(255);
  console("");
  runStateMachine("");
  loadSerial();
}
void draw()
{
  background(245,247,168);
  serialCheck();
  //showSerial();
  displayMenu();
  if(portSelected != -1)
  if(myPort.available()>0)
    {
      //background(255);
      msg= serialData();
      console(msg);
      runStateMachine(msg);
    }else
    {
      console(msg);
      runStateMachine(msg);
    }
   if(portSelected != -1)
     {
       fill(42,192,212);
       noStroke();
       ellipse(240, 120+portSelected*20+11, 8,8);
     }
}


void serialCheck()
{
 // printArray(Serial.list());
if(portSelected != -1)
  portName = Serial.list()[portSelected];
else 
  portName = null;
 // print(portName);

  if(serialConnected != true && portName != null)
    {
      print("Found Port\n");
      delay(2000);
      myPort = new Serial(this, portName, 9600);
      serialConnected = true;
    }
}
void closePort()
{
   serialConnected = false;
   portSelected = -1;
  myPort.stop();
  
}
String serialData()
{
  strmsg = "nothing heard on port\r\n";
  if(serialConnected)
  {
   while(myPort.available()>0)
   {
    strmsg = myPort.readStringUntil('\n'); 
    println(strmsg);
   }
  }
  return strmsg;
}

void keyPressed()
{
  if(key>='0' && key<='9' && !serialConnected && portSelected==-1)
  {
    
    portSelected = key-'0';
    
  }
}

void actionPerformed (GUIEvent e) 
{
  if (e.getSource() == PRF) 
  {
   // background(100, 155, 100);
     myPort.write("RBCFG:VVRMT;PRF,600,NM;00023$");
  } 
  else if (e.getSource() == RST)
  {
    myPort.write("RBCMD:VVRMT;RST,1,1;33333$"); 
  }
  
  else if (e.getSource() == TMP1)
  {
    myPort.write("RBCFG:VVRMT;TMP,1,10.5,30.6;00020$"); 
  }
  else if (e.getSource() == TMP2)
  {
    myPort.write("RBCFG:VVRMT;TMP,2,10.5,30.6;00020$"); 
  }
  else if (e.getSource() == AMB)
  {
    myPort.write("RBCFG:VVRMT;AMB,1,10,70;00020$"); 
  }
  else if (e.getSource() == BLESL)
  {
    myPort.write("RBCFG:VVRMT;BLE,1,SL;10005$"); 
  }
else if (e.getSource() == BLES2)
  {
    myPort.write("RBCFG:VVRMT;BLE,1,S2;10005$"); 
  }
  else if (e.getSource() == SHK)
  {
    myPort.write("RBCFG:VVRMT;SHK,2,3,2000,50;33333$"); 
  }
  else if (e.getSource() == rConn)
  {
      //background(42,192,212);
      closePort();
      loadSerial();
  }
  
 for(int i=0;i<10;i++)
   {
     if(comB[i]!=null)
     {
       if (e.getSource() == comB[i])
           {
             //println("selected "+i);
              portSelected = i;
           }
     }
   }
}

void loadSerial()
{
   int i = Serial.list().length;
   totalSerial = i;
   if(i>10)//no more than 10 ports supported
     i=10;
   for(int k =0;k<i;k++)
   {
     comB[k] = new IFButton(Serial.list()[k], 250,120+k*20,220,20);
     comB[k].addActionListener(this);
     c.add(comB[k]);
    // text("[", 10, height-150+k*12); text(k, 17, height-150+k*12); text("]", 25, height-150+k*12);
    // text(Serial.list()[k], 35, height-150+k*12);
   }
}
