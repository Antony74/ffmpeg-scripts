import java.nio.file.Paths;

void setup() {
  size(300, 300);

  int imgWidth = 700;
  int imgHeight = 700;
  
  for (int frame = 869; frame <= 3091; ++frame) {
    String filename = String.format("frame%04d.png", frame);
    String srcPath = Paths.get(sketchPath(), "..", "raw", filename).toString();
    String destPath = Paths.get(sketchPath(), "..", "koch-snowflake", filename).toString();
  
    PImage src = loadImage(srcPath);
    PImage dest = createImage(imgWidth, imgHeight, RGB);
  
    dest.copy(src, 57, 286, imgWidth, imgHeight, 0, 0, imgWidth, imgHeight);
    dest.save(destPath);
  }

  background(0, 255, 0);
}
