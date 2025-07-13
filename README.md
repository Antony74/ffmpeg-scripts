# ffmpeg-scripts

Writing ffmpeg command lines can get

* sufficiently fiddly that it's worth writing code to construct them,
* unintuitive such that it may help to keep a record of useful manipulations that I have learnt.


## Cropping

    ffmpeg -ss 00:01.0 -i polygons.mkv -to 00:48.0 -vf "crop=700:700:10:50" polygons.mp4

This is a useful example of cropping both spatially and in time.