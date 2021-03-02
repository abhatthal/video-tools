#!/bin/bash
# Concatenates two MP4 videos into one.

exifdateformat='%Y:%m:%d %T'
ffmpegdateformat='%FT%T'

function get_fullpath {
  fullpath=$(cd "$(dirname "$1")"; pwd -P)/$(basename "$1")
}

function concat {
  echo "concat ($1, $2) -> $1"
  # Get start time of first file
  exifcreatetime=$(exiftool -s -s -s -createdate $1)
  ffmpegcreatetime=$(date -j -f "$exifdateformat" "$exifcreatetime" +"$ffmpegdateformat")
  get_fullpath $1
  echo "file $fullpath" > /tmp/concat.tmp
  get_fullpath $2
  echo "file $fullpath" >> /tmp/concat.tmp
  newvideo="/tmp/$(basename $1)"
  # Concatenate the files into first file using the start time of the first file
  ffmpeg -y -hide_banner -loglevel error -f concat -safe 0 -i /tmp/concat.tmp -c copy -metadata creation_time=${ffmpegcreatetime}Z $newvideo
  rm /tmp/concat.tmp $2
  mv $newvideo $1
}

concat "$@"
