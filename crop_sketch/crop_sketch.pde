import java.nio.file.Paths;

void setup() {
  size(300, 300);

  int imgWidth = 716;
  int imgHeight = 716;
  
  int newFrame = 1;
  
//  for (int frame = 869; frame <= 3091; ++frame) { // Koch Snowflake
  for (int frame = 4494; frame <= 7305; ++frame) { // Hilbert curve
    String filename = String.format("frame%04d.png", frame);
    String newFilename = String.format("frame%04d.png", newFrame);
    String srcPath = Paths.get(sketchPath(), "..", "raw", filename).toString();
    
    // Kock Snowflake
  //  String destPath = Paths.get(sketchPath(), "..", "koch-snowflake", newFilename).toString();
    // Hilbert curve
    String destPath = Paths.get(sketchPath(), "..", "hilbert-curve", newFilename).toString();
    ++newFrame;
  
    PImage src = loadImage(srcPath);
    PImage dest = createImage(imgWidth, imgHeight, RGB);
  
    // Kock Snowflake
    //dest.copy(src, 57, 286, imgWidth, imgHeight, 0, 0, imgWidth, imgHeight);
    
    // Hilbert curve
    dest.copy(src, 57, 167, imgWidth, imgHeight, 0, 0, imgWidth, imgHeight);

    dest.save(destPath);

    println(filename);
  }

  background(0, 255, 0);
}
