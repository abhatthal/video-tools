#!/bin/bash

exifdateformat='%Y:%m:%d %T'
ffmpegdateformat='%FT%T'

function timediff {
  # Get start time in seconds of each file
  exifcreatetime1=$(exiftool -s -s -s -createdate $1)
  date1=$(date -j -f "$exifdateformat" "$exifcreatetime1" '+%s')
  exifcreatetime2=$(exiftool -s -s -s -createdate $2)
  date2=$(date -j -f "$exifdateformat" "$exifcreatetime2" '+%s')
  # Get duration of first file in seconds
  duration=$(ffprobe -v quiet -of csv=p=0 -show_entries format=duration $1)
  duration=${duration%.*}
  # Calculate end time in seconds of first file
  endtime=$(expr $date1 + $duration)
  # Get difference between end time of first file
  # and start time of second file
  printf $(expr $date2 - $endtime)
}

timediff "$@"
