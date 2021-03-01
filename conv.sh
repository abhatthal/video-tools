#!/bin/bash -x

exifdateformat='%Y:%m:%d %T%z'
ffmpegdateformat='%FT%T'
filenamedateformat='%Y%m%d_%H%M%S'
for srcfile  in "$@"
do
   exifcreatetime=$(exiftool -s -s -s -datetimeoriginal $srcfile | sed -r 's/:(.{2})$/\1/g')
   echo "Get date/time:$exifcreatetime"
   ffmpegcreatetime=$(date -j -f "$exifdateformat" "$exifcreatetime" +"$ffmpegdateformat")
   echo "transformed date/time:$ffmpegcreatetime"
   filecreatetime=$(date -j -f "$exifdateformat" "$exifcreatetime" +"$filenamedateformat")
   echo "filename date/time:$filecreatetime"
   echo "Get value:$srcfile"
   ffmpeg -i $srcfile -c copy -metadata creation_time=${ffmpegcreatetime}Z ${filecreatetime}.mp4
done
