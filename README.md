# Video Tools

Collection of tools to help extract and merge video clips from Sony AVCHD camcorders.

## Dependencies
You must be on macOS or Linux.

Install [Homebrew](https://brew.sh) or use another package manager.

```$ xargs brew install < brew.txt```

## Workflow
The following workflow works for my HDR-SR10 using macOS 11.2.2
1. Use USB Connect to get videos off camera
2. Navigate to `AVCHD/BDMV/STREAM` to access MTS files.
3. `conv.sh` on all MTS files to get MP4 files.

(WARNING: Don't delete MTS files without verifying that MP4 files are not corrupted)

4. `merge.py` on newly generated MP4 files to merge videos taken closely together
5. `find_short.py` on these MP4 files to find remaining files that are really small.

I suggest manually reviewing these files before deleting them:

```$ rm $(./find_short.py 5 *.mp4)```

## Documentation

### concat.sh
**Concatenates two MP4 videos into one.**

Takes two MP4 files as inputs.

The contents of input2 are appended to the end of input1 and input2 is deleted.

This is a destructive operation, so make sure to save your original MP4s.
#### Usage:
```$ ./concat.sh input1.mp4 input2.mp4```

### conv.sh
**Converts MTS files to MP4 and retains date metadata.**

Takes at least one input MTS file.

Results in one MP4 file for each MTS file.

Does not delete MTS files.

Operation is non-destructive.
#### Usage:
```$ ./conv.sh *.MTS```

### duration.py
**Calculates the total duration of given videos.**

Takes at least one input MP4 file.

Operation is non-destructive.
#### Usage:
```$ ./duration.py *.mp4```

### find_short.py
**Lists all very short videos.**

Takes an integer for number of seconds maximum and at least one MP4 file.

Only lists files, does not delete them for you.

Operation is non-destructive.
#### Usage:
Find videos under 5 seconds in length.

```$ ./find_short.py 5 *.mp4```

### merge.py
**Merges related MP4 videos by time difference**

Takes at least two input MP4 files.

Uses `concat.sh` to merge MP4 videos and merges on maximum time difference calculated by `timediff.sh`

This is a destructive operation, as it calls `concat.sh`. Make sure to save your videos before using this.
#### Usage:
```$ ./merge.py *.mp4```

### timediff.sh
**Gets the difference in time between two MP4s.**

Takes two MP4 files as inputs.

Gets the number of seconds since the first video ended and the second video began.

Operation is non-destructive.
#### Usage:
```$ ./timediff.sh input1.mp4 input2.mp4```
