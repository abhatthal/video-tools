# Sony Camera

Tools used to transfer videos from an old Sony Camera (AVCHD format)

## conv.sh
Converts MTS files to MP4 and retains date metadata.
### Usage:
```$ ./conv.sh *.MTS```
### Sources:
 * https://gist.github.com/wheel5up/86ee1b4fde5f3720777e89ca4873b890

## merge.py
Merges related MP4 videos by time difference
### Usage:
```$ ./merge.py *.mp4```


## concat.sh
Concatenates two MP4 videos into one.
### Usage:
Active virtual environment before running.

```$ ./merge.py input1.mp4 input2.mp4```
### Sources:
 * https://stackoverflow.com/questions/7333232/how-to-concatenate-two-mp4-files-using-ffmpeg
 * https://superuser.com/questions/1059245/ffmpeg-join-two-mp4-files-with-ffmpeg-on-command-line


## timediff.sh
Gets the difference in time between two MP4s
(end of first and start of second)
### Usage:
```$ ./timediff.sh input1.mp4 input2.mp4```
### Sources:
 * https://stackoverflow.com/a/29019048/15124812
 * https://unix.stackexchange.com/a/170973
 * https://unix.stackexchange.com/a/89748