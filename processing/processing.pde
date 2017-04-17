import processing.sound.*;
// mirror size information
Mirror mainMirror;

int MIRROR_WIDTH = 2732;
int MIRROR_HEIGHT = 1536;

// icon size information
int ICON_OFFSET = MIRROR_WIDTH/4;
int ICON_SIZE = MIRROR_WIDTH/4/6;

// color selected at the moment
int BLACK = 10, BROWN = 11, RED = 12, BLUE = 13, YELLOW = 14;
int COLOR = BROWN;

// language selected at the moment
int ENGLISH = 1, CHINESE = 2;
int LANGUAGE = ENGLISH;

// selected window at the moment (related to ACCESSABLE_BUTTONS_ON_WINDOW), -1 mean none
int ON_WINDOW = -1;


int BUTTONX = ICON_SIZE;
int BUTTONY = ICON_SIZE;
// all buttons that are accessable on the main screen
int[][] ACCESSABLE_BUTTONS_ON_WINDOW = {

  // four app icons
  {ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8*6 + ICON_SIZE}, // weather
  {ICON_OFFSET+ICON_SIZE*2, MIRROR_HEIGHT/8*6 + ICON_SIZE}, // calendar
  {ICON_OFFSET+ICON_SIZE*3, MIRROR_HEIGHT/8*6 + ICON_SIZE}, // health
  {ICON_OFFSET+ICON_SIZE*4, MIRROR_HEIGHT/8*6 + ICON_SIZE}, // media
  // three in app icons 
  
  {ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8*5+ICON_SIZE/2 + ICON_SIZE}, // app icon 1
  {ICON_OFFSET+ICON_SIZE*3-ICON_SIZE/2, MIRROR_HEIGHT/8*5+ICON_SIZE/2 + ICON_SIZE}, // app icon 2
  {ICON_OFFSET+ICON_SIZE*4, MIRROR_HEIGHT/8*5+ICON_SIZE/2 + ICON_SIZE}, // app icon 3
  

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

  size(MIRROR_WIDTH, MIRROR_HEIGHT);
  background(224, 255, 255);
}

void draw() {
  mainMirror.draw();
}

void mouseDragged() {
	mainMirror.musicPlayer.mouseDragged();
}

void mouseReleased() {
  boolean hitSomeButton = false;
  mainMirror.musicPlayer.clicked();

  for (int loopCounter=0; loopCounter < ACCESSABLE_BUTTONS_ON_WINDOW.length; loopCounter++){
      if ((mouseX > ACCESSABLE_BUTTONS_ON_WINDOW[loopCounter][0]) 
      && (mouseX < ACCESSABLE_BUTTONS_ON_WINDOW[loopCounter][0]+BUTTONX)
      && (mouseY > ACCESSABLE_BUTTONS_ON_WINDOW[loopCounter][1]) 
      && (mouseY < ACCESSABLE_BUTTONS_ON_WINDOW[loopCounter][1]+BUTTONY)){
        

        if (loopCounter == 0) {
          // app 1
          ON_WINDOW = loopCounter;
          mainMirror.apps.clicked(loopCounter);
        } else if (loopCounter == 1) {
          // app 2
          ON_WINDOW = loopCounter;
          mainMirror.apps.clicked(loopCounter);
        } else if (loopCounter == 2) {
          // app 3
          ON_WINDOW = loopCounter;
          mainMirror.apps.clicked(loopCounter);
        } else if (loopCounter == 3) {
          // app 4
          ON_WINDOW = loopCounter;
          mainMirror.apps.clicked(loopCounter);
        } else if (loopCounter == 4) {
          // app icon 1
          ON_WINDOW = loopCounter;
          mainMirror.apps.clicked(loopCounter);
        } else if (loopCounter == 5) {
          // app icon 2
          ON_WINDOW = loopCounter;
          mainMirror.apps.clicked(loopCounter);
        } else if (loopCounter == 6) {
          // app icon 3
          ON_WINDOW = loopCounter;
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

        
        hitSomeButton = true;
        //ON_WINDOW = loopCounter;
      } 

      else {
        //println("rrrrrrr");
      }
      
      
  }

  if (!hitSomeButton) {
    
        ON_WINDOW = -1;
        println("rrrrrrr");
        mainMirror.apps.unclicked(mouseX, mouseY);
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
  	//background(); //ADDED!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!@REWR$WER$#%FDSGREHGFDHFGHFGHFHGFHFGHGFHFGHGFHGFH
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

  boolean clickedOnWindow;

  int onMainIcon = -1;
  int onSubIcon = 0;

  ImageButton[][] englishWindow;
  ImageButton[][] chineseWindow;

  Apps() {

    setupMainIcons();

    setupEnglishWindow();
    setupChineseWindow();

  }

  void setupMainIcons() {
    PImage iconImage = loadImage("images/weather_icon.png");
    iconImage.resize(50, 50);
    weather = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8*6 + ICON_SIZE, iconImage, "weather");

    iconImage = loadImage("images/calendar_icon.png");
    //iconImage.resize(10, 0);
    calendar = new ImageButton(ICON_OFFSET+ICON_SIZE*2, MIRROR_HEIGHT/8*6 + ICON_SIZE, iconImage, "calendar");

    iconImage = loadImage("images/health_icon.png");
    //iconImage.resize(10, 0);
    health = new ImageButton(ICON_OFFSET+ICON_SIZE*3, MIRROR_HEIGHT/8*6 + ICON_SIZE, iconImage, "health");

    iconImage = loadImage("images/social_media.png");
    //iconImage.resize(10, 0);
    media = new ImageButton(ICON_OFFSET+ICON_SIZE*4, MIRROR_HEIGHT/8*6 + ICON_SIZE, iconImage, "media");
  }

  void setupEnglishWindow() {
    englishWindow = new ImageButton[4][3];

    // weather

    PImage appImage = loadImage("images/weather_window.png");
    englishWindow[0][0] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 3+ICON_SIZE/2, appImage, "weatherWindow");

    appImage = loadImage("images/weather_window.png");
    englishWindow[0][1] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 3+ICON_SIZE/2, appImage, "calendarWindow");
    
    appImage = loadImage("images/weather_window.png");
    englishWindow[0][2] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 3+ICON_SIZE/2, appImage, "healthWindow");
    
    // calendar

    appImage = loadImage("images/calendar_window.png");
    englishWindow[1][0] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 3+ICON_SIZE/2, appImage, "weatherWindow");

    appImage = loadImage("images/calendar_window.png");
    englishWindow[1][1] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 3+ICON_SIZE/2, appImage, "calendarWindow");
    
    appImage = loadImage("images/calendar_window.png");
    englishWindow[1][2] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 3+ICON_SIZE/2, appImage, "healthWindow");
    
    // health
    
    appImage = loadImage("images/steps_window.png");
    englishWindow[2][0] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 3+ICON_SIZE/2, appImage, "weatherWindow");

    appImage = loadImage("images/sleep_window.png");
    englishWindow[2][1] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 3+ICON_SIZE/2, appImage, "calendarWindow");
    
    appImage = loadImage("images/weight_window.png");
    englishWindow[2][2] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 3+ICON_SIZE/2, appImage, "healthWindow");
    
    // media

    appImage = loadImage("images/social_media_fb.png");
    englishWindow[3][0] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 3+ICON_SIZE/2, appImage, "weatherWindow");

    appImage = loadImage("images/social_media_YT.png");
    englishWindow[3][1] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 3+ICON_SIZE/2, appImage, "calendarWindow");
    
    appImage = loadImage("images/social_media_rss.png");
    englishWindow[3][2] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 3+ICON_SIZE/2, appImage, "healthWindow");
    

  }

  void setupChineseWindow() {
    chineseWindow = new ImageButton[4][3];

    // weather

    PImage appImage = loadImage("images/weather_window.png");
    chineseWindow[0][0] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 3+ICON_SIZE/2, appImage, "weatherWindow");

    appImage = loadImage("images/weather_window.png");
    chineseWindow[0][1] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 3+ICON_SIZE/2, appImage, "calendarWindow");
    
    appImage = loadImage("images/weather_window.png");
    chineseWindow[0][2] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 3+ICON_SIZE/2, appImage, "healthWindow");
    
    // calendar

    appImage = loadImage("images/calendar_window.png");
    chineseWindow[1][0] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 3+ICON_SIZE/2, appImage, "weatherWindow");

    appImage = loadImage("images/calendar_window.png");
    chineseWindow[1][1] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 3+ICON_SIZE/2, appImage, "calendarWindow");
    
    appImage = loadImage("images/calendar_window.png");
    chineseWindow[1][2] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 3+ICON_SIZE/2, appImage, "healthWindow");
    
    // health
    
    appImage = loadImage("images/steps_window.png");
    chineseWindow[2][0] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 3+ICON_SIZE/2, appImage, "weatherWindow");

    appImage = loadImage("images/sleep_window.png");
    chineseWindow[2][1] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 3+ICON_SIZE/2, appImage, "calendarWindow");
    
    appImage = loadImage("images/weight_window.png");
    chineseWindow[2][2] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 3+ICON_SIZE/2, appImage, "healthWindow");
    
    // media

    appImage = loadImage("images/social_media_fb.png");
    chineseWindow[3][0] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 3+ICON_SIZE/2, appImage, "weatherWindow");

    appImage = loadImage("images/social_media_YT.png");
    chineseWindow[3][1] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 3+ICON_SIZE/2, appImage, "calendarWindow");
    
    appImage = loadImage("images/social_media_rss.png");
    chineseWindow[3][2] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 3+ICON_SIZE/2, appImage, "healthWindow");
    

  }

  void unclicked(int mouseX, int mouseY) {
    if (ICON_OFFSET+ICON_SIZE*1 < mouseX && mouseX < ICON_OFFSET+ICON_SIZE*1 + ICON_SIZE*4
     && MIRROR_HEIGHT/8*3+ICON_SIZE/2 < mouseY && mouseY < MIRROR_HEIGHT/8*3+ICON_SIZE*5+ICON_SIZE/2) {    
      clickedOnWindow = true;
    println("hhhhhh");
    } else {
      clickedOnWindow = false;
    }
  }

  // event handler
  void clicked(int clickedIndex) {
    switch (clickedIndex) {
      case 0 :
        println("weather");
        
        if (onMainIcon == 0) {
          onMainIcon = -1;
        } else {
          onMainIcon = 0;
        }

        onSubIcon = 0;
      break;

      case 1 :
        println("calendar");
        
        if (onMainIcon == 1) {
          onMainIcon = -1;
        } else {
          onMainIcon = 1;
        }

        onSubIcon = 0;
      break;

      case 2 :
        println("health");
        
        if (onMainIcon == 2) {
          onMainIcon = -1;
        } else {
          onMainIcon = 2;
        }
        
        onSubIcon = 0;
      break;

      case 3 :
        println("media");
        
        if (onMainIcon == 3) {
          onMainIcon = -1;
        } else {
          onMainIcon = 3;
        }
        
        onSubIcon = 0;
      break;

      case 4 :
        println("app icon 1");
        onSubIcon = 0;
      break;

      case 5 :
        println("app icon 2");
        onSubIcon = 1;
      break;

      case 6 :
        println("app icon 3");
        onSubIcon = 2;
      break;

      default:
      //panic!!
    }
  }

  void draw() {
    weather.display();
    calendar.display();
    health.display();
    media.display();

    if (0 <= ON_WINDOW && ON_WINDOW <= 6 && onMainIcon != -1 || clickedOnWindow && onMainIcon != -1) {
      switch (COLOR) {
        case BLACK:
          fill(0);
        break;

        case BROWN:
          fill(139,69,19);
        break;

        case RED:
          fill(255,69,0);
        break;

        case BLUE:
          fill(30,144,255);
        break;

        case YELLOW:
          fill(255,236,139);
        break;

        default:
          fill(0);


      }
      rect(ICON_OFFSET+ICON_SIZE*1-2, MIRROR_HEIGHT/8*3-2+ICON_SIZE/2, // x and y
      ICON_SIZE*4, ICON_SIZE*5,                        // width and height
      7);;         
      
      if (LANGUAGE == ENGLISH) {
        englishWindow[onMainIcon][onSubIcon].display();
      } else {
        chineseWindow[onMainIcon][onSubIcon].display();
      }
    } else {
      onMainIcon = -1;
      fill(224, 255, 255);
      rect(ICON_OFFSET+ICON_SIZE*1-3, MIRROR_HEIGHT/8*3-3+ICON_SIZE/2, // x and y
      ICON_SIZE*4+6, ICON_SIZE*5+6,                        // width and height
      7);;                                             // roundness
    }

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

    PImage appImage = loadImage("chinese.jpg");
    images[0] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "weatherWindow");

    appImage = loadImage("chinese.jpg");
    images[1] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "calendarWindow");
    
    appImage = loadImage("chinese.jpg");
    images[2] = new ImageButton(ICON_OFFSET+ICON_SIZE*1, MIRROR_HEIGHT/8 * 5, appImage, "healthWindow");
    
    appImage = loadImage("chinese.jpg");
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
  double music_x = ICON_OFFSET+ICON_SIZE* 5;
  double music_y = MIRROR_HEIGHT/8*6 + ICON_SIZE;
  double width = ICON_SIZE * 5;
  double height = ICON_SIZE;
  PImage playButton = loadImage("images/playerMainButtons.png");
  PImage pauseButton = loadImage("images/pauseButton.png");
  boolean paused = true;
  Audio audio = new Audio();

  double lineBeginX = music_x + ICON_SIZE * 1.5;
  double lineBeginY = music_y + ICON_SIZE / 2;
  double lineEndX = lineBeginX + 2 * ICON_SIZE;
  double lineLength = lineEndX - lineBeginX;
  double songPoint = lineBeginX;
  double playLocation = music_x + ICON_SIZE / 4;
  String[] musicList = {"1.mp3", "2.mp3", "3.mp3", "4.mp3", "5.mp3"};
  String[] musicName = {"Emancipator - Minor Cause", "Emancipator - 2","Emancipator - 3","Emancipator - 4","Emancipator - 5"};
  int numTracks = 5;
  int songIndex = 0;

  boolean muted = false;
  double soundIconX = lineEndX;
  PImage speakerMute = loadImage("images/speakerMute.png");
  PImage speakerOn = loadImage("images/speakerOn.png");

  // PImage prevButton = loadImage("images/prevButton.png");
  // PImage forwardButton = loadImage("images/forwardButton.png");
  

  MusicPlayer() {
    songListWindow = new SongListWindow();
    loadSong(songIndex);
  }

  void loadSong(int index){
  	audio.src = "http://procopi2.people.uic.edu/songs/" + musicList[index];
  }

  void draw() {
    songListWindow.draw();
    fill(255, 255, 255);
    rect(music_x, music_y, width, height, 20);

    //println(audio.currentTime + " " + audio.duration);
    double percent;
    if(audio.currentTime <= 0){
    	percent = 0;
    }else{
    	percent = audio.currentTime / audio.duration;
    }

    if(!mousePressed){
    	songPoint = (lineLength * percent) + lineBeginX;
    }

    line(lineBeginX,lineBeginY, lineEndX ,lineBeginY);
    ellipse(songPoint, lineBeginY, ICON_SIZE / 8, ICON_SIZE / 8);

    fill(0, 0, 0);
	text(musicName[songIndex], lineBeginX, music_y + ICON_SIZE / 4);
    if(paused){
    	image(playButton, playLocation, music_y, ICON_SIZE, ICON_SIZE);    	
    }else{
		image(pauseButton, playLocation, music_y, ICON_SIZE, ICON_SIZE);
    }

    if(muted){
    	audio.muted = true;
    	image(speakerMute, soundIconX, music_y + ICON_SIZE/4, ICON_SIZE/2, ICON_SIZE/2);
    }else{
    	audio.muted = false;
    	image(speakerOn, soundIconX, music_y +ICON_SIZE/4, ICON_SIZE/2, ICON_SIZE/2);
    }

    if(audio.ended && songIndex < numTracks - 1){
    	loadSong(++songIndex);
    	audio.play();
    } else if(audio.ended && songIndex == numTracks - 1){
    	audio.currentTime = 0;
    	paused = true;
    }

    
    //image(prevButton, music_x + ICON_SIZE / 4 , music_y + ICON_SIZE / 3, ICON_SIZE / 4 , ICON_SIZE / 4);
    //image(forwardButton, music_x + ICON_SIZE + ICON_SIZE / 4, music_y + ICON_SIZE / 3, ICON_SIZE / 4, ICON_SIZE / 4);
  
  }

  void mouseDragged(){
    if ((mouseX > lineBeginX) && (mouseX < lineEndX) && (mouseY > lineBeginY - 10) && (mouseY < lineBeginY + 10)){
    	int percent = (mouseX - lineBeginX) / lineLength;
    	songPoint = (lineLength * percent) + lineBeginX;
    }
  }

  
  void clicked() {
  	//play and pause
  	if ((mouseX > playLocation + ICON_SIZE / 3) && (mouseX < playLocation + (ICON_SIZE * (2 / 3))) && (mouseY > music_y  + ICON_SIZE / 3) && (mouseY < (ICON_SIZE * (2 / 3)) + music_y)){
  		paused ^= true;
    }

    //back button
  	if ((mouseX > playLocation) && (mouseX < playLocation + ICON_SIZE / 3) && (mouseY > music_y  + ICON_SIZE / 3) && (mouseY < (ICON_SIZE * (2 / 3)) + music_y)){
  		if(audio.currentTime < 2 && songIndex > 0){
  			loadSong(--songIndex);
  		}else{
  			audio.currentTime = 0;
  		}
    }

  	if ((mouseX > playLocation + (ICON_SIZE * (2 / 3))) && (mouseX < playLocation + ICON_SIZE) && (mouseY > music_y  + ICON_SIZE / 3) && (mouseY < (ICON_SIZE * (2 / 3)) + music_y)){
  		if(songIndex < numTracks - 1){
  			loadSong(++songIndex);
  		}
    }    

    if ((mouseX > lineBeginX) && (mouseX < lineEndX) && (mouseY > lineBeginY - 5) && (mouseY < lineBeginY + 5)){
    	double currentPoint = (mouseX - lineBeginX) / lineLength;
  		audio.currentTime = audio.duration * currentPoint;
    }

    if ((mouseX > soundIconX + 10) && (mouseX < soundIconX + ICON_SIZE/2) && (mouseY > music_y  + ICON_SIZE / 4) && (mouseY < music_y  + (ICON_SIZE / 4) + (ICON_SIZE / 2))){
  		muted ^= true;
    }

  	if(paused){
  		audio.pause();
  	} else{
  		audio.play();
  	}
  	
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