// Disassemble
console.log(`ffmpeg -r 1 -i raw.mkv -r 1 raw/frame%04d.png`);

// Assemble
console.log(`ffmpeg -framerate 60 -i koch-snowflake/frame%04d.png -c:v libx264 -pix_fmt yuv420p koch-snowflake.mp4`);
console.log(`ffmpeg -framerate 60 -i hilbert-curve/frame%04d.png -c:v libx264 -pix_fmt yuv420p hilbert-curve.mp4`);
