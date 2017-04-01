Mirror mainMirror;

void setup(){
  mainMirror = new Mirror();

  size(1280, 800);
  background(200);
}

void draw() {
  mainMirror.draw();
}

void mouseReleased() {

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

  AppsWindow appsWindow;

  Apps() {
    appsWindow = new AppsWindow();

    PImage weatherIcon = loadImage("images/logo.png");
    weather = new ImageButton(280,280, weatherIcon, "weather");
  }

  void draw() {
    appsWindow.draw();


    weather.update();
  }
  
}

class AppsWindow {

  AppsWindow() {

  }

  void draw() {

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

