#!/bin/bash
# Converts MTS files to MP4 and retains date metadata.

exifdateformat='%Y:%m:%d %T%z'
ffmpegdateformat='%FT%T'
filenamedateformat='%Y%m%d_%H%M%S'
for srcfile  in "$@"
do
  exifcreatetime=$(exiftool -s -s -s -datetimeoriginal $srcfile | sed -r 's/:(.{2})$/\1/g')
  ffmpegcreatetime=$(date -j -f "$exifdateformat" "$exifcreatetime" +"$ffmpegdateformat")
  filecreatetime=$(date -j -f "$exifdateformat" "$exifcreatetime" +"$filenamedateformat")
  echo "conv $srcfile -> ${filecreatetime}.mp4"
  ffmpeg -y -hide_banner -loglevel error -i $srcfile -c copy -metadata creation_time=${ffmpegcreatetime}Z ${filecreatetime}.mp4
done
