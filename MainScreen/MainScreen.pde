PFont font;
PImage imgLang, imgPrev, imgNext,imgWifi, imgKeyboard, imgFinger, imgNumber,imgCheck, imgLock, imgAccount, imgLogout, imgSettings, imgColor, imgRepos, imgTemp, imgKeypad;
color COLOR = color(0,0,0);
String user = "Wallace";
String LANGUAGE = "EN"; //0 - English; 1 - Russian
int MIRROR_WIDTH = 2732;
int MIRROR_HEIGHT = 1366;
int ICON_OFFSET = MIRROR_WIDTH/4;
int APP_OPEN = 0;
int MORE_OPEN = 0;
int buttonX = 227;
int buttonY = 60;
int moreSelOne = -1, moreSelTwo = -1, moreSelThree = -1, moreDumb = 0;
boolean moreLevel1 = false, moreLevel2 = false, moreLevel3 = false;
int moreButtonLength = 0;
int GUEST = 0, screenLocked = 0, ACC_IDENT_FINGER = 0, ACC_IDENT_PASSCODE = 0, FINGER = 0, PASSCODE = 0;

int moreTemp = 0, moreRepos = 1, moreColor = 4, moreAcc = 0;
int moreLang = 0, initDumb = 0, INITIALIZATION = 1;
int arrowHeight = 0, arrowWidth = 0, initFingerDone = 0, initPasscodeDone = 0, loggedOut = 0;
int initLang = 1, initWifi = 0, initPassw = 0, initWifiSel = 0, initAccount = 0, initSecurity = 0, initFinger = 0, initPasscode;
String wifiNetwork, initWifiPassword="", initAccountName = "", initAccountPassword = "", initAccountDumb = "Wallace", initUserPasscode = "";

int buttonsMore[][] = {{1138, 1092-buttonY*2}, {1138, 1092 - buttonY}, {1138, 1092}};
int buttonsMoreSet[][] = {{1138, 1092-buttonY*4}, {1138, 1092-buttonY*3}, {1138, 1092-buttonY*2}, {1138, 1092-buttonY}, {1138, 1092}};
int buttonsMoreAcc[][] = {{1138, 1092-buttonY*3}, {1138, 1092-buttonY*2}, {1138, 1092-buttonY}, {1138, 1092}};
int buttonsMoreSet1[][] = {{1138, 1092-buttonY*2}, {1138, 1092-buttonY}, {1138, 1092}};//Temperature
int buttonsMoreSet2[][] = {{1138, 1092-buttonY*10}, {1138, 1092-buttonY*9}, {1138, 1092-buttonY*8}, {1138, 1092-buttonY*7}, {1138, 1092-buttonY*6}, {1138, 1092-buttonY*5}, {1138, 1092-buttonY*4}, {1138, 1092-buttonY*3}, {1138, 1092-buttonY*2}, {1138, 1092-buttonY}, {1138, 1092}};//Language
int buttonsMoreSet3[][] = {{1138, 1092-buttonY*3}, {1138, 1092-buttonY*2}, {1138, 1092-buttonY}, {1138, 1092}};//Reposition
int buttonsMoreSet4[][] = {{1138, 1092-buttonY*5}, {1138, 1092-buttonY*4}, {1138, 1092-buttonY*3}, {1138, 1092-buttonY*2}, {1138, 1092-buttonY}, {1138, 1092}};//Color Scheme

Mirror mainMirror;

void setup(){
  mainMirror = new Mirror();
  
  size(2732, 1536);
  background(200);
  
  imgLang = loadImage("language_settings_icon.png", "png");
  imgLang.loadPixels();
  imgPrev = loadImage("prev_icon.png", "png");
  imgPrev.loadPixels();
  imgNext = loadImage("next_icon.png", "png");
  imgNext.loadPixels();
  imgWifi = loadImage("wifi_icon.png", "png");
  imgWifi.loadPixels();
  imgKeyboard = loadImage("keyboard_icon.PNG", "PNG");
  imgKeyboard.loadPixels();
  imgFinger = loadImage("finger_icon.png", "png");
  imgFinger.loadPixels();
  imgNumber = loadImage("numberpad_icon.png", "png");
  imgNumber.loadPixels();
  imgCheck = loadImage("check_icon.png", "png");
  imgCheck.loadPixels();
  imgLock = loadImage("lock_icon.png", "png");
  imgLock.loadPixels();
  imgAccount = loadImage("account_icon.png", "png");
  imgAccount.loadPixels();
  imgLogout = loadImage("logout_icon.png", "png");
  imgLogout.loadPixels();
  imgSettings = loadImage("settings_icon.png", "png");
  imgSettings.loadPixels();
  imgColor = loadImage("color_palette_icon.png", "png");
  imgColor.loadPixels();
  imgRepos = loadImage("reposition_icon.png", "png");
  imgRepos.loadPixels();
  imgTemp = loadImage("temperature_icon.png", "png");
  imgTemp.loadPixels();
  imgKeypad = loadImage("keypad_icon.JPG", "jpg");
  imgKeypad.loadPixels();
}
void draw(){
  
  background(200);
  fill(COLOR);
  font = createFont("Arial",80,true);
  textFont(font);
  
  if (LANGUAGE == "RU"){
    text("Добро пожаловать в Illuminati",830,450);
  }
  else
    text("Welcome to Illuminati",1000,450);
    
  font = createFont("Arial",40,true);
  textFont(font);
  
  
  //init language list
  if(initLang == 1){

    fill(255,255,255);
    rect(910,512,910,512);
    imgLang.resize(70, 70);
    image(imgLang, 1330, 536);
    strokeWeight(2);
    line(940,610,1790,610);
    line(1365,640,1365,970);
    strokeWeight(0);
  
    font = createFont("Arial",40,true);
    textFont(font);
    fill(COLOR);
    text("English",1040,680);
    text("Deutsch",1040,750);
    text("Français",1040,820);
    text("Magyar",1040,890);
    text("Polski",1040,960);
  
    text("Português",1495,680);
    text("Русский",1495,750);
    text("Svenska",1495,820);
    text("Türkçe",1495,890);
    text("Zazaki",1495,960);
  
    //arrows
    strokeWeight(5);
    line(955 + arrowWidth, 660 + arrowHeight, 1015 + arrowWidth, 660 + arrowHeight);//middle
    line(995 + arrowWidth, 640 + arrowHeight, 1015 + arrowWidth, 660 + arrowHeight);//up
    line(995 + arrowWidth, 680 + arrowHeight, 1015 + arrowWidth, 660 + arrowHeight);//down
    strokeWeight(0);
  }
  //wifi
  else if(initWifi == 1){

    fill(255,255,255);
    rect(910,512,910,512);
    
    fill(0,0,0);
    text(LANGUAGE == "RU" ? "Выберите сеть Wi-Fi" : "Select a Wi-Fi connection", 1160, 580);
    fill(255,255,255);
    
    strokeWeight(2);
    line(940,610,1790,610);
    strokeWeight(0);
  
    font = createFont("Arial",40,true);
    textFont(font);
    fill(COLOR);
    text("xfinitywifi",1150,680);
    text("MyWiFi",1150,750);
    text("UIC Guest",1150,820);
    text("UIC WIFI",1150,890);
    text("BB3D",1150,960);
    
    line(1150,690,1580,690);
    line(1150,760,1580,760);
    line(1150,830,1580,830);
    line(1150,900,1580,900);
    line(1150,970,1580,970);
    
    imgWifi.resize(40, 40);
    image(imgWifi, 1540, 650);
    image(imgWifi, 1540, 720);
    image(imgWifi, 1540, 790);
    image(imgWifi, 1540, 860);
    image(imgWifi, 1540, 930);
    
  }
  //wifi password
  else if(initPassw == 1){

    fill(255,255,255);
    rect(910,512,910,512);
    
    fill(0,0,0);
    text(LANGUAGE == "RU" ? "Введите пароль от сети Wi-Fi" : "Please enter Wi-Fi password", 1100, 580);
    fill(255,255,255);
    
    strokeWeight(2);
    //password box
    rect(1150,710,430,40);
    line(940,610,1790,610);
    strokeWeight(0);
  
    font = createFont("Arial",40,true);
    textFont(font);
    fill(COLOR);
    text(wifiNetwork,1150,680);
    
    line(1150,690,1580,690);
    
    imgWifi.resize(40, 40);
    image(imgWifi, 1540, 650);
    imgKeyboard.resize(550, 200);
    image(imgKeyboard, 1090, 770);
    
    //password entry
    font = createFont("Arial",40,true);
    textFont(font);
    text(initWifiPassword,1170,750);
    
  }
  //enter username
  else if(initAccount == 1){

    fill(255,255,255);
    rect(910,512,910,512);
    
    fill(0,0,0);
    text(LANGUAGE == "RU" ? "Введите имя пользователя" : "Please set up an Account Name", 1100, 580);
    fill(255,255,255);
    
    strokeWeight(2);
    //password box
    rect(1150,710,430,40);
    line(940,610,1790,610);
    strokeWeight(0);
  
    font = createFont("Arial",40,true);
    textFont(font);
    fill(COLOR);
    
    imgKeyboard.resize(550, 200);
    image(imgKeyboard, 1090, 770);
    
    //username entry
    font = createFont("Arial",40,true);
    textFont(font);
    text(initAccountName,1170,746);
    
  }
  //security main page
  else if(initSecurity == 1){

    fill(255,255,255);
    rect(910,512,910,512);
    
    fill(0,0,0);
    text(LANGUAGE == "RU" ? "Выберите способ аутентификации" : "Please pick up Authentication option", 1050, 580);
    fill(255,255,255);
    
    strokeWeight(2);
    //password box
    line(940,610,1790,610);
    strokeWeight(0);
  
    font = createFont("Arial",40,true);
    textFont(font);
    fill(COLOR);
    
    imgFinger.resize(175, 230);
    image(imgFinger, 1140, 690);
    imgNumber.resize(175, 230);
    image(imgNumber, 1415, 690);
    
    if (initFingerDone == 1){  
      imgCheck.resize(40, 40);
      image(imgCheck, 1295, 670);
    }
    
    if (initPasscodeDone == 1){  
      imgCheck.resize(40, 40);
      image(imgCheck, 1570, 670);
    }

  }
  //init finger
  else if(initFinger == 1){

    fill(255,255,255);
    rect(910,512,910,512);
    
    fill(0,0,0);
    text(LANGUAGE == "RU" ? "Приложите палец к дисплею" : "Please place your finger on scanner", 1070, 580);
    fill(255,255,255);
    
    strokeWeight(2);
    line(940,610,1790,610);
    strokeWeight(0);
  
    font = createFont("Arial",40,true);
    textFont(font);
    fill(COLOR);
    
    imgFinger.resize(175, 230);
    image(imgFinger, 1278, 690);
    
  }
  //init passcode
  else if(initPasscode == 1){

    fill(255,255,255);
    rect(910,512,910,512);
    
    fill(0,0,0);
    text(LANGUAGE == "RU" ? "Введите пароль" : "Please enter pin", 1200, 580);
    fill(255,255,255);
    
    strokeWeight(2);
    //passcode box
    rect(1150,630,430,40);
    line(940,610,1790,610);
    strokeWeight(0);
  
    font = createFont("Arial",40,true);
    textFont(font);
    fill(COLOR);
    
    imgNumber.resize(175, 230);
    image(imgNumber, 1278, 690);
    
    //password entry
    font = createFont("Arial",40,true);
    textFont(font);
    text(initUserPasscode,1170,675);

  }
  
  //prev next icons
  if ((initWifi != 1) && (initFinger == 0) && ((initSecurity == 0) || (initFingerDone == 1) || (initPasscodeDone == 1))){
    imgNext.resize(70, 70);
    image(imgNext, 1870, 733);
  }
  
  if (initLang != 1){
    imgPrev.resize(70, 70);
    image(imgPrev, 790, 733);
  }
  
  //******Main screen strats here *****////
    if(INITIALIZATION == 0){
      background(200);
      mainMirror.draw();
    }
}

class Mirror {
  //Apps apps;
  //MusicPlayer musicPlayer;
  More more;
  Info info;

  Mirror() {
    //apps = new Apps();
    //musicPlayer = new MusicPlayer();
    more = new More();
    info = new Info();
  }

  void draw() {
    //apps.draw();
    //musicPlayer.draw();
    more.draw();
    info.draw();
    
  }
}

class More {
  
  //int[][] buttons = { {ICON_OFFSET+500, 426}, {ICON_OFFSET+500, 466}, {ICON_OFFSET+500, 506}};
  //moreAcc = 0 ? "Wallace" : moreAcc = 1 ? "Joseph" : "Sherzod";
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
    labels11[2]="Sherzod";
    labels11[3]=LANGUAGE.equals("RU") ? "Профили" : "Account";
    
    labels12[0]=LANGUAGE.equals("RU") ? "Температура" : "Temperature";
    labels12[1]=LANGUAGE.equals("RU") ? "Язык" : "Languages";
    labels12[2]=LANGUAGE.equals("RU") ? "Сдвиг" : "Reposition";
    labels12[3]=LANGUAGE.equals("RU") ? "Цвет" : "Color";
    labels12[4]=LANGUAGE.equals("RU") ? "Настройки" : "Settings";
    
    labels121[0]=str(char(176))+"C";
    labels121[1]=str(char(176))+"F";
    labels121[2]=LANGUAGE.equals("RU") ? "Температура" : "Temperature";
    
    labels122[0]="English";
    labels122[1]="Deutsch";
    labels122[2]="Français";
    labels122[3]="Magyar";
    labels122[4]="Polski";
    labels122[5]="Português";
    labels122[6]="Русский";
    labels122[7]="Svenska";
    labels122[8]="Türkçe";
    labels122[9]="Zazaki";
    labels122[10]=LANGUAGE.equals("RU") ? "Язык" : "Languages";
    
    labels123[0]=LANGUAGE.equals("RU") ? "Слева" : "Left";
    labels123[1]=LANGUAGE.equals("RU") ? "Центр" : "Center";
    labels123[2]=LANGUAGE.equals("RU") ? "Справа" : "Right";
    labels123[3]=LANGUAGE.equals("RU") ? "Сдвиг" : "Reposition";
    
    labels124[0]=LANGUAGE.equals("RU") ? "Желтый" : "Yellow";
    labels124[1]=LANGUAGE.equals("RU") ? "Синий" : "Blue";
    labels124[2]=LANGUAGE.equals("RU") ? "Красный" : "Red";
    labels124[3]=LANGUAGE.equals("RU") ? "Коричневый" : "Brown";
    labels124[4]=LANGUAGE.equals("RU") ? "Черный" : "Black";
    labels124[5]=LANGUAGE.equals("RU") ? "Цвет" : "Color";
    
    //first screen
    if ((APP_OPEN == 1) && (moreLevel1 == true)){
    fill(255,255,255);
    
    for (int loopCounter=0; loopCounter < buttonsMore.length; loopCounter++)
      rect(buttonsMore[loopCounter][0]+ICON_OFFSET, buttonsMore[loopCounter][1], buttonX, buttonY, 0);
    
    fill(COLOR);
    
    font = createFont("Arial",30,true);
    textFont(font);
    text(user,ICON_OFFSET+1138+40,1212);
    triangle(ICON_OFFSET+1138, 1206, ICON_OFFSET+1138+15, 1206-15, ICON_OFFSET+1138+30, 1206);
    
    font = createFont("Arial",20,true);
    textFont(font);
    
    text(labels[0],ICON_OFFSET+1138+60,972+buttonY*0.67);
    text(labels[1],ICON_OFFSET+1138+60,1032+buttonY*0.67);
    text(labels[2],ICON_OFFSET+1138+60,1092+buttonY*0.67);
    
    moreButtonLength = buttonsMore.length;
    
    imgAccount.resize(50, 50);
    image(imgAccount, ICON_OFFSET + 1143,972+5);
    
    imgSettings.resize(50, 50);
    image(imgSettings, ICON_OFFSET + 1143, 1032+5);
    
    imgLogout.resize(50, 50);
    image(imgLogout, ICON_OFFSET + 1143, 1092+5);
    
    imgLock.resize(30, 30);
    image(imgLock, ICON_OFFSET + 1345, 1185);
    
    }
    //Setting screen
    else if ((APP_OPEN == 1) && (moreLevel2 == true) && (moreSelOne == 1)){
      
          fill(255,255,255);
          for (int loopCounter=0; loopCounter < buttonsMoreSet.length; loopCounter++)
          rect(buttonsMoreSet[loopCounter][0]+ICON_OFFSET,buttonsMoreSet[loopCounter][1], buttonX, buttonY, 0);
          
          fill(COLOR);
          font = createFont("Arial",20,true);
          textFont(font);

          text(labels12[0],ICON_OFFSET+1138+60,852+buttonY*0.67);
          text(labels12[1],ICON_OFFSET+1138+60,912+buttonY*0.67);
          text(labels12[2],ICON_OFFSET+1138+60,972+buttonY*0.67);
          text(labels12[3],ICON_OFFSET+1138+60,1032+buttonY*0.67);
          text(labels12[4],ICON_OFFSET+1138+60,1092+buttonY*0.67);
          
          fill(COLOR);
          font = createFont("Arial",30,true);
          textFont(font);
          text(user,ICON_OFFSET+1138+40,1212);
          triangle(ICON_OFFSET+1138, 1206, ICON_OFFSET+1138+15, 1206-15, ICON_OFFSET+1138+30, 1206);
          
          moreButtonLength = buttonsMoreSet.length;
          
          imgTemp.resize(50, 50);
          image(imgTemp, ICON_OFFSET + 1143, 852+5);
          
          imgLang.resize(50, 50);
          image(imgLang, ICON_OFFSET + 1143, 912+5);
          
          imgRepos.resize(50, 50);
          image(imgRepos, ICON_OFFSET + 1143, 972+5);
          
          imgColor.resize(50, 50);
          image(imgColor, ICON_OFFSET + 1143, 1032+5);
          
          imgLock.resize(30, 30);
          image(imgLock, ICON_OFFSET + 1345, 1185);
          
          strokeWeight(4);
          stroke(COLOR);
          line(ICON_OFFSET + 1148, 1122, ICON_OFFSET + 1188, 1122);
          line(ICON_OFFSET + 1148, 1122, ICON_OFFSET + 1158, 1112);
          line(ICON_OFFSET + 1148, 1122, ICON_OFFSET + 1158, 1132);
          strokeWeight(0);
    
      }
      //Account screen
      else if ((APP_OPEN == 1) && (moreLevel2 == true) && (moreSelOne == 0)){
          fill(255,255,255);
          for (int loopCounter=0; loopCounter < buttonsMoreAcc.length; loopCounter++)
          rect(buttonsMoreAcc[loopCounter][0]+ICON_OFFSET,buttonsMoreAcc[loopCounter][1], buttonX, buttonY, 0);
          
          fill(COLOR);
          font = createFont("Arial",20,true);
          textFont(font);
    
          text(labels11[0],ICON_OFFSET+1138+60,912+buttonY*0.67);
          text(labels11[1],ICON_OFFSET+1138+60,972+buttonY*0.67);
          text(labels11[2],ICON_OFFSET+1138+60,1032+buttonY*0.67);
          text(labels11[3],ICON_OFFSET+1138+60,1092+buttonY*0.67);
          
          fill(COLOR);
          font = createFont("Arial",30,true);
          textFont(font);
          text(user,ICON_OFFSET+1138+40,1212);
          triangle(ICON_OFFSET+1138, 1206, ICON_OFFSET+1138+15, 1206-15, ICON_OFFSET+1138+30, 1206);
          
          imgLock.resize(30, 30);
          image(imgLock, ICON_OFFSET + 1345, 1185);
          
          moreButtonLength = buttonsMoreAcc.length;
          
          if(ACC_IDENT_FINGER == 1){
            imgFinger.resize(175, 230);
            image(imgFinger, ICON_OFFSET + 595, 690);
          }
          
          if(ACC_IDENT_PASSCODE == 1){
            imgNumber.resize(175, 230);
            image(imgNumber, ICON_OFFSET + 595, 690);
            fill(255,255,255);
            rect(ICON_OFFSET + 595,630,175,40);
            
            fill(0,0,0);
            font = createFont("Arial",30,true);
            textFont(font);
            text(initUserPasscode,ICON_OFFSET + 605,665);
          }
          
          if (loggedOut == 0){
          if(moreAcc == 0){
              strokeWeight(4);
              stroke(COLOR);
              line(ICON_OFFSET + 1148, 942, ICON_OFFSET + 1188, 942);
              line(ICON_OFFSET + 1178, 932, ICON_OFFSET + 1188, 942);
              line(ICON_OFFSET + 1178, 952, ICON_OFFSET + 1188, 942);
              strokeWeight(0);
            }
            else if(moreAcc == 1){
              strokeWeight(4);
              stroke(COLOR);
              line(ICON_OFFSET + 1148, 1002, ICON_OFFSET + 1188, 1002);
              line(ICON_OFFSET + 1178, 992, ICON_OFFSET + 1188, 1002);
              line(ICON_OFFSET + 1178, 1012, ICON_OFFSET + 1188, 1002);
              strokeWeight(0);
            }
            else if(moreAcc == 2){
              strokeWeight(4);
              stroke(COLOR);
              line(ICON_OFFSET + 1148, 1062, ICON_OFFSET + 1188, 1062);
              line(ICON_OFFSET + 1178, 1052, ICON_OFFSET + 1188, 1062);
              line(ICON_OFFSET + 1178, 1072, ICON_OFFSET + 1188, 1062);
              strokeWeight(0);
            }
          }

              strokeWeight(4);
              stroke(COLOR);
              line(ICON_OFFSET + 1148, 1122, ICON_OFFSET + 1188, 1122);
              line(ICON_OFFSET + 1148, 1122, ICON_OFFSET + 1158, 1112);
              line(ICON_OFFSET + 1148, 1122, ICON_OFFSET + 1158, 1132);
              strokeWeight(0);
          
      }
      //temperature
      else if ((APP_OPEN == 1) && (moreLevel3 == true) && (moreSelTwo == 0) && (moreSelOne == 1)){

            background(200);

            fill(255,255,255);
            for (int loopCounter=0; loopCounter < buttonsMoreSet1.length; loopCounter++)
            rect(buttonsMoreSet1[loopCounter][0]+ICON_OFFSET,buttonsMoreSet1[loopCounter][1], buttonX, buttonY, 0);
          
            fill(COLOR);
            font = createFont("Arial",20,true);
            textFont(font);

            text(labels121[0],ICON_OFFSET+1138+60,972+buttonY*0.67);
            text(labels121[1],ICON_OFFSET+1138+60,1032+buttonY*0.67);
            text(labels121[2],ICON_OFFSET+1138+60,1092+buttonY*0.67);
            
            font = createFont("Arial",30,true);
            textFont(font);
            text(user,ICON_OFFSET+1138+40,1212);
            triangle(ICON_OFFSET+1138, 1206, ICON_OFFSET+1138+15, 1206-15, ICON_OFFSET+1138+30, 1206);
            
            imgLock.resize(30, 30);
            image(imgLock, ICON_OFFSET + 1345, 1185);
            
            moreButtonLength = buttonsMoreSet1.length;
            
            if(moreTemp == 0){
              strokeWeight(4);
              stroke(COLOR);
              line(ICON_OFFSET + 1148, 1002, ICON_OFFSET + 1188, 1002);
              line(ICON_OFFSET + 1178, 992, ICON_OFFSET + 1188, 1002);
              line(ICON_OFFSET + 1178, 1012, ICON_OFFSET + 1188, 1002);
              strokeWeight(0);
            }
            else if(moreTemp == 1){
              strokeWeight(4);
              stroke(COLOR);
              line(ICON_OFFSET + 1148, 1062, ICON_OFFSET + 1188, 1062);
              line(ICON_OFFSET + 1178, 1052, ICON_OFFSET + 1188, 1062);
              line(ICON_OFFSET + 1178, 1072, ICON_OFFSET + 1188, 1062);
              strokeWeight(0);
            }

              strokeWeight(4);
              stroke(COLOR);
              line(ICON_OFFSET + 1148, 1122, ICON_OFFSET + 1188, 1122);
              line(ICON_OFFSET + 1148, 1122, ICON_OFFSET + 1158, 1112);
              line(ICON_OFFSET + 1148, 1122, ICON_OFFSET + 1158, 1132);
              strokeWeight(0);
          }
     //language
     else if ((APP_OPEN == 1) && (moreLevel3 == true) && (moreSelTwo == 1) && (moreSelOne == 1)){

            background(200);

            fill(255,255,255);
            for (int loopCounter=0; loopCounter < buttonsMoreSet2.length; loopCounter++)
            rect(buttonsMoreSet2[loopCounter][0]+ICON_OFFSET,buttonsMoreSet2[loopCounter][1], buttonX, buttonY, 0);
          
            fill(COLOR);
            font = createFont("Arial",20,true);
            textFont(font);

            text(labels122[0],ICON_OFFSET+1138+60,492+buttonY*0.67);
            text(labels122[1],ICON_OFFSET+1138+60,552+buttonY*0.67);
            text(labels122[2],ICON_OFFSET+1138+60,612+buttonY*0.67);
            text(labels122[3],ICON_OFFSET+1138+60,672+buttonY*0.67);
            text(labels122[4],ICON_OFFSET+1138+60,732+buttonY*0.67);
            text(labels122[5],ICON_OFFSET+1138+60,792+buttonY*0.67);
            text(labels122[6],ICON_OFFSET+1138+60,852+buttonY*0.67);
            text(labels122[7],ICON_OFFSET+1138+60,912+buttonY*0.67);
            text(labels122[8],ICON_OFFSET+1138+60,972+buttonY*0.67);
            text(labels122[9],ICON_OFFSET+1138+60,1032+buttonY*0.67);
            text(labels122[10],ICON_OFFSET+1138+60,1092+buttonY*0.67);
            
            fill(COLOR);
            font = createFont("Arial",30,true);
            textFont(font);
            text(user,ICON_OFFSET+1138+40,1212);
            triangle(ICON_OFFSET+1138, 1206, ICON_OFFSET+1138+15, 1206-15, ICON_OFFSET+1138+30, 1206);
            
            imgLock.resize(30, 30);
            image(imgLock, ICON_OFFSET + 1345, 1185);
            
            moreButtonLength = buttonsMoreSet2.length;
            
            if(moreLang == 0){
              strokeWeight(4);
              stroke(COLOR);
              line(ICON_OFFSET + 1148, 522, ICON_OFFSET + 1188, 522);
              line(ICON_OFFSET + 1178, 512, ICON_OFFSET + 1188, 522);
              line(ICON_OFFSET + 1178, 532, ICON_OFFSET + 1188, 522);
              strokeWeight(0);
            }
            else if(moreLang == 1){
              strokeWeight(4);
              stroke(COLOR);
              line(ICON_OFFSET + 1148, 582, ICON_OFFSET + 1188, 582);
              line(ICON_OFFSET + 1178, 572, ICON_OFFSET + 1188, 582);
              line(ICON_OFFSET + 1178, 592, ICON_OFFSET + 1188, 582);
              strokeWeight(0);
            }
            else if(moreLang == 2){
              strokeWeight(4);
              stroke(COLOR);
              line(ICON_OFFSET + 1148, 642, ICON_OFFSET + 1188, 642);
              line(ICON_OFFSET + 1178, 632, ICON_OFFSET + 1188, 642);
              line(ICON_OFFSET + 1178, 652, ICON_OFFSET + 1188, 642);
              strokeWeight(0);
            }
            else if(moreLang == 3){
              strokeWeight(4);
              stroke(COLOR);
              line(ICON_OFFSET + 1148, 702, ICON_OFFSET + 1188, 702);
              line(ICON_OFFSET + 1178, 692, ICON_OFFSET + 1188, 702);
              line(ICON_OFFSET + 1178, 712, ICON_OFFSET + 1188, 702);
              strokeWeight(0);
            }
            else if(moreLang == 4){
              strokeWeight(4);
              stroke(COLOR);
              line(ICON_OFFSET + 1148, 762, ICON_OFFSET + 1188, 762);
              line(ICON_OFFSET + 1178, 752, ICON_OFFSET + 1188, 762);
              line(ICON_OFFSET + 1178, 772, ICON_OFFSET + 1188, 762);
              strokeWeight(0);
            }
            else if(moreLang == 5){
              strokeWeight(4);
              stroke(COLOR);
              line(ICON_OFFSET + 1148, 822, ICON_OFFSET + 1188, 822);
              line(ICON_OFFSET + 1178, 812, ICON_OFFSET + 1188, 822);
              line(ICON_OFFSET + 1178, 832, ICON_OFFSET + 1188, 822);
              strokeWeight(0);
            }
            else if(moreLang == 6){
              strokeWeight(4);
              stroke(COLOR);
              line(ICON_OFFSET + 1148, 882, ICON_OFFSET + 1188, 882);
              line(ICON_OFFSET + 1178, 872, ICON_OFFSET + 1188, 882);
              line(ICON_OFFSET + 1178, 892, ICON_OFFSET + 1188, 882);
              strokeWeight(0);
            }
            else if(moreLang == 7){
              strokeWeight(4);
              stroke(COLOR);
              line(ICON_OFFSET + 1148, 942, ICON_OFFSET + 1188, 942);
              line(ICON_OFFSET + 1178, 932, ICON_OFFSET + 1188, 942);
              line(ICON_OFFSET + 1178, 952, ICON_OFFSET + 1188, 942);
              strokeWeight(0);
            }
            else if(moreLang == 8){
              strokeWeight(4);
              stroke(COLOR);
              line(ICON_OFFSET + 1148, 1002, ICON_OFFSET + 1188, 1002);
              line(ICON_OFFSET + 1178, 992, ICON_OFFSET + 1188, 1002);
              line(ICON_OFFSET + 1178, 1012, ICON_OFFSET + 1188, 1002);
              strokeWeight(0);
            }
            else if(moreLang == 9){
              strokeWeight(4);
              stroke(COLOR);
              line(ICON_OFFSET + 1148, 1062, ICON_OFFSET + 1188, 1062);
              line(ICON_OFFSET + 1178, 1052, ICON_OFFSET + 1188, 1062);
              line(ICON_OFFSET + 1178, 1072, ICON_OFFSET + 1188, 1062);
              strokeWeight(0);
            }

              strokeWeight(4);
              stroke(COLOR);
              line(ICON_OFFSET + 1148, 1122, ICON_OFFSET + 1188, 1122);
              line(ICON_OFFSET + 1148, 1122, ICON_OFFSET + 1158, 1112);
              line(ICON_OFFSET + 1148, 1122, ICON_OFFSET + 1158, 1132);
              strokeWeight(0);
            
          }
      //reposition
      else if ((APP_OPEN == 1) && (moreLevel3 == true) && (moreSelTwo == 2) && (moreSelOne == 1)){

            background(200);

            fill(255,255,255);
            for (int loopCounter=0; loopCounter < buttonsMoreSet3.length; loopCounter++)
            rect(buttonsMoreSet3[loopCounter][0]+ICON_OFFSET,buttonsMoreSet3[loopCounter][1], buttonX, buttonY, 0);
          
            fill(COLOR);
            font = createFont("Arial",20,true);
            textFont(font);

            text(labels123[0],ICON_OFFSET+1138+60,912+buttonY*0.67);
            text(labels123[1],ICON_OFFSET+1138+60,972+buttonY*0.67);
            text(labels123[2],ICON_OFFSET+1138+60,1032+buttonY*0.67);
            text(labels123[3],ICON_OFFSET+1138+60,1092+buttonY*0.67);
            
            fill(COLOR);
            font = createFont("Arial",30,true);
            textFont(font);
            text(user,ICON_OFFSET+1138+40,1212);
            triangle(ICON_OFFSET+1138, 1206, ICON_OFFSET+1138+15, 1206-15, ICON_OFFSET+1138+30, 1206);
            
            imgLock.resize(30, 30);
            image(imgLock, ICON_OFFSET + 1345, 1185);
            
            moreButtonLength = buttonsMoreSet3.length;
            
            if(moreRepos == 0){
              strokeWeight(4);
              stroke(COLOR);
              line(ICON_OFFSET + 1148, 942, ICON_OFFSET + 1188, 942);
              line(ICON_OFFSET + 1178, 932, ICON_OFFSET + 1188, 942);
              line(ICON_OFFSET + 1178, 952, ICON_OFFSET + 1188, 942);
              strokeWeight(0);
            }
            else if(moreRepos == 1){
              strokeWeight(4);
              stroke(COLOR);
              line(ICON_OFFSET + 1148, 1002, ICON_OFFSET + 1188, 1002);
              line(ICON_OFFSET + 1178, 992, ICON_OFFSET + 1188, 1002);
              line(ICON_OFFSET + 1178, 1012, ICON_OFFSET + 1188, 1002);
              strokeWeight(0);
            }
            else if(moreRepos == 2){
              strokeWeight(4);
              stroke(COLOR);
              line(ICON_OFFSET + 1148, 1062, ICON_OFFSET + 1188, 1062);
              line(ICON_OFFSET + 1178, 1052, ICON_OFFSET + 1188, 1062);
              line(ICON_OFFSET + 1178, 1072, ICON_OFFSET + 1188, 1062);
              strokeWeight(0);
            }

              strokeWeight(4);
              stroke(COLOR);
              line(ICON_OFFSET + 1148, 1122, ICON_OFFSET + 1188, 1122);
              line(ICON_OFFSET + 1148, 1122, ICON_OFFSET + 1158, 1112);
              line(ICON_OFFSET + 1148, 1122, ICON_OFFSET + 1158, 1132);
              strokeWeight(0);
          }
       //color scheme
       else if ((APP_OPEN == 1) && (moreLevel3 == true) && (moreSelTwo == 3) && (moreSelOne == 1)){

            background(200);

            fill(255,255,255);
            for (int loopCounter=0; loopCounter < buttonsMoreSet4.length; loopCounter++)
            rect(buttonsMoreSet4[loopCounter][0]+ICON_OFFSET,buttonsMoreSet4[loopCounter][1], buttonX, buttonY, 0);
          
            fill(COLOR);
            font = createFont("Arial",20,true);
            textFont(font);

            text(labels124[0],ICON_OFFSET+1138+60,792+buttonY*0.67);
            text(labels124[1],ICON_OFFSET+1138+60,852+buttonY*0.67);
            text(labels124[2],ICON_OFFSET+1138+60,912+buttonY*0.67);
            text(labels124[3],ICON_OFFSET+1138+60,972+buttonY*0.67);
            text(labels124[4],ICON_OFFSET+1138+60,1032+buttonY*0.67);
            text(labels124[5],ICON_OFFSET+1138+60,1092+buttonY*0.67);
            
            fill(COLOR);
            font = createFont("Arial",30,true);
            textFont(font);
            text(user,ICON_OFFSET+1138+40,1212);
            triangle(ICON_OFFSET+1138, 1206, ICON_OFFSET+1138+15, 1206-15, ICON_OFFSET+1138+30, 1206);
            
            strokeWeight(0);
            stroke(255,255,255);
            
            fill(255,225,0);
            rect(ICON_OFFSET+1143,792+5,50,50);
            fill(0,0,225);
            rect(ICON_OFFSET+1143,852+5,50,50);
            fill(225,0,0);
            rect(ICON_OFFSET+1143,912+5,50,50);
            fill(165,42,42);
            rect(ICON_OFFSET+1143,972+5,50,50);
            fill(0,0,0);
            rect(ICON_OFFSET+1143,1032+5,50,50);
            
            imgLock.resize(30, 30);
            image(imgLock, ICON_OFFSET + 1345, 1185);
            
            moreButtonLength = buttonsMoreSet4.length;
            /*
            if(moreColor == 0){
              strokeWeight(4);
              stroke(COLOR);
              line(ICON_OFFSET + 1148, 822, ICON_OFFSET + 1188, 822);
              line(ICON_OFFSET + 1178, 812, ICON_OFFSET + 1188, 822);
              line(ICON_OFFSET + 1178, 832, ICON_OFFSET + 1188, 822);
              strokeWeight(0);
            }
            else if(moreColor == 1){
              strokeWeight(4);
              stroke(COLOR);
              line(ICON_OFFSET + 1148, 882, ICON_OFFSET + 1188, 882);
              line(ICON_OFFSET + 1178, 872, ICON_OFFSET + 1188, 882);
              line(ICON_OFFSET + 1178, 892, ICON_OFFSET + 1188, 882);
              strokeWeight(0);
            }
            else if(moreColor == 2){
              strokeWeight(4);
              stroke(COLOR);
              line(ICON_OFFSET + 1148, 942, ICON_OFFSET + 1188, 942);
              line(ICON_OFFSET + 1178, 932, ICON_OFFSET + 1188, 942);
              line(ICON_OFFSET + 1178, 952, ICON_OFFSET + 1188, 942);
              strokeWeight(0);
            }
            else if(moreColor == 3){
              strokeWeight(4);
              stroke(COLOR);
              line(ICON_OFFSET + 1148, 1002, ICON_OFFSET + 1188, 1002);
              line(ICON_OFFSET + 1178, 992, ICON_OFFSET + 1188, 1002);
              line(ICON_OFFSET + 1178, 1012, ICON_OFFSET + 1188, 1002);
              strokeWeight(0);
            }
            else if(moreColor == 4){
              strokeWeight(4);
              stroke(COLOR);
              line(ICON_OFFSET + 1148, 1062, ICON_OFFSET + 1188, 1062);
              line(ICON_OFFSET + 1178, 1052, ICON_OFFSET + 1188, 1062);
              line(ICON_OFFSET + 1178, 1072, ICON_OFFSET + 1188, 1062);
              strokeWeight(0);
            }*/

              strokeWeight(4);
              stroke(COLOR);
              line(ICON_OFFSET + 1148, 1122, ICON_OFFSET + 1188, 1122);
              line(ICON_OFFSET + 1148, 1122, ICON_OFFSET + 1158, 1112);
              line(ICON_OFFSET + 1148, 1122, ICON_OFFSET + 1158, 1132);
              strokeWeight(0);

          }
    else{
      fill(COLOR);
      background(200);
      font = createFont("Arial",30,true);
      textFont(font);
      text(user,ICON_OFFSET+1138+40,1212);
      triangle(ICON_OFFSET+1138, 1206, ICON_OFFSET+1138+15, 1206-15, ICON_OFFSET+1138+30, 1206);
            
      imgLock.resize(30, 30);
      image(imgLock, ICON_OFFSET + 1345, 1185);
            
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
  int hours,minutes;
  String time;
  int day2,month2;
  String date;

  Info() {
    hours = hour();
    minutes = minute();  
    if (hour() > 12) {
      hours = hour() - 12;
     }
     
     String mins = str(minutes);
     if (minutes < 10) {
      mins = "0" + mins;
     }
     
     if(hours>12){
       time = hours + ":" + mins + " AM";
     }else{
       time = hours + ":" + mins + " PM";
     }
     
     day2 = day();
     month2 = month();
     date = "" + month2 + "/" + day2;
     
  }

  void draw() {
    textSize(30);
    fill(COLOR);
    text(time,ICON_OFFSET + 500,1300);
    text(date,ICON_OFFSET + 700,1300);
  }
}

void mouseReleased(){
  
  //determine position of the arrow in language initialization
  for (int loopW=0; loopW <= 455; loopW = loopW + 455){
    for (int loopH=0; loopH <= 280; loopH = loopH + 70) {
      if ((mouseX > 1040+loopW) && (mouseX < 1340+loopW) && (mouseY > 640+loopH) && (mouseY < 680 + loopH)){
        arrowHeight = loopH;
      }
      if ((mouseY > 640+loopH) && (mouseY < 840+loopH) && (mouseX > 1040 + loopW) && (mouseX < 1040 + 300 + loopW)){
        arrowWidth = loopW;
      }
    }
    //setting up language variable
    if ((arrowHeight==70) && (arrowWidth==455) && (initLang == 1)){
      LANGUAGE = "RU";
      moreLang = 6;
    }
    else if (initLang == 1){
      LANGUAGE = "EN";
      moreLang = 0;
    }
  }
  
  //selected wifi network
  for (int loop=0; loop <= 320; loop = loop + 70) {
    if ((mouseX > 1150) && (mouseX < 1580) && (mouseY > 640+loop) && (mouseY < 710 + loop) && (initWifi == 1)){
      initWifiSel = loop/70;
    }
    
    switch (initWifiSel) {
      case 0 : wifiNetwork = "xfinitywifi";
      break;
      case 1: wifiNetwork = "MyWiFi";
      break;
      case 2: wifiNetwork = "UIC Guest";
      break;
      case 3: wifiNetwork = "UIC WIFI";
      break;
      case 4: wifiNetwork = "BB3D";
      break;
    }
  }
  
  //entering password for wifi
  if((initPassw == 1) && (mouseX > 1090) && (mouseX < 1640) && (mouseY > 770) && (mouseY < 970) && ((mouseX < 1570) || (mouseY > 806))) {
    if(initWifiPassword.length()<=25){
      initWifiPassword = initWifiPassword + "*";
    }
  }
  //deleting password
  else if ((mouseX > 1570) && (mouseX < 1640) && (mouseY > 733) && (mouseY < 806)){
    
    if(initWifiPassword.length()>=1){
      initWifiPassword=initWifiPassword.substring(0,initWifiPassword.length()-1);
    }
  }
  
  //entering user name
  if((initAccount == 1) && (mouseX > 1090) && (mouseX < 1640) && (mouseY > 770) && (mouseY < 970) && ((mouseX < 1570) || (mouseY > 806))) {
    if(initDumb <= initAccountDumb.length()-1) {
      initAccountName = initAccountDumb.substring(0,initDumb+1);
      initDumb += 1;
    }
  }
  //deleting userName
  else if ((mouseX > 1570) && (mouseX < 1640) && (mouseY > 733) && (mouseY < 806)){
    
    if(initAccountName.length()>=1){
      initAccountName=initAccountName.substring(0,initAccountName.length()-1);
      initDumb -= 1;
    }
  }
  
  //entering passcode
  if((initPasscode == 1) && (mouseX > 1278) && (mouseX < 1453) && (mouseY > 690) && (mouseY < 920) && ((mouseX < 1340) || (mouseY < 862))) {
    if(initUserPasscode.length()<=3){
      initUserPasscode = initUserPasscode + "*";
    }
  }
  //deleting passcode
  else if ((mouseX > 1340) && (mouseX < 1453) && (mouseY > 862) && (mouseY < 920)){
    
    if(initUserPasscode.length()>=1){
      initUserPasscode=initUserPasscode.substring(0,initUserPasscode.length()-1);
    }
  }

  //press next from lang
  if((initLang == 1) && (mouseX > 1870) && (mouseX < 1940) && (mouseY > 733) && (mouseY < 803)){
    initLang = 0;
    initWifi = 1;
  } 
  //press prev from wifi
  else if((initWifi == 1) && (mouseX > 790) && (mouseX < 860) && (mouseY > 733) && (mouseY < 803)){
    initLang = 1;
    initWifi = 0;
  } 
  //press network from wifi
  else if((initWifi == 1) && (mouseX > 1150) && (mouseX < 1580) && (mouseY > 640) && (mouseY < 960)){
    initPassw = 1;
    initWifi = 0;
    initWifiPassword = "";
  }
  //press prev from passw
  else if((initPassw == 1) && (mouseX > 790) && (mouseX < 860) && (mouseY > 733) && (mouseY < 803)){
    initPassw = 0;
    initWifi = 1;
    initWifiPassword = "";
  }
  //press next from wifi password
  else if((initPassw == 1) && (mouseX > 1870) && (mouseX < 1940) && (mouseY > 733) && (mouseY < 803)){
    initAccount = 1;
    initPassw   = 0;
  }
  //press prev from username entry
  else if((initAccount == 1) && (mouseX > 790) && (mouseX < 860) && (mouseY > 733) && (mouseY < 803)){
    initAccount = 0;
    initPassw = 1;
  } 
  //press next username entry
  else if((initAccount == 1) && (mouseX > 1870) && (mouseX < 1940) && (mouseY > 733) && (mouseY < 803)){
    initAccount = 0;
    initSecurity   = 1;
  }
  //press prev from security entry
  else if((initSecurity == 1) && (mouseX > 790) && (mouseX < 860) && (mouseY > 733) && (mouseY < 803)){
    initAccount = 1;
    initSecurity = 0;
  } 
  //set fingerprint
  else if((initSecurity == 1) && (mouseX > 1140) && (mouseX < 1315) && (mouseY > 690) && (mouseY < 920)){
    initSecurity = 0;
    initFinger   = 1;
  }
  //set passcode
  else if((initSecurity == 1) && (mouseX > 1415) && (mouseX < 1590) && (mouseY > 690) && (mouseY < 920)){
    initSecurity = 0;
    initPasscode = 1;
  }
  //press prev from fingerprint entry
  else if((initFinger == 1) && (mouseX > 790) && (mouseX < 860) && (mouseY > 733) && (mouseY < 803)){
    initSecurity = 1;
    initFinger = 0;
  } 
  //press prev from passcode entry
  else if((initPasscode == 1) && (mouseX > 790) && (mouseX < 860) && (mouseY > 733) && (mouseY < 803)){
    initSecurity = 1;
    initPasscode = 0;
  }
  //press prev from fingerprint entry
  else if((initFinger == 1) && (mouseX > 1278) && (mouseX < 1453) && (mouseY > 690) && (mouseY < 920)){
    initFingerDone = 1;
    initSecurity   = 1;
    initFinger     = 0;
  } 
  //press prev from passcode entry
  else if((initPasscode == 1) && (mouseX > 1278) && (mouseX < 1453) && (mouseY > 690) && (mouseY < 920)){
    initPasscodeDone = 1;
  }
  //press next from passcode entry
  else if((initPasscode == 1) && (mouseX > 1870) && (mouseX < 1940) && (mouseY > 733) && (mouseY < 803)){
    initPasscode = 0;
    initSecurity = 1;
  }
  //press next from security
  else if((initSecurity == 1) && (mouseX > 1870) && (mouseX < 1940) && (mouseY > 733) && (mouseY < 803) && ((initPasscodeDone == 1) || (initPasscodeDone == 1))){
    initSecurity = 0;
    INITIALIZATION = 0;
  }
  //determine whether More window is open****************************************************************
   moreButtonLength = moreButtonLength * buttonY;
  
  if ((mouseX > ICON_OFFSET+1138) && (mouseX < ICON_OFFSET+1138+207) && (mouseY > 1162) && (mouseY < 1162+50)){
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
  else if((APP_OPEN == 1) && (ACC_IDENT_FINGER==0) && (ACC_IDENT_PASSCODE == 0) && ((mouseX < ICON_OFFSET+1138) || (mouseX > ICON_OFFSET+1138+buttonX) || (mouseY < 1152 - moreButtonLength) || (mouseY > 1152))){

    moreLevel1 = false;
    moreLevel2 = false;
    moreLevel3 = false;
    moreSelOne = -1;
    moreSelTwo = -1;
    APP_OPEN = 0;
    moreDumb = 0;
  }

  //determine selected button on level 1
  for (int loopCounter=0; loopCounter < buttonsMore.length; loopCounter++){
  if ((moreLevel1==true) && (mouseX > buttonsMore[loopCounter][0] + ICON_OFFSET) && (mouseX < buttonsMore[loopCounter][0]+ICON_OFFSET + buttonX)
      && (mouseY > buttonsMore[loopCounter][1]) && (mouseY < buttonsMore[loopCounter][1]+buttonY)){
        moreSelOne = loopCounter;
        if ((moreSelOne == 2)){
          
          loggedOut = 1;
          moreLevel2 = false;
          moreLevel1 = false;
          GUEST      = 1;
          APP_OPEN   = 0;
          moreDumb   = 0;
          FINGER = 0;
          PASSCODE = 0;
          ACC_IDENT_FINGER  = 0;
          ACC_IDENT_PASSCODE = 0;
          initUserPasscode = "";
        }
        else if ((ACC_IDENT_FINGER==0) && (ACC_IDENT_PASSCODE == 0)){
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
  if ((moreLevel2 == true) && (mouseX > 1138 + ICON_OFFSET) &&
        (mouseX < 1138+ICON_OFFSET + buttonX) && 
        (mouseY > 1092) && (mouseY < 1092 + buttonY)){
          moreLevel2 = false;
          moreLevel1 = true;
          moreDumb = 0;
          moreSelTwo = -1;
          ACC_IDENT_FINGER = 0;
        }

   //returning to second layer
  if ((moreLevel3 == true) && (mouseX > 1138 + ICON_OFFSET) &&
        (mouseX < 1138+ICON_OFFSET + buttonX) && 
        (mouseY > 1092) && (mouseY < 1092 + buttonY)){
          moreLevel3 = false;
          moreLevel2 = true;
          moreSelThree = -1;
        }
  
  //reposition
  if ((moreLevel3 == true) && (moreSelTwo == 2)){
     
    if (moreSelThree == 0){
       ICON_OFFSET = 50;
    }
    else if (moreSelThree == 1){
       ICON_OFFSET =  MIRROR_WIDTH/4;
    }
    else if (moreSelThree == 2){
       ICON_OFFSET =  (MIRROR_WIDTH/4)*2-50;
    }
  }
  
  //language
  if ((moreLevel3 == true) && (moreSelTwo == 1)){
     
    if (moreSelThree == 6){
       LANGUAGE = "RU";
    }
    else{
      LANGUAGE = "EN";
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
  
  //check whether lockscreen is selected  
  if ((mouseX > ICON_OFFSET+1345) && (mouseX < ICON_OFFSET+1345+20) && (mouseY > 1162) && (mouseY < 1162+50)){
     screenLocked = 1; 
  }
  
  //determine arrow location
  if (moreLevel3 == true){
    
    if (moreSelTwo == 0){
      
      if (moreSelThree == 0){
        moreTemp = 0;
      }
      else if (moreSelThree == 1){
        moreTemp = 1;
      }
    }
    else if (moreSelTwo == 1){
      
      if (moreSelThree == 0){
        moreLang = 0;
      }
      else if (moreSelThree == 1){
        moreLang = 1;
      }
      else if (moreSelThree == 2){
        moreLang = 2;
      }
      else if (moreSelThree == 3){
        moreLang = 3;
      }
      else if (moreSelThree == 4){
        moreLang = 4;
      }
      else if (moreSelThree == 5){
        moreLang = 5;
      }
      else if (moreSelThree == 6){
        moreLang = 6;
      }
      else if (moreSelThree == 7){
        moreLang = 7;
      }
      else if (moreSelThree == 8){
        moreLang = 8;
      }
      else if (moreSelThree == 9){
        moreLang = 9;
      }
    }
    else if (moreSelTwo == 2){
      
      if (moreSelThree == 0){
        moreRepos = 0;
      }
      else if (moreSelThree == 1){
        moreRepos = 1;
      }
      else if (moreSelThree == 2){
        moreRepos = 2;
      }
    }
    else if (moreSelTwo == 3){
      
      if (moreSelThree == 0){
        moreColor = 0;
      }
      else if (moreSelThree == 1){
        moreColor = 1;
      }
      else if (moreSelThree == 2){
        moreColor = 2;
      }
      else if (moreSelThree == 3){
        moreColor = 3;
      }
      else if (moreSelThree == 4){
        moreColor = 4;
      }
    }
    
  }

  
  
  if ((moreLevel2 == true) && (moreSelOne == 0) && (moreDumb != 1)){
//    initSecurity = 1; INITIALIZATION = 1;initLang = 0; initFingerDone = 0;
    if (moreSelTwo == 0){
      moreAcc = 0;
      user = "Wallace";
      ACC_IDENT_PASSCODE = 1;
      FINGER = 1;
    }
    else if (moreSelTwo == 1){
      moreAcc = 1;
      user = "Joseph";
      ACC_IDENT_PASSCODE = 1;
    }
    else if (moreSelTwo == 2){
      moreAcc = 2;
      user = "Sherzod";
      ACC_IDENT_FINGER = 1;
    }
  }
  
  //setting passcode
  if((ACC_IDENT_PASSCODE == 1) && (moreAcc != 2) && (mouseX > ICON_OFFSET + 595) && (mouseX < ICON_OFFSET + 595+175) && (mouseY > 690) && (mouseY < 920) && ((mouseX < ICON_OFFSET + 595 + 175 - 58) || (mouseY < 920 - 57))){
    //entering passcode
    if((mouseX > ICON_OFFSET + 595) && (mouseX < ICON_OFFSET + 595 + 175) && (mouseY > 690) && (mouseY < 920)) {
      if(initUserPasscode.length()<=3){
        initUserPasscode = initUserPasscode + "*";
        initDumb += 1;
      }
    }
    //deleting passcode
    else if ((mouseX > ICON_OFFSET + 595 + 175 - 58) && (mouseX < ICON_OFFSET + 595 + 175) && (mouseY > 920 - 57) && (mouseY < 920)){
    
      if(initUserPasscode.length()>=1){
        initUserPasscode=initUserPasscode.substring(0,initUserPasscode.length()-1);
        initDumb -= 1;
      }
    }

    if (initDumb >= 4){
      ACC_IDENT_PASSCODE = 0;
      screenLocked = 0;
      loggedOut = 0;
    }
    ACC_IDENT_FINGER = 0;
  }
  
  //setting fingerprint
  if((ACC_IDENT_FINGER == 1) && (moreAcc == 2) && (mouseX > ICON_OFFSET + 595) && (mouseX < ICON_OFFSET + 595+175) && (mouseY > 690) && (mouseY < 920)){
    ACC_IDENT_FINGER = 0;
    ACC_IDENT_PASSCODE = 0;
    initUserPasscode = "";
    initDumb = 0;
    loggedOut = 0;
    screenLocked = 0;
  }
  
println(moreAcc);  
}