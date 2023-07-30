import moviepy.editor as mpy
from moviepy.video.fx.all import crop

clip = mpy.VideoFileClip("k.mov").subclip((0,00.00),(0,1.00)).resize(height=1280)
if(clip.w<720):
    clip = mpy.VideoFileClip("k.mov").subclip((0,00.00),(0,1.00)).resize(width=720)
(w, h) = clip.size
cropped_clip = crop(clip, width=720, height=1280, x_center=w/2, y_center=h/2)
cropped_clip.write_videofile('video.mp4', codec="libx264")