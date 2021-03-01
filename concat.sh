#!/bin/bash
# Concatenates two MP4 videos into one.

exifdateformat='%Y:%m:%d %T'
ffmpegdateformat='%FT%T'

function concat {
  echo "concat ($1, $2) -> $1"
  # Get start time of first file
  exifcreatetime=$(exiftool -s -s -s -createdate $1)
  ffmpegcreatetime=$(date -j -f "$exifdateformat" "$exifcreatetime" +"$ffmpegdateformat")
  # Get intermediate files for lossless concatenation
  ffmpeg -y -hide_banner -loglevel error -i $1 -c copy -bsf:v h264_mp4toannexb -f mpegts intermediate1.ts
  ffmpeg -y -hide_banner -loglevel error -i $2 -c copy -bsf:v h264_mp4toannexb -f mpegts intermediate2.ts
  # Concatenate the files into first file using the start time of the first file
  ffmpeg -y -hide_banner -loglevel error -i "concat:intermediate1.ts|intermediate2.ts" -c copy -metadata creation_time=${ffmpegcreatetime}Z $1
  rm intermediate?.ts $2
}

concat "$@"
