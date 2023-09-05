import java.nio.file.Paths;

int frame = 735;

void setup() {
  size(1920, 1080);
}

void draw() {
  String filename = String.format("frame%04d.png", frame);
  String filepath = Paths.get(sketchPath(), "..", "raw", filename).toString();
  PImage img = loadImage(filepath);
  image(img, 0, 0);
  
  fill(255, 0, 255);
  textSize(64);
  text(filename, 100, 100);
  
  noLoop();
}

void mouseClicked() {
  println(mouseX, mouseY);
}

void keyPressed() {
  if (keyCode == LEFT) {
    --frame;
    loop();
  } else if (keyCode == RIGHT) {
    ++frame;
    loop();
  }
}
