# Sony Camera

Collection of tools to help extract and manage videos from my Sony HDR-SR10.

## Workflow
* Use USB Connect to get videos off camera
* Navigate to `AVCHD/BDMV/STREAM` to access MTS files.
* `conv.sh` on all MTS files to get MP4 files.

(WARNING: Don't delete MTS files without verifying that MP4 files are not corrupted)
* `merge.py` on newly generated MP4 files to merge videos taken closely together
* `find_short.py` on these MP4 files to find remaining files that are really small.

I suggest manually reviewing these files before deleting them:

```$ rm $(./find_short.py *.mp4)```

## concat.sh
Concatenates two MP4 videos into one.
### Usage:
```$ ./merge.py input1.mp4 input2.mp4```
### Sources:
 * https://stackoverflow.com/questions/7333232/how-to-concatenate-two-mp4-files-using-ffmpeg
 * https://superuser.com/questions/1059245/ffmpeg-join-two-mp4-files-with-ffmpeg-on-command-line
 * https://stackoverflow.com/a/3915420/15124812

## conv.sh
Converts MTS files to MP4 and retains date metadata.
### Usage:
```$ ./conv.sh *.MTS```
### Sources:
 * https://gist.github.com/wheel5up/86ee1b4fde5f3720777e89ca4873b890

## duration.py
Calculates the total duration of given videos
### Usage:
```$ ./timediff.sh *.mp4```

## find_short.py
Lists all very short videos
### Usage:
```$ ./find_short.py *.mp4```

## merge.py
Merges related MP4 videos by time difference
### Usage:
```$ ./merge.py *.mp4```

## timediff.sh
Gets the difference in time between two MP4s
(end of first and start of second)
### Usage:
```$ ./timediff.sh input1.mp4 input2.mp4```
### Sources:
 * https://stackoverflow.com/a/29019048/15124812
 * https://unix.stackexchange.com/a/170973
 * https://unix.stackexchange.com/a/89748
