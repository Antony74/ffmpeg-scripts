// Disassemble
console.log(`ffmpeg -r 1 -i raw.mkv -r 1 raw/frame%04d.png`);

// Assemble
console.log(`ffmpeg -framerate 30 -i raw/frame%04d.png -c:v libx264 -pix_fmt yuv420p out.mp4`);
