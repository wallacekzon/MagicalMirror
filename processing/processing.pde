
// mirror size information
Mirror mainMirror;
int MIRROR_WIDTH = 1280;
int MIRROR_HEIGHT = 700;

// icon size information
int ICON_OFFSET = MIRROR_WIDTH/4;
int ICON_SIZE = MIRROR_WIDTH/4/6;

// language selected at the moment
int ENGLISH = 1, CHINESE = 2;
int LANGUAGE = ENGLISH;

// selected window at the moment (related to ACCESSABLE_BUTTONS_ON_WINDOW), -1 mean none
boolean ON_WINDOW = false;

// all buttons that are accessable on the main screen
int ACCESSABLE_BUTTONS_ON_WINDOW = {

  // four app icons
  {830, 280}, {845, 570}, {835, 420}, {835, 475},
  // three in app icons 
  {1020, 300}, {1020, 380}, {1020, 530}, 
  

  // music player backtrack, playpause and forward
  {1020,580}, {1135, 300}, {1135, 380},
  // music player volumn up and down
  {1135, 530}, {1135, 580}, 
  // music player song list icon and actually list
  {972, 700}, {1100, 700},


  // more: triangle icon, lock and more list pop-up
  {},{},{} 
};

void setup(){
  mainMirror = new Mirror();

  size(1280, 700);
  background(230);
}

void draw() {
  mainMirror.draw();
}

void mouseReleased() {
  for (int loopCounter=0; loopCounter < BUTTONS.length; loopCounter++){
      if ((mouseX > BUTTONS[loopCounter][0]) && (mouseX < BUTTONS[loopCounter][0]+BUTTONX)
      && (mouseY > BUTTONS[loopCounter][1]) && (mouseY < BUTTONS[loopCounter][1]+BUTTONY)){
        ON_WINDOW = true;

        if (loopCounter == 0) {
          // app 1
          mainMirror.apps.clicked(loopCounter);
        } else if (loopCounter == 1) {
          // app 2
          mainMirror.apps.clicked(loopCounter);
        } else if (loopCounter == 2) {
          // app 3
          mainMirror.apps.clicked(loopCounter);
        } else if (loopCounter == 3) {
          // app 4
          mainMirror.apps.clicked(loopCounter);
        } else if (loopCounter == 4) {
          // app icon 1
          mainMirror.apps.clicked(loopCounter);
        } else if (loopCounter == 5) {
          // app icon 2
          mainMirror.apps.clicked(loopCounter);
        } else if (loopCounter == 6) {
          // app icon 3
          mainMirror.apps.clicked(loopCounter);
        } 
        
        
        else if (loopCounter == 7) {
          // player backTrack
        } else if (loopCounter == 8) {
          // player playPause
        } else if (loopCounter == 9) {
          // player forward
        } else if (loopCounter == 10) {
          // player volumnUp
        } else if (loopCounter == 11) {
          // player volumeDown
        } else if (loopCounter == 12) {
          // player songListIcon
        } else if (loopCounter == 13) {
          // player songList
        } 
        
        
        else if (loopCounter == 14) {
          // more
        } else if (loopCounter == 15) {
          // lock
        } else if (loopCounter == 16) {
          // more pop-up area
        }


      } else {
        // user touched on other parts
        ON_WINDOW = false;
      }
      
  }
}


//*******************************start main mirror class*******************//

// this is the main Mirror class containing all other elements 
class Mirror {
  Apps apps;
  MusicPlayer musicPlayer;
  More more;
  Info info;

  Mirror() {
    apps = new Apps();
    musicPlayer = new MusicPlayer();
    more = new More();
    info = new Info();
  }

  void draw() {
    apps.draw();
    musicPlayer.draw();
    more.draw();
    info.draw();
  }
}

//*******************************end main mirror class*******************//



//*******************************start apps class*******************//

// class for those four app icons
class Apps{ 
  ImageButton weather;
  ImageButton calendar;
  ImageButton health;
  ImageButton media;

  AppsWindowEnglish appsWindowEnglish;
  AppsWindowChinese appsWindowChinese;

  Apps() {
    appsWindowEnglish = new AppsWindowEnglish();
    appsWindowChinese = new AppsWindowChinese();

    PImage iconImage = loadImage("power.jpg");
    weather = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8*6 + ICON_SIZE, iconImage, "weather");

    iconImage = loadImage("power.jpg");
    calendar = new ImageButton(ICON_OFFSET+ICON_SIZE*2, MIRROR_HEIGHT/8*6 + ICON_SIZE, iconImage, "calendar");

    iconImage = loadImage("power.jpg");
    health = new ImageButton(ICON_OFFSET+ICON_SIZE*3, MIRROR_HEIGHT/8*6 + ICON_SIZE, iconImage, "health");

    iconImage = loadImage("power.jpg");
    media = new ImageButton(ICON_OFFSET+ICON_SIZE*4, MIRROR_HEIGHT/8*6 + ICON_SIZE, iconImage, "media");

  }

  // event handler
  void clicked(int clickedIndex) {
    swtich (clickedIndex) {
      0 :
      
      break;
      1 :

      break;
      2 :

      break;
      3 :

      break;
      4 :

      break;
      5 :

      break;
      6 :

      break;
      default:
      // panic!!
    }
  }

  void draw() {
    if (LANGUAGE == ENGLISH) {
      appsWindowEnglish.draw();
    } else {
      appsWindowChinese.draw();
    }

    weather.display();
    calendar.display();
    health.display();
    media.display();
  }
  
}

class AppsWindowEnglish {
  int onIcon = 0;
  int onSubIcon = 0;

  ImageButton[] images;
  ImageButton[] buttons;

  AppsWindowEnglish() {
    images = new ImageButton[4];

    PImage appImage = loadImage("english.jpg");
    images[0] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "weatherWindow");

    appImage = loadImage("english.jpg");
    images[1] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "calendarWindow");
    
    appImage = loadImage("english.jpg");
    images[2] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "healthWindow");
    
    appImage = loadImage("english.jpg");
    images[3] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "mediaWindow");

  }

  void draw() {
      images[onIcon].display();
      images[onSubIcon].display();
  }
}

class AppsWindowChinese {
  int onIcon = 0;
  int onSubIcon = 0;

  ImageButton[] images;
  ImageButton[] buttons;

  AppsWindowChinese() {
    images = new ImageButton[4];

    PImage appImage = loadImage("english.jpg");
    images[0] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "weatherWindow");

    appImage = loadImage("english.jpg");
    images[1] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "calendarWindow");
    
    appImage = loadImage("english.jpg");
    images[2] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "healthWindow");
    
    appImage = loadImage("english.jpg");
    images[3] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "mediaWindow");

  }

  void draw() {
      images[onIcon].display();
      images[onSubIcon].display();
  }
}

//*******************************end apps class*******************//



//*******************************start music player classes*******************//

// music player, shall we also make a spotify login page?
class MusicPlayer {
  ImageButton backTrack;
  ImageButton playPause;
  ImageButton forward;
  ImageButton volumnUp;
  ImageButton volumnDown;

  ImageButton songList;

  SongListWindow songListWindow;

  MusicPlayer() {
    songListWindow = new SongListWindow();
  }

  void draw() {
    songListWindow.draw();
  }
}

class SongListWindow {
  
  SongListWindow() {

  }

  void draw() {

  }
}

//*******************************end music player classes*******************//


//*******************************start More classes*******************//

// where the account, setting, etc. are 
class More {
  MoreWindow moreWIndow;
  ImageButton[] buttons;

  More() {
    moreWIndow = new MoreWindow();
  }

  void draw() {
    moreWIndow.draw();
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

  Info () {
    infoTime = new InfoTime();
    infoDate = new InfoDate();

  }

  void draw() {
    infoTime.draw();
    infoDate.draw();
  }
}

class InfoTime {
  InfoTime() {

  }

  void draw() {

  }
}

class InfoDate {
  
  InfoDate() {

  }

  void draw() {
  
  }
}

//*******************************end More classes*******************//

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

