PFont font;
PImage imgLock;
color COLOR = color(0,0,0);
int MIRROR_WIDTH = 1200;
int MIRROR_HEIGHT = 675;
int ICON_OFFSET = MIRROR_WIDTH/4;
int APP_OPEN = 0;
int MORE_OPEN = 0;
int INIT_Y = 100;
int buttonX;
int buttonY;
int moreSelOne = -1, moreSelTwo = -1, moreSelThree = -1, moreDumb = 0;
boolean moreLevel1 = false, moreLevel2 = false, moreLevel3 = false;
int moreButtonLength = 0;
int GUEST = 0;

int buttonsMore[][] = {{500, 426}, {500, 466}, {500, 506}};
int buttonsMoreSet[][] = {{500, 346}, {500, 386}, {500, 426}, {500, 466}, {500, 506}};
int buttonsMoreAcc[][] = {{500, 386}, {500, 426}, {500, 466}, {500, 506}};
int buttonsMoreSet1[][] = {{500, 426}, {500, 466}, {500, 506}};//Temperature
int buttonsMoreSet2[][] = {{500, 426}, {500, 466}, {500, 506}};//Language
int buttonsMoreSet3[][] = {{500, 386}, {500, 426}, {500, 466}, {500, 506}};//Reposition
int buttonsMoreSet4[][] = {{500, 306}, {500, 346}, {500, 386}, {500, 426}, {500, 466}, {500, 506}};//Color Scheme

String LANGUAGE = "EN"; //0 - English; 1 - Russian

Mirror mainMirror;

void setup(){
  
  mainMirror = new Mirror();
  imgLock = loadImage("lockscreen.jpg", "jpg");
  imgLock.loadPixels();
  
  size(1200, 675);
  background(200);
  
}
void draw() {
   
  mainMirror.draw();
}

class Mirror {
  //Apps apps;
  //MusicPlayer musicPlayer;
  More more;
  Lock lock;
  Info info;

  Mirror() {
    //apps = new Apps();
    //musicPlayer = new MusicPlayer();
    more = new More();
    info = new Info();
    lock = new Lock();
  }

  void draw() {
    //apps.draw();
    //musicPlayer.draw();
    more.draw();
    info.draw();
    lock.draw();
    
  }
}

class Lock{
  int ScreenLocked = 0;
  
  void draw(){
    imgLock.resize(15, 15);
    image(imgLock, ICON_OFFSET + 585, 562);
  }
}

class More {
  MoreWindow window;
  String user = "Hi, Wallace!";
  //int[][] buttons = { {ICON_OFFSET+500, 426}, {ICON_OFFSET+500, 466}, {ICON_OFFSET+500, 506}};
  
  PImage stopResetImage;
  String[] labels = new String[3];
  String[] labels11 = new String[4];
  String[] labels12 = new String[5];
  String[] labels121 = new String[3];//temperature
  String[] labels122 = new String[3];//language
  String[] labels123 = new String[4];//reposition
  String[] labels124 = new String[6];//color scheme

  More() {

  }

  void draw() {
    //window.draw();
    background (200);
    
    labels[0]=LANGUAGE.equals("RU") ? "Профили" : "Account";
    labels[1]=LANGUAGE.equals("RU") ? "Настройки" : "Settings";
    labels[2]=LANGUAGE.equals("RU") ? "Выход" : "Sign Out";
    
    labels11[0]="Wallace";
    labels11[1]="Joseph";
    labels11[2]=LANGUAGE.equals("RU") ? "Выход" : "Sign Out";
    labels11[3]=LANGUAGE.equals("RU") ? "Профили" : "Account";
    
    labels12[0]=LANGUAGE.equals("RU") ? "Температура" : "Temperature";
    labels12[1]=LANGUAGE.equals("RU") ? "Язык" : "Languages";
    labels12[2]=LANGUAGE.equals("RU") ? "Перемещение" : "Reposition";
    labels12[3]=LANGUAGE.equals("RU") ? "Цвет" : "Color Scheme";
    labels12[4]=LANGUAGE.equals("RU") ? "Настройки" : "Settings";
    
    labels121[0]="C";
    labels121[1]="F";
    labels121[2]=LANGUAGE.equals("RU") ? "Температура" : "Temperature";
    
    labels122[0]="English";
    labels122[1]="Русский";
    labels122[2]=LANGUAGE.equals("RU") ? "Язык" : "Languages";
    
    labels123[0]=LANGUAGE.equals("RU") ? "Слева" : "Left";
    labels123[1]=LANGUAGE.equals("RU") ? "Центр" : "Center";
    labels123[2]=LANGUAGE.equals("RU") ? "Справа" : "Right";
    labels123[3]=LANGUAGE.equals("RU") ? "Перемещение" : "Reposition";
    
    labels124[0]=LANGUAGE.equals("RU") ? "Желтый" : "Yellow";
    labels124[1]=LANGUAGE.equals("RU") ? "Синий" : "Blue";
    labels124[2]=LANGUAGE.equals("RU") ? "Красный" : "Red";
    labels124[3]=LANGUAGE.equals("RU") ? "Коричневый" : "Brown";
    labels124[4]=LANGUAGE.equals("RU") ? "Черный" : "Black";
    labels124[5]=LANGUAGE.equals("RU") ? "Цвет" : "Color Scheme";
    
    buttonX = 100;
    buttonY = 40;
    
    
    if ((APP_OPEN == 1) && (moreLevel1 == true)){
    fill(255,255,255);
    
    for (int loopCounter=0; loopCounter < buttonsMore.length; loopCounter++)
      rect(buttonsMore[loopCounter][0]+ICON_OFFSET, buttonsMore[loopCounter][1], buttonX, buttonY, 0);
    
    fill(COLOR);
    
    font = createFont("Arial",13,true);
    textFont(font);
    text(user,ICON_OFFSET+500+13,575);
    triangle(ICON_OFFSET+500, 575, ICON_OFFSET+500+5, 565, ICON_OFFSET+500+10, 575);
    
    font = createFont("Arial",10,true);
    textFont(font);
    
    text(labels[0],ICON_OFFSET+500+35,451);
    text(labels[1],ICON_OFFSET+500+35,491);
    text(labels[2],ICON_OFFSET+500+35,531);
    
    moreButtonLength = buttonsMore.length;
    
    }
    else if ((APP_OPEN == 1) && (moreLevel2 == true) && (moreSelOne == 1)){
      
          fill(255,255,255);
          for (int loopCounter=0; loopCounter < buttonsMoreSet.length; loopCounter++)
          rect(buttonsMoreSet[loopCounter][0]+ICON_OFFSET,buttonsMoreSet[loopCounter][1], buttonX, buttonY, 0);
          
          fill(COLOR);
          font = createFont("Arial",10,true);
          textFont(font);

          text(labels12[0],ICON_OFFSET+500+35,371);
          text(labels12[1],ICON_OFFSET+500+35,411);
          text(labels12[2],ICON_OFFSET+500+35,451);
          text(labels12[3],ICON_OFFSET+500+35,491);
          text(labels12[4],ICON_OFFSET+500+35,531);
          
          fill(COLOR);
          font = createFont("Arial",13,true);
          textFont(font);
          text(user,ICON_OFFSET+500+13,575);
          triangle(ICON_OFFSET+500, 575, ICON_OFFSET+500+5, 565, ICON_OFFSET+500+10, 575);
          
          moreButtonLength = buttonsMoreSet.length;
    
      }
      else if ((APP_OPEN == 1) && (moreLevel2 == true) && (moreSelOne == 0)){
          fill(255,255,255);
          for (int loopCounter=0; loopCounter < buttonsMoreAcc.length; loopCounter++)
          rect(buttonsMoreAcc[loopCounter][0]+ICON_OFFSET,buttonsMoreAcc[loopCounter][1], buttonX, buttonY, 0);
          
          fill(COLOR);
          font = createFont("Arial",10,true);
          textFont(font);
    
          text(labels11[0],ICON_OFFSET+500+35,411);
          text(labels11[1],ICON_OFFSET+500+35,451);
          text(labels11[2],ICON_OFFSET+500+35,491);
          text(labels11[3],ICON_OFFSET+500+35,531);
          
          fill(COLOR);
          font = createFont("Arial",13,true);
          textFont(font);
          text(user,ICON_OFFSET+500+13,575);
          triangle(ICON_OFFSET+500, 575, ICON_OFFSET+500+5, 565, ICON_OFFSET+500+10, 575);
          
          moreButtonLength = buttonsMoreAcc.length;
          
      }
      //temperature
      else if ((APP_OPEN == 1) && (moreLevel3 == true) && (moreSelTwo == 0) && (moreSelOne == 1)){

            background(200);

            fill(255,255,255);
            for (int loopCounter=0; loopCounter < buttonsMoreSet1.length; loopCounter++)
            rect(buttonsMoreSet1[loopCounter][0]+ICON_OFFSET,buttonsMoreSet1[loopCounter][1], buttonX, buttonY, 0);
          
            fill(COLOR);
            font = createFont("Arial",10,true);
            textFont(font);

            text(labels121[0],ICON_OFFSET+500+35,451);
            text(labels121[1],ICON_OFFSET+500+35,491);
            text(labels121[2],ICON_OFFSET+500+35,531);
            
            
            font = createFont("Arial",13,true);
            textFont(font);
            text(user,ICON_OFFSET+500+13,575);
            triangle(ICON_OFFSET+500, 575, ICON_OFFSET+500+5, 565, ICON_OFFSET+500+10, 575);
            
            moreButtonLength = buttonsMoreSet1.length;
            
            if((moreSelThree == 0) || (moreSelThree == -1)){
              strokeWeight(2);
              stroke(COLOR);
              line(ICON_OFFSET + 510, 446, ICON_OFFSET + 525, 446);
              line(ICON_OFFSET + 518, 440, ICON_OFFSET + 525, 446);
              line(ICON_OFFSET + 518, 452, ICON_OFFSET + 525, 446);
              strokeWeight(0);
            }
            else if(moreSelThree == 1){
              strokeWeight(2);
              stroke(COLOR);
              line(ICON_OFFSET + 510, 486, ICON_OFFSET + 525, 486);
              line(ICON_OFFSET + 518, 480, ICON_OFFSET + 525, 486);
              line(ICON_OFFSET + 518, 492, ICON_OFFSET + 525, 486);
              strokeWeight(0);
            }

              strokeWeight(2);
              stroke(COLOR);
              line(ICON_OFFSET + 510, 526, ICON_OFFSET + 525, 526);
              line(ICON_OFFSET + 517, 520, ICON_OFFSET + 510, 526);
              line(ICON_OFFSET + 517, 532, ICON_OFFSET + 510, 526);
              strokeWeight(0);
          }
     //language
     else if ((APP_OPEN == 1) && (moreLevel3 == true) && (moreSelTwo == 1) && (moreSelOne == 1)){

            background(200);

            fill(255,255,255);
            for (int loopCounter=0; loopCounter < buttonsMoreSet2.length; loopCounter++)
            rect(buttonsMoreSet2[loopCounter][0]+ICON_OFFSET,buttonsMoreSet2[loopCounter][1], buttonX, buttonY, 0);
          
            fill(COLOR);
            font = createFont("Arial",10,true);
            textFont(font);

            text(labels122[0],ICON_OFFSET+500+35,451);
            text(labels122[1],ICON_OFFSET+500+35,491);
            text(labels122[2],ICON_OFFSET+500+35,531);
            
            fill(COLOR);
            font = createFont("Arial",13,true);
            textFont(font);
            text(user,ICON_OFFSET+500+13,575);
            triangle(ICON_OFFSET+500, 575, ICON_OFFSET+500+5, 565, ICON_OFFSET+500+10, 575);
            
            moreButtonLength = buttonsMoreSet2.length;
            
            if((moreSelThree == 0) || (moreSelThree == -1)){
              strokeWeight(2);
              stroke(COLOR);
              line(ICON_OFFSET + 510, 446, ICON_OFFSET + 525, 446);
              line(ICON_OFFSET + 518, 440, ICON_OFFSET + 525, 446);
              line(ICON_OFFSET + 518, 452, ICON_OFFSET + 525, 446);
              strokeWeight(0);
            }
            else if(moreSelThree == 1){
              strokeWeight(2);
              stroke(COLOR);
              line(ICON_OFFSET + 510, 486, ICON_OFFSET + 525, 486);
              line(ICON_OFFSET + 518, 480, ICON_OFFSET + 525, 486);
              line(ICON_OFFSET + 518, 492, ICON_OFFSET + 525, 486);
              strokeWeight(0);
            }

              strokeWeight(2);
              stroke(COLOR);
              line(ICON_OFFSET + 510, 526, ICON_OFFSET + 525, 526);
              line(ICON_OFFSET + 517, 520, ICON_OFFSET + 510, 526);
              line(ICON_OFFSET + 517, 532, ICON_OFFSET + 510, 526);
              strokeWeight(0);
            
          }
      //reposition
      else if ((APP_OPEN == 1) && (moreLevel3 == true) && (moreSelTwo == 2) && (moreSelOne == 1)){

            background(200);

            fill(255,255,255);
            for (int loopCounter=0; loopCounter < buttonsMoreSet3.length; loopCounter++)
            rect(buttonsMoreSet3[loopCounter][0]+ICON_OFFSET,buttonsMoreSet3[loopCounter][1], buttonX, buttonY, 0);
          
            fill(COLOR);
            font = createFont("Arial",10,true);
            textFont(font);

            text(labels123[0],ICON_OFFSET+500+35,411);
            text(labels123[1],ICON_OFFSET+500+35,451);
            text(labels123[2],ICON_OFFSET+500+35,491);
            text(labels123[3],ICON_OFFSET+500+35,531);
            
            fill(COLOR);
            font = createFont("Arial",13,true);
            textFont(font);
            text(user,ICON_OFFSET+500+13,575);
            triangle(ICON_OFFSET+500, 575, ICON_OFFSET+500+5, 565, ICON_OFFSET+500+10, 575);
            
            moreButtonLength = buttonsMoreSet3.length;
            
            if(moreSelThree == 0){
              strokeWeight(2);
              stroke(COLOR);
              line(ICON_OFFSET + 510, 406, ICON_OFFSET + 525, 406);
              line(ICON_OFFSET + 518, 400, ICON_OFFSET + 525, 406);
              line(ICON_OFFSET + 518, 412, ICON_OFFSET + 525, 406);
              strokeWeight(0);
            }
            else if((moreSelThree == 1) || (moreSelThree == -1)){
              strokeWeight(2);
              stroke(COLOR);
              line(ICON_OFFSET + 510, 446, ICON_OFFSET + 525, 446);
              line(ICON_OFFSET + 518, 440, ICON_OFFSET + 525, 446);
              line(ICON_OFFSET + 518, 452, ICON_OFFSET + 525, 446);
              strokeWeight(0);
            }
            else if(moreSelThree == 2){
              strokeWeight(2);
              stroke(COLOR);
              line(ICON_OFFSET + 510, 486, ICON_OFFSET + 525, 486);
              line(ICON_OFFSET + 518, 480, ICON_OFFSET + 525, 486);
              line(ICON_OFFSET + 518, 492, ICON_OFFSET + 525, 486);
              strokeWeight(0);
            }

              strokeWeight(2);
              stroke(COLOR);
              line(ICON_OFFSET + 510, 526, ICON_OFFSET + 525, 526);
              line(ICON_OFFSET + 517, 520, ICON_OFFSET + 510, 526);
              line(ICON_OFFSET + 517, 532, ICON_OFFSET + 510, 526);
              strokeWeight(0);
          }
       //color scheme
       else if ((APP_OPEN == 1) && (moreLevel3 == true) && (moreSelTwo == 3) && (moreSelOne == 1)){

            background(200);

            fill(255,255,255);
            for (int loopCounter=0; loopCounter < buttonsMoreSet4.length; loopCounter++)
            rect(buttonsMoreSet4[loopCounter][0]+ICON_OFFSET,buttonsMoreSet4[loopCounter][1], buttonX, buttonY, 0);
          
            fill(COLOR);
            font = createFont("Arial",10,true);
            textFont(font);

            text(labels124[0],ICON_OFFSET+500+35+20,331);
            text(labels124[1],ICON_OFFSET+500+35+20,371);
            text(labels124[2],ICON_OFFSET+500+35+20,411);
            text(labels124[3],ICON_OFFSET+500+35+20,451);
            text(labels124[4],ICON_OFFSET+500+35+20,491);
            text(labels124[5],ICON_OFFSET+500+35,531);
            
            fill(COLOR);
            font = createFont("Arial",13,true);
            textFont(font);
            text(user,ICON_OFFSET+500+13,575);
            triangle(ICON_OFFSET+500, 575, ICON_OFFSET+500+5, 565, ICON_OFFSET+500+10, 575);
            
            fill(255,225,0);
            rect(ICON_OFFSET+500+35,321,10,10);
            fill(0,0,225);
            rect(ICON_OFFSET+500+35,361,10,10);
            fill(225,0,0);
            rect(ICON_OFFSET+500+35,401,10,10);
            fill(165,42,42);
            rect(ICON_OFFSET+500+35,441,10,10);
            fill(0,0,0);
            rect(ICON_OFFSET+500+35,481,10,10);
            
            moreButtonLength = buttonsMoreSet4.length;
            
            if(moreSelThree == 0){
              strokeWeight(2);
              stroke(COLOR);
              line(ICON_OFFSET + 510, 326, ICON_OFFSET + 525, 326);
              line(ICON_OFFSET + 518, 320, ICON_OFFSET + 525, 326);
              line(ICON_OFFSET + 518, 332, ICON_OFFSET + 525, 326);
              strokeWeight(0);
            }
            else if(moreSelThree == 1){
              strokeWeight(2);
              stroke(COLOR);
              line(ICON_OFFSET + 510, 366, ICON_OFFSET + 525, 366);
              line(ICON_OFFSET + 518, 360, ICON_OFFSET + 525, 366);
              line(ICON_OFFSET + 518, 372, ICON_OFFSET + 525, 366);
              strokeWeight(0);
            }
            else if(moreSelThree == 2){
              strokeWeight(2);
              stroke(COLOR);
              line(ICON_OFFSET + 510, 406, ICON_OFFSET + 525, 406);
              line(ICON_OFFSET + 518, 400, ICON_OFFSET + 525, 406);
              line(ICON_OFFSET + 518, 412, ICON_OFFSET + 525, 406);
              strokeWeight(0);
            }
            else if(moreSelThree == 3){
              strokeWeight(2);
              stroke(COLOR);
              line(ICON_OFFSET + 510, 446, ICON_OFFSET + 525, 446);
              line(ICON_OFFSET + 518, 440, ICON_OFFSET + 525, 446);
              line(ICON_OFFSET + 518, 452, ICON_OFFSET + 525, 446);
              strokeWeight(0);
            }
            else if((moreSelThree == 4) || (moreSelThree == -1)){
              strokeWeight(2);
              stroke(COLOR);
              line(ICON_OFFSET + 510, 486, ICON_OFFSET + 525, 486);
              line(ICON_OFFSET + 518, 480, ICON_OFFSET + 525, 486);
              line(ICON_OFFSET + 518, 492, ICON_OFFSET + 525, 486);
              strokeWeight(0);
            }

              strokeWeight(2);
              stroke(COLOR);
              line(ICON_OFFSET + 510, 526, ICON_OFFSET + 525, 526);
              line(ICON_OFFSET + 517, 520, ICON_OFFSET + 510, 526);
              line(ICON_OFFSET + 517, 532, ICON_OFFSET + 510, 526);
              strokeWeight(0);

          }
    else{
      fill(COLOR);
      background(200);
      font = createFont("Arial",13,true);
      textFont(font);
      text(user,ICON_OFFSET+500+13,575);
      triangle(ICON_OFFSET+500, 575, ICON_OFFSET+500+5, 565, ICON_OFFSET+500+10, 575);
      
    }
  }

}

class MoreWindow {
  
  
  
  MoreWindow() {
  
  }

  void draw() {
  
  }
}

class Info {
  InfoTime infoTime;
  InfoDate infoDate;

  Info() {
    InfoTime infoTime = new InfoTime();
    InfoDate infoDate = new InfoDate();
  }

  void draw() {
    
   // infoTime.draw();
  }
}

class InfoTime {
  int hours,minutes;
  String time;
  
  InfoTime() {
    hours = hour();
    minutes = minute();  
    if (hour() > 12) {
      hours = hour() - 12;
     }
     
     String mins = str(minutes);
     if (minutes < 10) {
      mins = "0" + mins;
     }
     textSize(30);
     
     if(hours>12){
       time = hours + ":" + mins + " AM";
     }else{
       time = hours + ":" + mins + " PM";
     }
     
     text(time,120,60);
  }

  void draw() {
     
 println("ff");
     fill(0);
     text(time,100,100);
  }
}

class InfoDate {
  
  int day,month;
  String date;
  
  InfoDate() {
    
    day = day();
    month = month();
    date = month + "/" + day;
    text(date,120,90);
  }

  void draw() {
      
  }
}

class ImageButton {
  String label;
  PImage currentImage;

  int x, y;
  int w, h;

  boolean isPressed = false;

  ImageButton(int ix, int iy, PImage ibase, String ilabel) {
    x = ix;
    y = iy;
    w = ibase.width;
    h = ibase.height;

    label = ilabel;
    currentImage = ibase;
  }

  void pressed() {
    if(mousePressed) {
      isPressed = true;
    } else {
      isPressed = false;
    }    
  }

  String update() {
    pressed();

    if(isPressed) {
      return label;
    } else {
      return null;
    }
  }

  void display() {
    image(currentImage, x, y);
  }
}

void mouseReleased(){
  //determine whether More window is open
   moreButtonLength = moreButtonLength * buttonY;
  
  if ((mouseX > ICON_OFFSET+500) && (mouseX < ICON_OFFSET+500+80) && (mouseY > 560) && (mouseY < 575)){
    APP_OPEN = APP_OPEN + 1;
    APP_OPEN = APP_OPEN % 2;
    moreDumb = 0;

    if (APP_OPEN == 1){
      moreLevel1 = true;
      moreLevel2 = false;
      moreLevel3 = false;
      moreSelOne = -1;
      moreSelTwo = -1;
//      moreSelThree = -1;
    }
    
  }
  else if((APP_OPEN == 1) && ((mouseX < ICON_OFFSET+500) || (mouseX > ICON_OFFSET+500+buttonX) || (mouseY < 506 - moreButtonLength + buttonY) || (mouseY > 506 + buttonY))){

    moreLevel1 = false;
    moreLevel2 = false;
    moreLevel3 = false;
    moreSelOne = -1;
    moreSelTwo = -1;
    //moreSelThree = -1;
    APP_OPEN = 0;
    moreDumb = 0;
  }

  //determine selected button on level 1
  for (int loopCounter=0; loopCounter < buttonsMore.length; loopCounter++){
  if ((moreLevel1==true) && (mouseX > buttonsMore[loopCounter][0] + ICON_OFFSET) && (mouseX < buttonsMore[loopCounter][0]+ICON_OFFSET + buttonX)
      && (mouseY > buttonsMore[loopCounter][1]) && (mouseY < buttonsMore[loopCounter][1]+buttonY)){
        moreSelOne = loopCounter;
        if ((moreSelOne == 2)){
          moreLevel2 = false;
          moreLevel1 = false;
          GUEST      = 1;
          APP_OPEN   = 0;
          moreDumb   = 0;
        }
        else{
          moreLevel2 = true;
          moreLevel1 = false;
        }
        break;
      }
  }

  //determine selected button on level 2
  if ((moreLevel2==true) && (moreSelOne == 1)){
    for (int loopCounter=0; loopCounter < buttonsMoreSet.length; loopCounter++){
    if ((mouseX > buttonsMoreSet[loopCounter][0] + ICON_OFFSET) &&
        (mouseX < buttonsMoreSet[loopCounter][0]+ICON_OFFSET + buttonX) && 
        (mouseY > buttonsMoreSet[loopCounter][1]) && (mouseY < buttonsMoreSet[loopCounter][1]+buttonY)){
        
            moreSelTwo = loopCounter;
            moreDumb = moreDumb + 1;

          break;
        }
    }
  }
  else if ((moreLevel2==true) && (moreSelOne == 0)){
    for (int loopCounter=0; loopCounter < buttonsMoreAcc.length; loopCounter++){
    if ((mouseX > buttonsMoreAcc[loopCounter][0] + ICON_OFFSET) &&
        (mouseX < buttonsMoreAcc[loopCounter][0]+ICON_OFFSET + buttonX) && 
        (mouseY > buttonsMoreAcc[loopCounter][1]) && (mouseY < buttonsMoreAcc[loopCounter][1]+buttonY)){
        
            moreSelTwo = loopCounter;
            moreDumb = moreDumb + 1;

          break;
        }
    }
  }

  //determine selected button on level 3 of button 2 on level 2
  if ((moreLevel3==true) && (moreSelOne == 1) && (moreSelTwo == 0)){
    for (int loopCounter=0; loopCounter < buttonsMoreSet1.length; loopCounter++){
    if ((mouseX > buttonsMoreSet1[loopCounter][0] + ICON_OFFSET) &&
        (mouseX < buttonsMoreSet1[loopCounter][0]+ICON_OFFSET + buttonX) && 
        (mouseY > buttonsMoreSet1[loopCounter][1]) && (mouseY < buttonsMoreSet1[loopCounter][1]+buttonY)){
        
            moreSelThree = loopCounter;
            break;
        }
    }
  }
  else if ((moreLevel3==true) && (moreSelOne == 1) && (moreSelTwo == 1)){
    for (int loopCounter=0; loopCounter < buttonsMoreSet2.length; loopCounter++){
    if ((mouseX > buttonsMoreSet2[loopCounter][0] + ICON_OFFSET) &&
        (mouseX < buttonsMoreSet2[loopCounter][0]+ICON_OFFSET + buttonX) && 
        (mouseY > buttonsMoreSet2[loopCounter][1]) && (mouseY < buttonsMoreSet2[loopCounter][1]+buttonY)){
        
            moreSelThree = loopCounter;
            break;
        }
    }
  }
  else if ((moreLevel3==true) && (moreSelOne == 1) && (moreSelTwo == 2)){
    for (int loopCounter=0; loopCounter < buttonsMoreSet3.length; loopCounter++){
    if ((mouseX > buttonsMoreSet3[loopCounter][0] + ICON_OFFSET) &&
        (mouseX < buttonsMoreSet3[loopCounter][0] + ICON_OFFSET + buttonX) && 
        (mouseY > buttonsMoreSet3[loopCounter][1]) && (mouseY < buttonsMoreSet3[loopCounter][1]+buttonY)){
        
            moreSelThree = loopCounter;
            break;
        }
    }
  }
  else if ((moreLevel3==true) && (moreSelOne == 1) && (moreSelTwo == 3)){
    for (int loopCounter=0; loopCounter < buttonsMoreSet4.length; loopCounter++){
    if ((mouseX > buttonsMoreSet4[loopCounter][0] + ICON_OFFSET) &&
        (mouseX < buttonsMoreSet4[loopCounter][0]+ICON_OFFSET + buttonX) && 
        (mouseY > buttonsMoreSet4[loopCounter][1]) && (mouseY < buttonsMoreSet4[loopCounter][1]+buttonY)){
        
            moreSelThree = loopCounter;
            break;
        }
    }
  }
  

  //Reaction to level 2 click. switch form 2 to 3
  if ((moreLevel2 == true) && ((moreSelTwo == 0) || (moreSelTwo == 1) || (moreSelTwo == 2) || (moreSelTwo == 3)) && (moreSelOne != 0) && (moreDumb != 1)){
      moreLevel3 = true;
      moreLevel2 = false;
  }

  //returning to first layer
  if ((moreLevel2 == true) && (mouseX > 500 + ICON_OFFSET) &&
        (mouseX < 500+ICON_OFFSET + buttonX) && 
        (mouseY > 506) && (mouseY < 506 + buttonY)){
          moreLevel2 = false;
          moreLevel1 = true;
          moreDumb = 0;
          moreSelTwo = -1;
        }
        
   //returning to second layer
  if ((moreLevel3 == true) && (mouseX > 500 + ICON_OFFSET) &&
        (mouseX < 500+ICON_OFFSET + buttonX) && 
        (mouseY > 506) && (mouseY < 506 + buttonY)){
          moreLevel3 = false;
          moreLevel2 = true;
          moreSelThree = -1;
        }
  
  //reposition
  if ((moreLevel3 == true) && (moreSelTwo == 2)){
     
    if (moreSelThree == 0){
       ICON_OFFSET = 0;
    }
    else if (moreSelThree == 1){
       ICON_OFFSET =  MIRROR_WIDTH/4;
    }
    else if (moreSelThree == 2){
       ICON_OFFSET =  (MIRROR_WIDTH/4)*2;
    }
  }
  
  //language
  if ((moreLevel3 == true) && (moreSelTwo == 1)){
     
    if (moreSelThree == 0){
       LANGUAGE = "EN";
    }
    else if (moreSelThree == 1){
       LANGUAGE = "RU";
    }
  }

  //color scheme
  if ((moreLevel3 == true) && (moreSelTwo == 3)){
     if (moreSelThree == 0){
       COLOR = color(255,225,0);
     }
     else if (moreSelThree == 1){
       COLOR = color(0,0,225);
     }
     else if (moreSelThree == 2){
       COLOR = color(255,0,0);
     }
     else if (moreSelThree == 3){
       COLOR = color(165,42,42);
     }
     else if (moreSelThree == 4){
       COLOR = color(0,0,0);
     }
  }
  
  /*    imgLock.resize(15, 15);
    image(imgLock, ICON_OFFSET + 585, 562);*/
    
  if ((mouseX > ICON_OFFSET+585) && (mouseX < ICON_OFFSET+585 +15) && (mouseY > 562) && (mouseY < 562+15)){
     mainMirror.lock.ScreenLocked = 1; 
  }
println(moreSelThree);  
}