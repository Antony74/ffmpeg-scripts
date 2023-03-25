const secs = (time) => {
  [m, s] = time.split(`:`).map((v) => parseInt(v));
  return m * 60 + s;
};

const between = (start, end) => `'between(t,${secs(start)},${secs(end)})'`;

// Start a timer at 11:44, counting down from nine minutes

const timer = 60 * 9 + 1 + secs("11:44");

const params1 = {
  fontcolor: `black`,
  fontsize: 60,
  x: 50,
  y: 900,
  enable: between(`11:44`, `20:35`),
  text: `'%{eif\\:trunc(mod(((${timer}-t)/60),60))\\:d\\:2}\\:%{eif\\:trunc(mod(${timer}-t\\,60))\\:d\\:2}'`,
};

// At 20:35 with ten seconds left the timer pauses
const params2 = {
  ...params1,
  enable: between(`20:35`, `20:57`),
  text: `'00\\:10'`,
};

const paramString = (p) =>
  Object.keys(p)
    .map((k) => `${k}=${p[k]}`)
    .join(`:`);

const cmd = [
  `ffmpeg -i output03.mp4 -vf `,
  `"[in]`,
  `drawtext=${paramString(params1)}`,
  `,`,
  `drawtext=${paramString(params2)}`,
  `[out]" `,
  `output.mp4`,
].join(``);

// Extract two pieces of the video
console.log(`ffmpeg -ss 00:08.0 -i raw.mkv -c copy -to 03:12.0 output01.mp4`);
console.log(`ffmpeg -ss 03:44.0 -i raw.mkv -c copy -to 17:50.0 output02.mp4`);

// Splice them back together.  Net effect is that a small chunk's cut out of it.
// I had to wait while `npm install` happens, but there's no reason why anyone viewing the video should have to.
console.log(`ffmpeg -safe 0 -f concat -i list.txt -c copy output03.mp4`);

// Write out the command needed to add the timer to the video
console.log(cmd);
