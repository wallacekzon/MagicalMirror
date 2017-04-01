

void setup(){
  size(1280, 800);
  background(200);
}

void draw() {

}

void mouseReleased() {

}


// this is the main Mirror class containing all other elements 
class Mirror {
  Apps apps;
  Mp3Player mp3Player;
  More more;
  Info info;

  Mirror() {
    apps = new Apps();
    mp3Player = new mp3Player();
    more = new More();
    info = new Info();
  }
}

// class for those four app icons
class Apps{ 
  
  
}

// music player, shall we also make a spotify login page?
class Mp3Player {
  ImageButton backTrack;
  ImageButton playPause;
  ImageButton forward;
  ImageButton volumnUp;
  ImageButton volumnDown;

  ImageButton songList;

  SongListWindow window;
}

class SongListWindow {
  
  SongListWindow() {

  }
}

// where the account, setting, etc. are 
class More {
  MoreWindow window;

  
}

class MoreWindow {
  
  MoreWindow() {
  
  }
}

class Info {
  
}

class InfoTime {
  
}

class InfoDate {
  
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

