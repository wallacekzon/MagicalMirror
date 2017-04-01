
int BROIL = 0,
  WARM = 2,
  TOAST = 4,
  PIZZA = 6,
  BAKE = 8;

Microwave mw;


int POWER = 0,
QUICKTOAST = 1,
TEMPCF = 2,
HEATMODE = 3,
TEMPFASTUP = 4,
TEMPSLOWUP = 5,
TEMPSLOWDOWN = 6,
TEMPFASTDOWN = 7,
TIMERFASTUP = 8,
TIMERSLOWUP = 9,
TIMERSLOWDOWN = 10,
TIMERFASTDOWN = 11,
STOPREST = 12,
STARTPAUSE = 13;

int[][] BUTTONS = { {830, 280}, {845, 570}, {835, 420}, {835, 475}, 
                    {1020, 300}, {1020, 380}, {1020, 530}, {1020,580}, 
                    {1135, 300}, {1135, 380}, {1135, 530}, {1135, 580}, 
                    {972, 700}, {1100, 700} };

int BUTTONX = 90;
int BUTTONY = 60;



void setup(){
  mw = new Microwave();

  size(1280, 800);
  background(200);
  stroke(255);

  //panel
  fill(255);
  rect(750, 25, 500, 750);

  // screens
  fill(120);
  rect(775, 50, 450, 180);
  rect(980, 420, 110, 100);
  rect(1100, 420, 110, 100);

  //heating indicating light
  ellipse(825, 725, 25, 25);
  fill(200);
  textFont(createFont("Arial",18,true));
  text("Heating", 850, 730);
}

void draw() {
  mw.update();
  mw.timer.display();
  //println(mw.currentTime.toString());
}

void mouseReleased() {
  for (int loopCounter=0; loopCounter < BUTTONS.length; loopCounter++){
      if ((mouseX > BUTTONS[loopCounter][0]) && (mouseX < BUTTONS[loopCounter][0]+BUTTONX)
      && (mouseY > BUTTONS[loopCounter][1]) && (mouseY < BUTTONS[loopCounter][1]+BUTTONY)){
        //selectedOne = loopCounter;
        
        if (loopCounter == POWER) {
          if (mw.isOn || mw.panel.mainScreenIsOn) {
            mw.timer.reset();

            fill(120);
            rect(775, 50, 450, 180);
            rect(980, 420, 110, 100);
            rect(1100, 420, 110, 100);
            
            mw.isOn = false;
            mw.panel.mainScreenIsOn = false;
          } else {
            fill(200);
            rect(775, 50, 450, 180);
            rect(980, 420, 110, 100);
            rect(1100, 420, 110, 100);

            mw.isOn = true;
            mw.panel.mainScreenIsOn = true;
          }
        } else if (loopCounter == QUICKTOAST && mw.panel.mainScreenIsOn) {
          mw.heatMode.selectedIndex = TOAST;
          mw.heatTime = 5;
        } else if (loopCounter == TEMPFASTUP && mw.panel.mainScreenIsOn) {
          if (mw.heatMode.selectedIndex + 2 <= 9) {
            mw.heatMode.selectedIndex += 2;
          }
        } else if (loopCounter == TEMPSLOWUP && mw.panel.mainScreenIsOn) {
          if (mw.heatMode.selectedIndex + 1 <= 9) {
            mw.heatMode.selectedIndex += 1;
          }
        } else if (loopCounter == TEMPSLOWDOWN && mw.panel.mainScreenIsOn) {
          if (mw.heatMode.selectedIndex - 1 >= 0) {
            mw.heatMode.selectedIndex -= 1;
          }
        } else if (loopCounter == TEMPFASTDOWN && mw.panel.mainScreenIsOn) {
          if (mw.heatMode.selectedIndex - 2 >= 0) {
            mw.heatMode.selectedIndex -= 2;
          }
        } else if (loopCounter == TIMERFASTUP && mw.panel.mainScreenIsOn) {
          if (mw.heatTime + 10 <= 60) {
            mw.heatTime += 10;
          }
        } else if (loopCounter == TIMERSLOWUP && mw.panel.mainScreenIsOn) {
          if (mw.heatTime + 1 <= 60) {
            mw.heatTime += 1;
          }
        } else if (loopCounter == TIMERSLOWDOWN && mw.panel.mainScreenIsOn) {
          if (mw.heatTime - 1 >= 0) {
            mw.heatTime -= 1;
          }
        } else if (loopCounter == TIMERFASTDOWN && mw.panel.mainScreenIsOn) {
          if (mw.heatTime - 10 >= 0) {
            mw.heatTime -= 10;
          }
        } else if (loopCounter == STOPREST && mw.panel.mainScreenIsOn) {
          mw.timer.reset();
        } else if (loopCounter == STARTPAUSE && mw.panel.mainScreenIsOn) {
          if (!mw.isOn) {
            mw.timer = new Timer(mw.heatTime * 60);
            mw.isOn = true;
            println("aaaaaa");
          }

          mw.timer.startPause();
          println("startpause");
        } 

        //start = !start;
      }
      
  }
}


class HeatMode {
  int selectedIndex;

  String[] name = new String[10];
  int[] temperature = new int[10];

  HeatMode() {
    name[BROIL] = new String("Broil");
    name[BROIL+1] = new String("Broil");
    name[WARM] = new String("Warm");
    name[WARM+1] = new String("Warm");
    name[TOAST] = new String("Toast");
    name[TOAST+1] = new String("Toast");
    name[PIZZA] = new String("Pizza");
    name[PIZZA+1] = new String("Pizza");
    name[BAKE] = new String("Bake");
    name[BAKE+1] = new String("Bake");

    temperature[BROIL] = 50;
    temperature[BROIL+1] = 100;
    temperature[WARM] = 150;
    temperature[WARM+1] = 200;
    temperature[TOAST] = 250;
    temperature[TOAST+1] = 300;
    temperature[PIZZA] = 350;
    temperature[PIZZA+1] = 400;
    temperature[BAKE] = 450;
    temperature[BAKE+1] = 500;
  }

  HeatMode(int index) {
    HeatMode();

    selectedIndex = index;
  }

  public String getName() {
    return name[selectedIndex];
  }

  public int getTemperature() {
    return temperature[selectedIndex];
  }

  public void display() {
    fill(200);
    rect(990, 430, 90, 80);
    
    fill(0);
    textFont(createFont("Arial",32,true));
    text( getName(), 1000, 460);
    text( getTemperature(), 1010, 500);
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


class Panel {
  PShape mainScreen;
  boolean mainScreenIsOn;

  PShape tempScreen;
  PFont tempFont;

  PShape timerScreen;
  PFont timerFont;

  ImageButton power, quickToast;

  ImageButton tempSlowUp, tempSlowDown, tempFastUp, tempFastDown;

  ImageButton timerSlowUp, timerSlowDown, timerFastUp, timerFastDown;

  ImageButton  stopReset, startPause;

  PShape heatingLight;
  PFont heatingFont;

  public Panel() {
    PImage powerImage = loadImage("power.jpg");
    PImage quickToastImage = loadImage("quickToast.jpg");

    PImage a = loadImage("fastUp.jpg");
    PImage b = loadImage("slowUp.jpg");
    PImage c = loadImage("slowDown.jpg");
    PImage d = loadImage("fastDown.jpg");

    PImage startPauseImage = loadImage("startPause.jpg");
    PImage stopResetImage = loadImage("stopReset.jpg");

    power = new ImageButton(830, 280, powerImage, "power");
    quickToast = new ImageButton(845, 570, quickToastImage, "quickToast");

    tempFastUp = new ImageButton(1020, 300, a, "tempFastUp");
    tempSlowUp = new ImageButton(1020, 380, b, "tempSlowUp");
    tempSlowDown = new ImageButton(1020, 530, c, "tempSlowDown");
    tempFastDown = new ImageButton(1020, 580, d, "tempFastDown");

    timerFastUp = new ImageButton(1135, 300, a, "timerFastUp");
    timerSlowUp = new ImageButton(1135, 380, b, "timerSlowUp");
    timerSlowDown = new ImageButton(1135, 530, c, "timerSlowDown");
    timerFastDown = new ImageButton(1135, 580, d, "timerFastDown");

    stopReset = new ImageButton(972, 700, stopResetImage, "stopReset");
    startPause = new ImageButton(1100, 700, startPauseImage, "startPause");

    mainScreenIsOn = false;
  }

  public void display() {
    power.display();
    quickToast.display();

    tempSlowUp.display();
    tempSlowDown.display();
    tempFastUp.display();
    tempFastDown.display();

    timerSlowUp.display();
    timerSlowDown.display();
    timerFastUp.display();
    timerFastDown.display();

    stopReset.display();
    startPause.display();
  }

  public void update() {
    String pressedButton = null;
    String temp;

    temp = power.update();
    pressedButton = temp == null ? pressedButton : temp;
    temp = quickToast.update();
    pressedButton = temp == null ? pressedButton : temp;

    temp = tempSlowUp.update();
    pressedButton = temp == null ? pressedButton : temp;
    temp = tempSlowDown.update();
    pressedButton = temp == null ? pressedButton : temp;
    temp = tempFastUp.update();
    pressedButton = temp == null ? pressedButton : temp;
    temp = tempFastDown.update();
    pressedButton = temp == null ? pressedButton : temp;

    temp = timerSlowUp.update();
    pressedButton = temp == null ? pressedButton : temp;
    temp = timerSlowDown.update();
    pressedButton = temp == null ? pressedButton : temp;
    temp = timerFastUp.update();
    pressedButton = temp == null ? pressedButton : temp;
    temp = timerFastDown.update();
    pressedButton = temp == null ? pressedButton : temp;

    temp = stopReset.update();
    pressedButton = temp == null ? pressedButton : temp;
    temp = startPause.update();
    pressedButton = temp == null ? pressedButton : temp;

    pressedButtonHandler(pressedButton);
  }

  public void pressedButtonHandler(String pressedButton) {
    if (pressedButton == null) {
      return;
    } else if (pressedButton.equals(power) == true) {
      fill(200);
      rect(15, 50, 450, 180);
    } else if (pressedButton.equals(quickToast) == true) {
      println(pressedButton);
    } else if (pressedButton.equals(tempFastUp) == true) {
      println(pressedButton);
    } else if (pressedButton.equals(tempSlowUp) == true) {
      println(pressedButton);
    } else if (pressedButton.equals(tempSlowDown) == true) {
      println(pressedButton);
    } else if (pressedButton.equals(tempFastDown) == true) {
      println(pressedButton);
    } else if (pressedButton.equals(timerFastUp) == true) {
      println(pressedButton);
    } else if (pressedButton.equals(timerSlowUp) == true) {
      println(pressedButton);
    } else if (pressedButton.equals(timerSlowDown) == true) {
      println(pressedButton);
    } else if (pressedButton.equals(timerFastDown) == true) {
      println(pressedButton);
    } else if (pressedButton.equals(stopReset) == true) {
      println(pressedButton);
    } else if (pressedButton.equals(startPause) == true) {
      println(pressedButton);
    } 
  }
}

class Timer {
  boolean isOn;
  int timeAtStart;
  int timeAtPause;

  int timePassed;
  int timeRemaining;

  Timer () {
    timeAtStart = 0;
    timeAtPause = 0;
    timePassed = 0;
    timeRemaining = 0;
    isOn = false;
  }

  Timer (int timerLength) {
    timeAtStart = millis();
    timeRemaining = timerLength * 1000;

    timeAtPause = 0;
    timePassed = 0;

    isOn = false;
  }

  public void startPause() {
    if (isOn) {
      timeAtPause = millis();
      timePassed = timeAtPause - timeAtStart;
      timeRemaining = timeRemaining - timePassed;

      isOn = false;

      fill(120);
      ellipse(825, 725, 25, 25);
    } else {
      timeAtStart = millis();

      isOn = true;

      fill(255, 0, 0);
      ellipse(825, 725, 25, 25);
    }
  }

  public void reset() {
    timeAtStart = 0;
    timeAtPause = 0;
    timePassed = 0;
    timeRemaining = 0;

    isOn = true;
    display();
    isOn = false;
    mw.isOn = false;
  }

  public void display() {
    if (isOn && timeRemaining >= 0 && millis() - timeAtStart >= 1000) {
      int currentTime = millis();
      timePassed = currentTime - timeAtStart;
      timeAtStart = currentTime;
      timeRemaining = timeRemaining - timePassed;
      
      int minute = int(timeRemaining / 1000 / 60);
      int second = int(timeRemaining / 1000 % 60);
      
      minute = minute < 0 ? 0 : minute;
      second = second < 0 ? 0 : second;

      fill(200);
      rect(850, 90, 320, 110);
      
      fill(0);
      textFont(createFont("Arial",96,true));
      text( str(minute) + new String(" : ") + str(second), 920, 180);
      println(str(minute) + new String(" : ") + str(second) );
      //new String(minute < 10 ? "0" : "")
    } 

    if (timeRemaining <= 0){
      mw.isOn = false;
      isOn = false;
      fill(120);
      ellipse(825, 725, 25, 25);
    }
  } 

}

class Microwave {
  String currentTime;
  Timer timer;
  Panel panel;

  HeatMode heatMode;
  int heatTime;

  boolean isOn;


  public Microwave () {
    currentTime = new String ((hour() > 12 ? hour() - 12 : hour()) + ":" + minute());

    timer = new Timer();
    panel = new Panel();

    heatMode = new HeatMode();
    heatTime = 0;


    isOn = false;
  }

  public void setHeatTime(int time) {
    heatTime = time;
  }

  public void update() {
    //panel.update();
    panel.display();
    heatMode.display();

    heatTimeDisplay();
  }

  public void heatTimeDisplay() {
    fill(200);
    rect(1110, 430, 90, 80);
    
    fill(0);
    textFont(createFont("Arial",32,true));

    if (heatTime < 10) {
      text( str(heatTime) + new String(":00"), 1125, 480);
    } else {
      text( str(heatTime) + new String(":00"), 1115, 480);
    }
    
  }

}

